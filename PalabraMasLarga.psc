Algoritmo PalabraMasLarga
   
    Definir diccionario Como Cadena
    Definir palabraMasLargad Como Cadena
    Definir longitudMaxima Como Entero
    Definir i, j, k Como Entero
    Definir tamanioDiccionario Como Entero
    Definir palabraActual Como Cadena
    
    
    Dimension diccionario[11]
    diccionario[1] <- "palabra"
    diccionario[2] <- "palabras"
    diccionario[3] <- "ra"
    diccionario[4] <- "raza"
    diccionario[5] <- "za"
    diccionario[6] <- "z"
    diccionario[7] <- "a"
    diccionario[8] <- "b"
    diccionario[9] <- "ab"
    diccionario[10] <- "abab"
    diccionario[11] <- "ababab"
    
    tamanioDiccionario <- 11
    longitudMaxima <- 0
    palabraMasLargad <- ""
    

    Para i Desde 1 Hasta tamanioDiccionario Hacer
        palabraActual <- diccionario[i]
        
        
        Si puedeConstruirse(palabraActual, diccionario, tamanioDiccionario, i) Entonces
            Si Longitud(palabraActual) > longitudMaxima Entonces
                longitudMaxima <- Longitud(palabraActual)
                palabraMasLargad <- palabraActual
            FinSi
        FinSi
    FinPara
    
    
    Si palabraMasLargad <> "" Entonces
        Escribir "La palabra más larga que puede ser construida es: ", palabraMasLargad
        Escribir "Su longitud es: ", longitudMaxima
    SiNo
        Escribir "No se encontró ninguna palabra que pueda ser construida por otras."
    FinSi
FinAlgoritmo


Funcion resultado <- existeEnDiccionario(palabra, diccionario, tamanio, excluirIndice)
    Definir i Como Entero
    Definir resultado Como Logico
    
    resultado <- Falso
    Para i Desde 1 Hasta tamanio Hacer
        Si i <> excluirIndice Y diccionario[i] = palabra Entonces
            resultado <- Verdadero
        FinSi
    FinPara
Fin Funcion


Funcion resultado <- puedeConstruirse(palabra, diccionario, tamanio, indiceOriginal)
    Definir longPalabra Como Entero
    Definir i Como Entero
    Definir prefijo Como Cadena
    Definir sufijo Como Cadena
    Definir resultado Como Logico
    
    longPalabra <- Longitud(palabra)
    resultado <- Falso

    Si longPalabra = 0 Entonces
        resultado <- Verdadero
    SiNo
       
        Para i Desde 1 Hasta longPalabra - 1 Hacer
            Si resultado = Falso Entonces
                prefijo <- Subcadena(palabra, 1, i)
                sufijo <- Subcadena(palabra, i + 1, longPalabra)
                
                
                Si existeEnDiccionario(prefijo, diccionario, tamanio, indiceOriginal) Entonces
                    
                    Si puedeConstruirse(sufijo, diccionario, tamanio, indiceOriginal) Entonces
                        resultado <- Verdadero
                    FinSi
                FinSi
            FinSi
        FinPara
    FinSi
Fin Funcion