


distanciaManhattan :: (Float,Float,Float) -> (Float,Float,Float) -> Float
distanciaManhattan (a,b,c) (d,e,f) = absoluto (a-d) + absoluto (b-e) + absoluto (c-f)

absoluto :: Float -> Float
absoluto x | x < 0 = -x
           | otherwise = x