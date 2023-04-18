fibo :: Integer -> Integer
fibo 0 = 0 
fibo 1 = 1 
fibo n = fibo (n-1) + fibo (n-2)


esFibonacci :: Integer -> Bool
esFibonacci n = fiboCheck n 1

fiboCheck :: Integer -> Integer -> Bool 
fiboCheck n i | (fibo i) == n = True
              | (fibo i) > n = False
              | otherwise = fiboCheck n (i+1)