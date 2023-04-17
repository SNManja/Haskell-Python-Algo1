parteEntera :: Float -> Int
parteEntera n | n >= 0 = floor (parteEnteraPos n 1)
              | otherwise = floor (parteEnteraNeg n 1)

parteEnteraPos :: Float -> Float -> Float
parteEnteraPos n c | (n-c) < 0 = c-1
                   | otherwise = parteEnteraPos n (c+1)

parteEnteraNeg :: Float -> Float -> Float
parteEnteraNeg n c | (n-c) > 0 = c+1
                   | otherwise = parteEnteraNeg n (c-1)