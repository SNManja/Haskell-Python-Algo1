
nat2bin :: Integer -> [Integer]
nat2bin 0 = [0]
nat2bin 1 = [1]
nat2bin n | mod n 2 == 0 =  nat2bin (div n 2) ++ [0] 
          | mod n 2 == 1 = nat2bin (div n 2) ++ [1] 

bin2nat :: [Integer] -> Integer
bin2nat [] = 0 
bin2nat (x:xs) | x == 1 =(2 ^ (largoLista (x:xs)-1)) + (bin2nat xs)
               | otherwise = (bin2nat xs)

largoLista :: [Integer] -> Integer
largoLista [] = 0 
largoLista (x:xs) = 1 + largoLista (xs)

nat2hex :: Integer -> [Char]
nat2hex n | n <= 15 = dicHex n
          | otherwise = nat2hex (div n 16) ++ dicHex (mod n 16) 


-- Esto es un crimen a la humanidad
dicHex :: Integer -> [Char]
dicHex 1 =  ['1']
dicHex 2 =  ['2']
dicHex 3 =  ['3']
dicHex 4 =  ['4']
dicHex 5 =  ['5']
dicHex 6 =  ['6']
dicHex 7 =  ['7']
dicHex 8 =  ['8']
dicHex 9 =  ['9']
dicHex 10 = ['A']
dicHex 11 = ['B']
dicHex 12 = ['C']
dicHex 13 = ['D']
dicHex 14 = ['E']
dicHex 15 = ['F']
dicHex n = error "Fuera de [1,15]"
         

sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada (x:xs) = sumaAcumuladaAux (x:xs) 0

sumaAcumuladaAux :: (Num t) => [t] -> t -> [t]
sumaAcumuladaAux [] _ = []
sumaAcumuladaAux (x:xs) n = [x+n] ++ sumaAcumuladaAux xs (x+n)

modulo :: Integer -> Integer
modulo n | n >= 0 = n
         | otherwise = (-n)

esPrimo :: Integer -> Bool
esPrimo 1 = False
esPrimo 2 = True
esPrimo n = esPrimoAux (modulo n) 2

esPrimoAux :: Integer -> Integer -> Bool
esPrimoAux n c | (mod n c /= 0) && c >= (ceiling (sqrt (fromIntegral n))) = True
               | mod n c == 0 = False
               | otherwise = esPrimoAux n (c+1)



descomponePrimo :: Integer -> Integer -> [Integer]
descomponePrimo 1 _ = [1]
descomponePrimo n c | esPrimo n = [n] 
                    | esPrimo c && (mod n c == 0) = [c] ++ descomponePrimo (div n c) c
                    | otherwise = descomponePrimo n (c+1)

descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x:xs) = [descomponePrimo x 1] ++ descomponerEnPrimos xs 