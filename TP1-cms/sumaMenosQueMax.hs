-- No editar esta parte
main :: IO ()
main = do
  x <- readLn
  print (sumaMenosQueMax (x :: (Int, Int, Int)))

sumaMenosQueMax :: (Int, Int, Int) -> Bool
sumaMenosQueMax t = (maximo (t) > ((minimo t) + (medio t)))

maximo :: (Int, Int, Int) -> Int
maximo (t1,t2,t3) | t1 >= t2 && t1 >= t3 = t1
                  | otherwise = maximo (t2, t3, t1)


minimo :: (Int, Int, Int) -> Int
minimo (t1,t2,t3) | t1 <= t2 && t1 <= t3 = t1
                  | otherwise = minimo (t2,t3,t1)

medio :: (Int, Int, Int) -> Int 
medio (t1,t2,t3) | (t1 <= t2 && t1 >= t3) || (t1 >= t2 && t1 <= t3) = t1
                 | otherwise = medio (t2,t3,t1)



-- Con esta implementacion no me preocupa en absoluto esPermutacion. No me es necesario.