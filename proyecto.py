def palabra_mas_larga_construida(diccionario):
    diccionario.sort(key=len, reverse=True)
    for palabra in diccionario:
        if se_puede_formar(palabra, diccionario):
            return palabra
    return ""

def se_puede_formar(palabra, diccionario):
    otras_palabras = set(diccionario)
    otras_palabras.discard(palabra)
    cola = [0]

    while cola:
        i = cola.pop(0)
        for j in range(i + 1, len(palabra) + 1):
            if palabra[i:j] in otras_palabras:
                if j == len(palabra):
                    return True  
                cola.append(j)

    return False
diccionario = [
    "cat", "cats", "catsdogcats", "dog", "dogcatsdog",
    "hippopotamuses", "rat", "ratcatdogcat"
]

resultado = palabra_mas_larga_construida(diccionario)
print("La palabra más larga construida por otras es:", resultado)
