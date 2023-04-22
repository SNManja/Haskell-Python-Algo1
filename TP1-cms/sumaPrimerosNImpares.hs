-- No editar esta parte
main :: IO()
main = do {
  x <- readLn ;
  print(sumaPrimerosNImpares(x ::(Integer)))
  }


-- sumaPrimerosNImpares era un ejercicio de la guia si no mal recuerdo
-- En este caso, la especificacion del pdf es diferente 
sumaPrimerosNImpares :: Integer -> Integer
sumaPrimerosNImpares n = sumaPrimerosNImparesAux (2*n-1)

sumaPrimerosNImparesAux :: Integer -> Integer
sumaPrimerosNImparesAux 1 = (2 * 1) + 2
sumaPrimerosNImparesAux i | mod i 2 == 0 = sumaPrimerosNImparesAux (i-1)
                          | otherwise = ((2 * i) + 2) + sumaPrimerosNImparesAux (i-2)

