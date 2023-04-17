medioFact :: Integer -> Integer 
medioFact n | n <= 1 = 1
            | otherwise = n * medioFact (n-2)