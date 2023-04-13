{-
    Programar una funcion bisiesto 
-}

bisiesto :: Integer -> Bool
bisiesto n | not (esMult n 4) || ((esMult n 100)  && not (esMult  n 400 )) = False
           | otherwise = True


esMult :: Integer -> Integer -> Bool
esMult n m | (mod n m == 0) = True
           | otherwise = False