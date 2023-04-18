-- p > 1 es primo si y solo si no existe un entero k tal que 1 < k < p y k divida a p
-- Hay algo que agrego yo. Esta probado matematicamente que
-- si entre 1 < k < sqrt(p) no hay un no hay k que divida a p, entonces es primo

menorDivisor :: Integer -> Integer 
menorDivisor n | mod n 2 == 0 = 2
               | n == 1 = 1
               | otherwise = menorDivisorAux n 2

menorDivisorAux :: Integer -> Integer -> Integer
menorDivisorAux n c | n == c = c
                    | mod n c == 0 = c
                    | otherwise = menorDivisorAux n (c+1)


esPrimo :: Integer -> Bool
esPrimo 1 = False
esPrimo n = esPrimoAux n 2



esPrimoAux :: Integer -> Integer -> Bool
esPrimoAux 2 _ = True
esPrimoAux n c | mod n c == 0 = False
               | fromIntegral c >= ceiling (sqrt (fromIntegral n)) = True
               | otherwise = esPrimoAux n (c+1)

sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos a b | (mod a b == 0) || (mod b a == 0) = False
                | otherwise = coprimosChecker a b 2

coprimosChecker :: Integer -> Integer -> Integer -> Bool
coprimosChecker a b i | (i >= b) && (i >= a) = True
                      | (mod a i == 0) && (mod b i == 0) = False
                      | otherwise = coprimosChecker a b (i+1)


nEsimoPrimo :: Integer -> Integer 
nEsimoPrimo n = nEsimoPrimoAux n 1

nEsimoPrimoAux :: Integer -> Integer -> Integer 
nEsimoPrimoAux n c | n == 0 = (c-1) 
                   | (esPrimo c) = nEsimoPrimoAux (n-1) (c+1)
                   | otherwise = nEsimoPrimoAux n (c+1)