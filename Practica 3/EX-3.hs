
estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados 0 0 = False
estanRelacionados a b | a * a + a * b * valorK a b == 0 = True
                      | otherwise = False

valorK :: Integer -> Integer -> Integer
valorK a b | mod (a*a) ((-a)*b) == 0  = div (a*a) ((-a)*b)
           | otherwise = 0;

{-
    La implementacion funciona, se podria hacer una mas clara pero menos
    eficiente si damos uso de la funcion any() para encontrar el valor k

-}