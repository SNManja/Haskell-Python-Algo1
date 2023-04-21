sumaDivisores :: Int -> Int -> Int
sumaDivisores n c | n == c = 0 
                  | mod n c == 0 = c + sumaDivisores n (c+1)
                  | otherwise = sumaDivisores n (c+1)


-- Dado a como esta expresado voy a asumir que siempre me va a dar n1 y n2 en orden (n1<=n2)
tomaValorMax :: Int -> Int -> Int 
tomaValorMax n1 n2 = tomaValorMaxAux n1 n2 0

tomaValorMaxAux :: Int -> Int -> Int -> Int
tomaValorMaxAux n1 n2 s | n1 > n2 = s
                        | sumaDivisores n1 1 > s = tomaValorMaxAux (n1+1) n2 n1
                        | otherwise = tomaValorMaxAux (n1+1) n2 s