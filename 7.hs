{-# LANGUAGE MultiWayIf #-}
import Data.List
import Data.Int

sumPrime :: Int -> Int
sumPrime a = if | a <= 1 -> 0
                | isPrime a -> (+) a $ sumPrime $ (-) a 1
                | otherwise -> sumPrime $ (-) a 1

primeNums = 2 : [n | n <- [3..], isPrime n]
isPrime n = foldr (\p r -> p * p > n || (rem n p /= 0 && r)) True primeNums

main :: IO()
main = print $ last $ take 10001 primeNums