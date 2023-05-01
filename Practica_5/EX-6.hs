import Data.Time (addGregorianDurationClip)
import Data.List (genericReplicate)
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