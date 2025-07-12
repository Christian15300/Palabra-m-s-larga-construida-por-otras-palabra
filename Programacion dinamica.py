def palabra_mas_larga_construida(diccionario):
    diccionario.sort(key=len, reverse=True)  
    palabra_set = set(diccionario)  
    memo = {}  
    
    for palabra in diccionario:
        if se_puede_formar(palabra, palabra_set, memo):
            return palabra
    return ""

def se_puede_formar(palabra, palabra_set, memo):
    if palabra in memo:  
        return memo[palabra]

    if palabra in palabra_set:
        memo[palabra] = True
        return True

    for i in range(1, len(palabra)):
        prefijo = palabra[:i]
        sufijo = palabra[i:]

        if prefijo in palabra_set and se_puede_formar(sufijo, palabra_set, memo):
            memo[palabra] = True  
            return True
    
    memo[palabra] = False 
    return False

diccionario = [
    "sol", "nube", "rayo", "arco", "iris", 
    "arcoiris", "nubesol", "rayosol", 
    "nubes", "cielo", "rayocielo", "cielonube", "nubesolrayocielo"
]

resultado = palabra_mas_larga_construida(diccionario)
print("La palabra más larga construida por otras es:", resultado)