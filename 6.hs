{-# LANGUAGE MultiWayIf #-}
import Data.List
import Data.Int

sumSquare :: Int -> Int
sumSquare a = if | a <= 1 -> a
                 | otherwise -> a^2 + sumSquare (a - 1)

squareSum :: Int -> Int
squareSum a = if | a < 1 -> 0
                 | otherwise -> (totalSum a)^2
                where
                totalSum :: Int -> Int
                totalSum a = if | a < 1 -> 0
                                | otherwise -> a + totalSum (a - 1)

result :: Int -> Int
result a = (squareSum a) - (sumSquare a)

main :: IO()
main = print . result $ 100