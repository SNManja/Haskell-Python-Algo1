pertenece :: (Eq t) => t -> [t] -> Bool
pertenece e [] = False
pertenece e (s:xs) | s == e = True
                   | otherwise = pertenece e xs

todosIguales :: (Eq t) => [t] -> Bool
todosIguales (s:xs) = todosIgualesAux (s:xs) s

todosIgualesAux :: (Eq t) => [t] -> t -> Bool
todosIgualesAux [] n = True
todosIgualesAux (s:xs) n | s == n = todosIgualesAux xs n  
                         | otherwise = False

todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos (s:xs) | pertenece s xs = False
                      | otherwise = todosDistintos xs

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (s:xs) | pertenece s xs = True
                    | otherwise = hayRepetidos xs

quitar :: (Eq t) => t-> [t] -> [t]
quitar n [] = []
quitar n (s:xs) | n == s = xs
                | n /= s = [s] ++ (quitar n xs)


quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos n [] = []
quitarTodos n (s:xs) | pertenece n (s:xs) = quitarTodos n (quitar n (s:xs))
                     | otherwise = (s:xs)


eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (s:xs) | pertenece s xs = eliminarRepetidos xs
                         | otherwise = [s] ++ eliminarRepetidos xs

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos (a:ax) (b:bx) | pertenece a (b:bx) = mismosElementos (quitarTodos a (a:ax)) (quitarTodos a (b:bx))
                              | otherwise = False

--Del 1:
longitud :: [t] -> Integer
longitud [] = 0
longitud n = 1 + longitud (tail n) 

reverso :: [t] -> [t]
reverso n = reversoAux n []

reversoAux :: [t] -> [t] -> [t]
reversoAux [] s =  s
reversoAux n s = reversoAux (tail n) ([head n] ++ s)

-- Para capicua

capicua :: (Eq t) => [t] -> Bool
capicua (s:xs) | ( mod (longitud (s:xs)) 2) == 0 = (s:xs) == (cortarHasta (s:xs) (div (longitud (s:xs)) 2)) ++ reverso (cortarHasta (s:xs) (div (longitud (s:xs)) 2))
               | ( mod (longitud (s:xs)) 2) == 1 = (s:xs) == ((cortarHasta (s:xs) ((div (longitud (s:xs)) 2)+1)) ++ reverso (cortarHasta (s:xs) (div (longitud (s:xs)) 2)))


cortarHasta :: (Eq t) => [t] -> Integer -> [t]
cortarHasta (s:xs) n | n == 1 = [s]
                     | otherwise = [s] ++  (cortarHasta (xs) (n-1)) 
