
import Distribution.Simple.Utils (xargs)

{-

-}

prodInt :: (Float, Float) -> (Float, Float) -> Float
prodInt (v,w) (a,b) = v * a + w * b

todoMenor :: (Float, Float) -> (Float, Float) -> Bool
todoMenor (v,w) (a,b) | v < a && w < b = True
                      | otherwise = False


distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (v,w) (a,b) = sqrt ((( a- v)^2) + ((b - w)^2))


sumaTerna :: (Float, Float, Float) -> Float
sumaTerna (a,b,c) = a + b + c


-- No agrego case base en caso q no sea natural porque sale fuera de la especificacion
sumarSoloMultiplos :: (Int, Int, Int) -> Int -> Int
sumarSoloMultiplos (a,b,c) n | n > 0 = esMult a n + esMult b n + esMult c n
                             

esMult :: Int -> Int -> Int
esMult x n | mod x n == 0 = x
           | otherwise = 0


posPrimerPar :: (Int, Int, Int) -> Int
posPrimerPar (a,b,c) 
    | mod a 2 == 0 = 0
    | mod b 2 == 0 = 1
    | mod c 2 == 0 = 2
    | otherwise = 4

crearPar :: t1 -> t2 -> (t1,t2)
crearPar x y = (x,y)

invertir :: (t1,t2) -> (t2,t1)
invertir (x,y) = (y,x)

