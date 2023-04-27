{-
    Implementar funcion todosMenores
-}

todosMenores :: (Int, Int, Int) -> Bool 
todosMenores (a,b,c) = ((f a > g a) && (f b > g b) && (f c > g c)) 

f :: Int -> Int
f x | x <=7 = x^2
    | x > 7 = (2 * x) - 1


g :: Int -> Int 
g x | mod x 2 == 0 = div x 2
    | otherwise = (3 * x) + 1

