modulo :: Integer -> Integer
modulo n | n < 0 = -n
         | otherwise = n

mayorDigitoPar :: Integer -> Integer 
mayorDigitoPar n = mayorDigitoParAux n (largo (modulo n)) (-1)

largo :: Integer -> Integer
largo n | n < 10 = 1
        | otherwise = 1 + largo (div n 10)

mayorDigitoParAux :: Integer -> Integer -> Integer -> Integer
mayorDigitoParAux n l m | l == 0 = m
                     | (mod n 2 == 0) && (mod n 10 /= 0) && (mod n 10) > m = mayorDigitoParAux (div n 10) (l-1) (mod n 10)
                     | otherwise = mayorDigitoParAux (div n 10) (l-1) m 