raizDe2Aprox :: Integer -> Float 
raizDe2Aprox n = (serieA n) -1

serieA :: Integer -> Float
serieA 1 = 2
serieA n = 2+ (1 / (serieA (n-1)))