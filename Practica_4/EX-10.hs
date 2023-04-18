-- Habria que verificar si esta bien este ej

f1 :: Integer -> Integer
f1 n | n <= 0 = 1
     | otherwise = 2^n + f1 (n-1)

f2 :: Integer -> Integer -> Integer
f2 q 1 = q
f2 q n = q^n + f2 q (n-1)

f3 :: Integer -> Integer -> Integer
f3 q n = f2 q (2*n)

f4 :: Integer -> Integer -> Integer
f4 q n = f4Aux q (2*n)

f4Aux::Integer -> Integer -> Integer
f4Aux q n | (n <= (div n 2)) = q^n
          | (n > (div n 2)) = q^n + (f4Aux q (n-1))

