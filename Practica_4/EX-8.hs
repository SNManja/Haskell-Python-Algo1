modulo :: Integer -> Integer 
modulo n | n >= 0 = n
         | otherwise = (-n)

cantDigitos :: Integer -> Integer
cantDigitos n | modulo n < 10 = 1
              | otherwise = 1 + cantDigitos (div (modulo n) 10)

iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i | n == 0 = 1
                 | otherwise = mod (div (modulo n) (10^((cantDigitos n)-i))) 10