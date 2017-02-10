{-# LANGUAGE MultiWayIf #-}
import Data.List

primes :: [Int]
primes = 2 : [n | n <- [3,5..], isPrime n]

isPrime :: Int -> Bool
isPrime n = foldr (\p r -> p^2 > n || (rem n p /= 0 && r)) True primes

numToDigits :: Int -> [Int]
numToDigits x = reverse $ unfoldr (\n -> if (div n 10 == 0 && rem n 10 == 0) then Nothing
  else Just (rem n 10, div n 10)) x

digitsToNum :: [Int] -> Int
digitsToNum [] = 0
digitsToNum (x:xs) = if x == 0 then 0 else x * 10 ^ (length xs) + digitsToNum(xs) -- dirty trick

circularNums :: Int -> [Int]
circularNums n = map digitsToNum $ combinations $ numToDigits n

combinations :: [Int] -> [[Int]]
combinations xs0 = combs xs0 [xs0]
  where
    combs (x:xs1) xs2 = if xss == head xs2 then xs2
      else combs xss (xs2 ++ [xss])
        where
          xss = xs1 ++ [x]

checkCircIn :: [Int] -> [Int] -> [Int]
checkCircIn xs [] = xs
checkCircIn xs1 t@(x:xs0) = if | x == smalls -> if | all (\p -> elem p t) $ circularNums x -> checkCircIn (x:xs1) xs0
                                                   | otherwise -> checkCircIn xs1 xs0
                               | otherwise -> if | elem smalls xs1 -> checkCircIn (x:xs1) xs0
                                                 | otherwise -> checkCircIn xs1 xs0
  where
    smalls = minimum $ circularNums x

main :: IO()
main = print $ length $ checkCircIn [] $ takeWhile (< 1000000) primes