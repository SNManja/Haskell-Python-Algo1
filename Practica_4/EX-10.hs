-- Habria que verificar si esta bien este ej

f1 :: Int -> Int 
f1 n | n < 0 = 0
     | otherwise = 2^n + f1 (n-1)

f2 :: Int -> Int -> Int 
f2 q 1 = q
f2 q n = q^n + f2 q (n-1)

f3 :: Int -> Int -> Int
f3 q n = f2 q (2*n)

f4 :: Int -> Int -> Int
f4 q n = f4Aux q (2*n)

f4Aux::Int -> Int -> Int
f4Aux q n | n == (div n 2) = q^n
       | otherwise = q^n + f4Aux q n-1

