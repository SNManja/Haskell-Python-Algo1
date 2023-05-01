import Data.Time (addGregorianDurationClip)
import Data.List (genericReplicate)
import Distribution.Simple.Utils (xargs)
type Set a = [a]

vacio :: Set Integer
vacio = []

agregarATodos :: Integer -> Set (Set Integer) -> Set (Set Integer)
agregarATodos n [] = []
agregarATodos n (c:cls) | incluido n c = [c] ++ agregarATodos n cls
                        | otherwise = [c++[n]] ++ agregarATodos n cls

--Aux del 1.
incluido :: Integer -> Set Integer -> Bool
incluido n [] = False
incluido n (ch:ct) | n == ch = True
                   | otherwise = incluido n ct


-- 2. SIN HACER AUN

partes :: Integer -> Set (Set Integer) 
partes n = sinRepeConjDeConj (sortCU (partesAux n []))

partesAux :: Integer -> Set (Set Integer) -> Set (Set Integer)
partesAux n [] = partesAux n (listaAN n) 
partesAux 0 cls = cls 
partesAux n cls =  partesAux (n-1) (cls ++ agregarATodos n cls)

listaAN :: Integer -> Set (Set Integer)
listaAN 0 = [[]]
listaAN n = [[n]] ++ listaAN (n-1) 

sortCU :: Set (Set Integer) -> Set (Set Integer)
sortCU [] = []
sortCU (x:xs) = [sort x] ++ (sortCU xs)

sort :: Set Integer -> Set Integer
sort [] = []
sort (x:xs) | masChico x xs = [x] ++ sort xs     
            | otherwise = sort (xs ++ [x])

masChico :: Integer -> Set Integer -> Bool
masChico n [] = True
masChico n (x:xs) | n <= x = masChico n xs
                  | otherwise = False
 
sinRepeConjDeConj :: Set (Set Integer) -> Set (Set Integer) 
sinRepeConjDeConj [] = []
sinRepeConjDeConj (x:xs) = if conjIncluido x xs then sinRepeConjDeConj xs else [x] ++ sinRepeConjDeConj xs

conjIncluido :: Set Integer -> Set (Set Integer) -> Bool
conjIncluido conj [] = False
conjIncluido conj (x:xs) | conj == x = True
                         | otherwise = conjIncluido conj xs


-- 3.
productoCartesiano :: Set Integer -> Set Integer -> Set (Integer, Integer)
productoCartesiano s r = productoCartesianoS (sinRepe s) (sinRepe r)  --Esto que yo agregue aca no es necesario, el asegura nos da por hecho que es cierto, yo lo implemento porque quiero nada mas

productoCartesianoS :: Set Integer -> Set Integer -> Set (Integer, Integer)
productoCartesianoS [] _ = []
productoCartesianoS (sh:st) (rh:rt) = productoCartesianoR sh (rh:rt) ++ productoCartesianoS st (rh:rt)

productoCartesianoR :: Integer -> Set Integer -> Set (Integer, Integer)
productoCartesianoR n [] = []
productoCartesianoR n (rh:rt) = [(n,rh)] ++ productoCartesianoR n rt

sinRepe :: Set Integer -> Set Integer 
sinRepe [] = []
sinRepe (x:xs) = if incluido x xs then sinRepe xs else [x] ++ (sinRepe xs)