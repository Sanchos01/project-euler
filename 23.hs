{-# LANGUAGE MultiWayIf #-}
import Data.List

findSumDivisors :: Int -> Int
findSumDivisors 1 = 0
findSumDivisors a = foldl (\y x -> if | rem a x == 0 -> if | x*x == a -> y + x
                                                           | otherwise -> y + x + div a x
                                      | otherwise -> y
  ) 1 [2..(truncate . sqrt . fromIntegral $ a)]

isAbundant :: Int -> Bool
isAbundant a = if findSumDivisors a > a then True else False

listAbundantNums :: [Int]
listAbundantNums = filter isAbundant [12..28123]

listSums :: Int -> [Int] -> [Int]
listSums a xs = foldr (\p r -> if | p + a > 28123 -> r
                                  | otherwise -> ((p+a):r)
  ) [] xs

sortUniqLists :: Ord a => [a] -> [a] -> [a]
sortUniqLists xs [] = xs
sortUniqLists [] xs = xs
sortUniqLists a@(x:xs) b@(y:ys) = if | x < y -> (x:sortUniqLists xs b)
                                     | x == y -> sortUniqLists xs b
                                     | otherwise -> (y:sortUniqLists a ys)

listUniqSums :: [Int] -> [Int]
listUniqSums xs = foldl (\r p -> sortUniqLists (listSums p xs) r) [] xs

main :: IO()
main = print $ sum [1..28123] - (sum $ listUniqSums listAbundantNums)