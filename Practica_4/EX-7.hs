todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n | (n >= 0) = checkIguales n (mod n 10)
                      | otherwise = checkIguales ((-1) * n) (mod (-n) 10)

checkIguales :: Integer -> Integer -> Bool
checkIguales n s | (n < 10) && (n == s) = True
                 | (n < 10) && (n /= s) = False
                 | (mod n 10) == s = checkIguales (div n 10) s
                 | (mod n 10) /= s = False