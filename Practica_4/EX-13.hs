sumatoria1 :: Integer -> Integer -> Integer
sumatoria1 i 1 = i
sumatoria1 i j = i^j + sumatoria1 i (j-1)

sumatoria2 :: Integer -> Integer -> Integer
sumatoria2 1 j = 1*j
sumatoria2 i j = sumatoria1 i j + sumatoria2 (i-1) j

-- Para que de la respuesta apropiada se llamada a la sumatoria2
