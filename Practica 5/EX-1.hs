longitud :: [t] -> Integer
longitud [] = 0
longitud n = 1 + longitud (tail n) 

ultimo :: [t] -> t 
ultimo n = nElem n ((longitud n)-1)

--Agregado mio
nElem :: [t] -> Integer -> t
nElem l 0 = head l
nElem l n = nElem (tail l) (n-1)


reverso :: [t] -> [t]
reverso n = reversoAux n []

reversoAux :: [t] -> [t] -> [t]
reversoAux [] s =  s
reversoAux n s = reversoAux (tail n) ([head n] ++ s)

principio :: [t] -> [t]
principio t = reverso (tail (reverso t))



