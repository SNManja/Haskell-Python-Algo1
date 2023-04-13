{-
    Este ejercicio es de especificar ejemplos de haskell

    Estas serian las funciones
-}


f1 :: Float -> Float
f1 n | n == 0 = 1
     | otherwise = 0

{-
    problema f1 (n: R), R {
        requiere {True}
        asegura {IfThenElseFi(n == 0, 1, 0)}
    }

-}


f2 :: Float -> Float
f2 n | n == 1 = 15
     | n == 2 = 15
{-
    problema f2 (n: R), R {
        requiere {True}
        asegura { n==1 <=> res = 15 }
        asegura { n==2 <=> res = 15 }
    }
-}


f3 :: Float -> Float
f3 n | n <= 9 = 7
     | n >= 3 = 5
{-
    problema f3 (n: R), R {
        requiere {True}
        asegura {n<=9 <=> res=7}
        asegura {(n>=3 && n<9) <=> res=5}
    }
-}


f4 :: Float -> Float -> Float
f4 x y = (x + y) / 2

{-
    problema f4 (x: R, y: R), R{
        requiere {True}
        asegura {res = (x + y)/2 }
    }
-}

f5 :: (Float, Float) -> Float
f5 (x, y) = (x + y) / 2
{-
    problema f5 (t: R x R), R{
        requiere {True}
        asegura {res = (t1 + t2)/2}
    }
-}


f6 :: Float -> Int -> Bool
f6 a b = truncate a == b
{-
    problema f6 (a: R, b: Z), Bool {
        requiere {True}
        asegura {res = True <=> (floor(a) == b)}
    }

    En este caso con floor me refiero a las barritas verticales que cortan la , de un numero dejando un entero
-}