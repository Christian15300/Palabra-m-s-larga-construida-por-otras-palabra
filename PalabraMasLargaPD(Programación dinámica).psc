Algoritmo PalabraMasLargaPD
    Definir diccionario Como Cadena
    Definir palabrasOrdenadas Como Cadena
    Definir dp Como Logico
    Definir palabraMasLarga, palabraActual, prefijo, sufijo, temp Como Cadena
    Definir i, j, k, m, longActual Como Entero
    Definir exito Como Logico
	
    // Diccionario
    Dimension diccionario[8]
    diccionario[1] <- "a"
    diccionario[2] <- "b"
    diccionario[3] <- "ab"
    diccionario[4] <- "ba"
    diccionario[5] <- "abc"
    diccionario[6] <- "cba"
    diccionario[7] <- "abcb"
    diccionario[8] <- "abcbab"
	
    // Copiar y ordenar palabras por longitud ascendente
    Dimension palabrasOrdenadas[8]
    Para i <- 1 Hasta 8 Hacer
        palabrasOrdenadas[i] <- diccionario[i]
    FinPara
	
    // Burbuja para ordenar por longitud
    Para i <- 1 Hasta 7 Hacer
        Para j <- 1 Hasta 8 - i Hacer
            Si Longitud(palabrasOrdenadas[j]) > Longitud(palabrasOrdenadas[j + 1]) Entonces
                temp <- palabrasOrdenadas[j]
                palabrasOrdenadas[j] <- palabrasOrdenadas[j + 1]
                palabrasOrdenadas[j + 1] <- temp
            FinSi
        FinPara
    FinPara
	
    // Inicializar DP
    Dimension dp[8]
    Para i <- 1 Hasta 8 Hacer
        dp[i] <- Falso
    FinPara
	
    palabraMasLarga <- ""
	
    // Evaluar cada palabra
    Para i <- 1 Hasta 8 Hacer
        palabraActual <- palabrasOrdenadas[i]
        longActual <- Longitud(palabraActual)
		
        Si longActual = 1 Entonces
            dp[i] <- Verdadero
        Sino
            exito <- Falso
            j <- 1
            Mientras j < longActual Y No exito Hacer
                prefijo <- Subcadena(palabraActual, 1, j)
                sufijo <- Subcadena(palabraActual, j + 1, longActual)
				
                Para k <- 1 Hasta i - 1 Hacer
                    Si palabrasOrdenadas[k] = prefijo Y dp[k] Entonces
                        Para m <- 1 Hasta i - 1 Hacer
                            Si palabrasOrdenadas[m] = sufijo Y dp[m] Entonces
                                exito <- Verdadero
                                dp[i] <- Verdadero
                            FinSi
                        FinPara
                    FinSi
                FinPara
				
                j <- j + 1
            FinMientras
        FinSi
		
        Si dp[i] Y Longitud(palabraActual) > Longitud(palabraMasLarga) Entonces
            palabraMasLarga <- palabraActual
        FinSi
    FinPara
	
    // Resultado
    Si palabraMasLarga <> "" Entonces
        Escribir "La palabra más larga construible es: ", palabraMasLarga
        Escribir "Longitud: ", Longitud(palabraMasLarga)
    Sino
        Escribir "Ninguna palabra puede construirse con otras del conjunto"
    FinSi
FinAlgoritmo