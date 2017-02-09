{-# LANGUAGE MultiWayIf #-}

fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

size :: [Integer] -> Integer -> Integer
size (x:xs) b = if | x < 10^(b - 1) -> size (xs) b
                   | otherwise -> x

result = size fibs 1000

neededIndex :: [Integer] -> Integer
neededIndex (x:xs) = if | result /= x -> 1 + neededIndex (xs)
                        | otherwise -> 0

main :: IO()
main = print (neededIndex fibs)