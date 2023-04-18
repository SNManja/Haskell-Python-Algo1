sumaPotencias :: Integer -> Integer -> Integer -> Integer
sumaPotencias q n m = potencias q n + potencias q m 

potencias :: Integer -> Integer -> Integer
potencias q 1 = q
potencias q x = (q^x) + potencias q (x-1) 