sacarBlancosRepetidos :: [Char] -> [Char] 
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos (x:xs) | xs == [] = [x]
                             | x == (head xs) && x==' ' =  sacarBlancosRepetidos (xs)
                             | otherwise = [x] ++ sacarBlancosRepetidos xs

contarPalabras :: [Char] -> Integer
contarPalabras [] = 0
--En este caso en el primer condicional es importante el orden, en caso de ponerlo alrevez se indefine cuando no hay head de xs porque xs == []
contarPalabras (x:xs) | (x /= ' ' && (xs == [])) || (x /= ' ' && (head xs) == ' ')  = 1 + contarPalabras xs
                      | otherwise = contarPalabras xs

--
largoLista :: [t] -> Integer
largoLista [] = 0
largoLista (x:xs) = 1 + largoLista xs

palabraMasLarga :: [Char] -> [Char]
palabraMasLarga s = palabraMasLargaAux s [] []

palabraMasLargaAux :: [Char] -> [Char] -> [Char] -> [Char]
palabraMasLargaAux [] max g = max
palabraMasLargaAux (x:xs) max g | ((x /= ' ') && (xs == [])) || (x /= ' ' && (head xs) == ' ')  = if ((largoLista g)+1 > (largoLista max)) then palabraMasLargaAux xs (g ++ [x]) [] else palabraMasLargaAux xs max []
                                | otherwise = if x /= ' ' then palabraMasLargaAux xs max (g ++ [x]) else palabraMasLargaAux xs max g


palabras :: [Char] -> [[Char]]
palabras s = palabrasAux (sacarBlancosRepetidos ([' '] ++ s))

palabrasAux :: [Char] -> [[Char]]
palabrasAux [] = []
palabrasAux (x:xs) | x == ' ' && xs /= [] = [(primerPalabra xs)] ++ palabrasAux (xs)
                | otherwise = palabrasAux xs

primerPalabra :: [Char] -> [Char]
primerPalabra (x:xs) | ((x /= ' ') && (xs == [])) || (x /= ' ' && (head xs) == ' ')  = [x]
                     | otherwise = if x /= ' ' then [x] ++ (primerPalabra xs)  else (primerPalabra xs)


aplanar :: [[Char]] -> [Char] 
aplanar (x:xs) | xs == [] = x 
               | otherwise = x  ++ aplanar xs


aplanarConBlancos :: [[Char]] -> [Char] 
aplanarConBlancos (x:xs) | xs == [] = x 
               | otherwise = x  ++ [' '] ++ aplanarConBlancos xs



aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
aplanarConNBlancos (x:xs) n | xs == [] = x 
                            | otherwise = x  ++ (nBlancos n) ++ aplanarConNBlancos xs n

nBlancos :: Integer -> [Char]
nBlancos 0 = []
nBlancos n = [' '] ++ nBlancos (n-1)
                