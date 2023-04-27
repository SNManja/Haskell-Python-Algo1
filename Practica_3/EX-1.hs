-- Ejercicio 1


-- A

f :: Integer -> Integer 
f 1 = 8;
f 4 = 131;
f 16 = 16;


-- B 

g :: Integer -> Integer 
g 8 = 16;
g 16 = 4;
g 131 = 1;


-- C

{-
    Teniendo f y g hay que implementar
        h = f ◦ g 
        k = g ◦ f
    Recordando, esto significa
        h (x) = g(f(x))
        k (x) = f(g(x))

-}

h :: Integer -> Integer
h x = g (f x)

k x = f (g x)

{-
    Ademas haskell tiene su propia composicion de funciones
    Utilizando el operador . (punto)

    por ejemplo
        h = f . g
    Seria lo mismo que 
        h = f  ◦ g 

-}


