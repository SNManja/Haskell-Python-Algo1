-- No editar esta parte
main :: IO()
main = do {
  x <- readLn ;
  print(prod(x ::(Integer)))
  }

prod :: Integer -> Integer
prod x = prodAux (2*x)


prodAux :: Integer -> Integer 
prodAux 1 = 3
prodAux i = i^2 + 2*i


-- Tambien haskell tiene una funcion reservada llamada sum, esta cumpliria la misma funcion que la sumatoria
-- Como esta se va fuera del tema de la materia no la utilice para la implementacion
-- prod = sum [i^2 + 2*i | i <- [1..2*x]]