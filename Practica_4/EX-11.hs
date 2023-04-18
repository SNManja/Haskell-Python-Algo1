eAprox :: Float -> Float
eAprox 0 = 1
eAprox n = (1 / (fact n)) + eAprox n-1

fact :: Float -> Float 
fact 1 = 1
fact n = n * fact n-1 