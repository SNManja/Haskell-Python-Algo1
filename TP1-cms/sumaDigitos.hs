import Distribution.Simple.Utils (xargs)
-- No editar esta parte
main :: IO()
main = do {
  x <- readLn ;
  print(sumaDigitos(x ::(Int)))
  }

-- En el pdf marca que es Integer, dejo Int como estaba en el documento por default
sumaDigitos :: Int -> Int
sumaDigitos x | modulo x < 10 = x
              | otherwise = mod (modulo x) 10 + sumaDigitos (div (modulo x) 10)

-- Esto NO es necesario. La especificacion pide para n>= 0, la agregue por gusto.
modulo :: Int -> Int
modulo x | x < 0 = -x
         | otherwise = x