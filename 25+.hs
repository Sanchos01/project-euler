{-# LANGUAGE MultiWayIf #-}

fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

size :: [Integer] -> Integer -> Integer
size (x:xs) b = if | x < 10^(b - 1) -> size (xs) b
                   | otherwise -> x

result = size fibs 1000

neededIndex :: Integer -> [Integer] -> Integer
neededIndex a (x:xs) = if | x < 10^(a - 1) -> 1 + neededIndex a (xs)
                          | otherwise -> 0

main :: IO()
main = print (neededIndex 1000 fibs)