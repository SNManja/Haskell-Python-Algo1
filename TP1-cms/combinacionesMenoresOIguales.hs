-- No editar esta parte
main :: IO()
main = do {
  x <- readLn ;
  print(combinacionesMenoresOiguales(x ::(Integer)))
  }

combinacionesMenoresOiguales :: Integer -> Integer
combinacionesMenoresOiguales n = sumatoria2 n n n


sumatoria1 :: Integer -> Integer -> Integer -> Integer
sumatoria1 j 0 n = 0
sumatoria1 j i n | i * j <= n = 1 + sumatoria1 j (i-1) n
                 | otherwise = sumatoria1 j (i-1) n

sumatoria2 :: Integer -> Integer -> Integer -> Integer 
sumatoria2 1 i n = sumatoria1 1 i n
sumatoria2 j i n = sumatoria1 j i n + sumatoria2 (j-1) i n