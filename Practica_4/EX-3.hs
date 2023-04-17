esDivisible :: Int -> Int -> Bool 
esDivisible a b | a == 0 = True
                | a < 0 = False
                | otherwise = esDivisible (a-b) b