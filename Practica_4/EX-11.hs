eAprox :: Integer -> Double
eAprox 0 = 1
eAprox n = (1 / (fact (fromIntegral n))) + eAprox (n-1)

fact :: Double -> Double 
fact 1 = 1
fact n = n * fact (n-1) 

e :: Double
e = eAprox 10