comparar :: Integer -> Integer -> Integer 
comparar a b | sumaUltimosDosDigitos(a) < sumaUltimosDosDigitos(b) = 1
             | sumaUltimosDosDigitos(a) > sumaUltimosDosDigitos(b) = -1
             | otherwise = 0

sumaUltimosDosDigitos :: Integer -> Integer 
sumaUltimosDosDigitos x = (mod x 10)+ (mod (div x 10) 10) 