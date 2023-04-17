sumaImpares :: Integer -> Integer 
sumaImpares n | n == 0 = 0
              | otherwise = (n*2)-1 + sumaImpares (n-1)

