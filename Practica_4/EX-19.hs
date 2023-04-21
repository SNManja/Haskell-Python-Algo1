esSumaInicialDePrimos :: Integer -> Bool
esSumaInicialDePrimos n = esSumaInicialDePrimosAux n 0 1

esSumaInicialDePrimosAux :: Integer -> Integer -> Integer -> Bool 
esSumaInicialDePrimosAux n s i | (n == s) = True
                            | (n < s) = False
                            | esPrimo i = esSumaInicialDePrimosAux n (s+i) (i+1)
                            | otherwise = esSumaInicialDePrimosAux n s (i+1)

-- Es un arreglo vago el poner el 1 y 2 como caso base. Pero funciona y el algoritmo con la raiz es mas eficiente que cualquier otro
esPrimo :: Integer -> Bool
esPrimo 1 = False
esPrimo 2 = True
esPrimo m = esPrimoAux m 2

esPrimoAux :: Integer -> Integer -> Bool
esPrimoAux m c | c > (ceiling (sqrt (fromIntegral m))) = True
               | mod m c == 0 = False
               | otherwise = esPrimoAux m (c+1)

