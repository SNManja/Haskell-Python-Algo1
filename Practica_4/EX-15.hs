sumatoriaM :: Integer -> Integer -> Float
sumatoriaM p 1 = fromIntegral p
sumatoriaM p q = fromIntegral (div p q) + sumatoriaM p (q-1)

sumatoriaN :: Integer -> Integer -> Float
sumatoriaN 1 q = sumatoriaM 1 q
sumatoriaN p q = sumatoriaM p q + sumatoriaN (p-1) q