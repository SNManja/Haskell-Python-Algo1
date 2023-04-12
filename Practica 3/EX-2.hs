import Language.Haskell.TH (tupE)
import GHC.Base (TrName(TrNameD))
import Distribution.Pretty (flatStyle)
import Distribution.Simple.Setup (falseArg)
{- Especificar e implementar las siguientes funciones, incluyendo su signatura -}

{-
    Ej 2
    Aca no voy a notar al menos por el momento la especificacion, solo voy a realizar la implementacion


    Correccion de chat-gpt (A implementar):
    Tus respuestas parecen ser correctas en su mayoría. Sin embargo, te daré algunos comentarios y sugerencias:

    La función "maximo3" podría mejorarse al utilizar la función "max" de Haskell, en lugar de comparar los números de forma manual.

    En la función "mismoIntervalo", en lugar de utilizar expresiones complejas con operadores lógicos, podrías crear una función auxiliar que verifique si un número está en un intervalo específico. De esta forma, el código sería más legible y mantenible.

    En la función "sumaDistintos", no es necesario verificar si los tres números son iguales antes de realizar la suma. Simplemente podrías sumar los tres números y luego restar la suma de los números repetidos (en caso de haberlos).
-}



absoluto :: Int -> Int 
absoluto x | x >= 0 = x
           | otherwise = -x

maximoAbsoluto :: Int -> Int -> Int
maximoAbsoluto x y | absoluto x >= absoluto y = absoluto x
                   | otherwise = absoluto y

maximo3 :: Int -> Int -> Int -> Int
maximo3 x y z | (absoluto x >= absoluto y) && (absoluto x >= absoluto z) = absoluto x
              | (absoluto y >= absoluto x) && (absoluto y >= absoluto z) = absoluto y
              | otherwise = absoluto z
              

algunoEs0_1 :: Int -> Int -> Bool
algunoEs0_1 0 _ = True
algunoEs0_1 _ 0 = True
algunoEs0_1 _ _ = False

algunoEs0_2 :: Int -> Int -> Bool
algunoEs0_2 x y| (x == 0) || (y==0) = True
               | otherwise = False


ambosSon0_1 :: Int -> Int -> Bool
ambosSon0_1 0 0 = True
ambosSon0_1 _ _ = False

ambosSon0_2 :: Int -> Int -> Bool
ambosSon0_2 x y | (x == 0) && (y == 0) = True
                | otherwise = False

mismoIntervalo :: Int -> Int -> Bool
mismoIntervalo x y | ((x <=3) && (y <=3)) || (((3<x)&&(3<y))&&((x<=7)&&(y<=7))) || ((x>7) && (y>7))  = True
                   | otherwise = False

sumaDistintos :: Int -> Int -> Int -> Int
sumaDistintos x y z | (x == y) && (x == z) = x
                    | (x == y) = x + z
                    | (x == z) = x + y
                    | (y == z) = x + y
                    | otherwise = x + y + z


esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y | mod x y == 0 = True
                 | otherwise = False


digitoUnidades :: Int -> Int 
digitoUnidades n = mod n 10

digitoDecenas :: Int -> Int
digitoDecenas n = mod n 100 - mod n 10