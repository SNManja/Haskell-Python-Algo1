calcPitagoras :: Integer -> Integer -> Integer
calcPitagoras x y = x^2 + y^2

pitagoras :: Integer -> Integer -> Integer -> Integer
pitagoras m n r  = sumatoria2 m n r 

-- Es una sumatoria doble

sumatoria1 :: Integer ->  Integer-> Integer -> Integer
sumatoria1 (-1) q r = 0
sumatoria1 p q r | calcPitagoras p q  <= r^2 = 1 + sumatoria1 (p-1) q r
                 | otherwise = sumatoria1 (p-1) q r



sumatoria2 :: Integer -> Integer -> Integer -> Integer
sumatoria2 p q r | q == -1 = 0
                 | otherwise = sumatoria1 p q r + sumatoria2 p (q-1) r