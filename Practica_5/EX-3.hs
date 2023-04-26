import Distribution.Simple.Utils (xargs)
sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria s = head s + sumatoria (tail s)

productoria :: [Integer] -> Integer
productoria [] = 1
productoria s = head s * productoria (tail s)

maximo :: [Integer] -> Integer
maximo (s:xs) = maximoAux xs s

maximoAux :: [Integer] -> Integer -> Integer
maximoAux [] m = m
maximoAux (s:xs) m | s > m = maximoAux xs s 
                   | otherwise = maximoAux xs m 


sumarN :: Integer -> [Integer] -> [Integer]
sumarN _ [] = []
sumarN n (s:xs) = [s+n] ++ sumarN n xs

sumarElPrimero :: [Integer] -> [Integer] 
sumarElPrimero (s:xs) = [s+s] ++ (sumarN s xs)

-- Para sumarElUltimo voy a usar la funcion reverso del EX-1 --
reverso :: [t] -> [t]
reverso n = reversoAux n []

reversoAux :: [t] -> [t] -> [t]
reversoAux [] s =  s
reversoAux n s = reversoAux (tail n) ([head n] ++ s)
--------------------------------------------------------------

sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo s = reverso (sumarElPrimero (reverso s))

pares :: [Integer] -> [Integer]
pares [] = []
pares (s:xs) | mod s 2 == 0 = [s] ++ pares xs
             | otherwise = pares xs

multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN _ [] = []
multiplosDeN n (s:xs) | mod s n == 0 = [s] ++ (multiplosDeN n xs)
                      | otherwise = (multiplosDeN n xs)

{-
    Con multiplosDeN puedo hacer pares con n = 2. No lo hago asi para respetar el orden de ejercicios
-}
esOrdenada :: [Integer] -> Bool
esOrdenada [] = True
esOrdenada (x:xs) | xs == [] = True
                  | x > (head xs) = False
                  | otherwise = esOrdenada xs

ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar s | esOrdenada s = s 
          | otherwise =  ordenar (ordenador s)

ordenador :: [Integer] -> [Integer]
ordenador (x:xs) | xs == [] = []
                 | x > (head xs) = [head xs] ++ [x] ++ (tail xs)
                 | otherwise = [x] ++ (ordenador xs)


