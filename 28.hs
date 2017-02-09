{-# LANGUAGE MultiWayIf #-}
import Data.Int
import Data.List

sneakyList :: Int -> Int -> Int -> [Int]
sneakyList start counter end =
    foldl (\p r -> if | start >= end^2 -> p
                      | length p > 3 -> p ++ sneakyList (last p + counter + 2) (counter + 2) end
                      | otherwise -> p ++ [r]
                      ) [] [start,(start + counter)..(start + counter * 4)]

sumSneakyList :: Int -> Int -> Int -> Int
sumSneakyList start counter end = 
    foldl (\p r -> if | start >= end^2 -> p
                      | r > ((counter + 1)^2) -> p + sumSneakyList (r + 2) (counter + 2) end
                      | otherwise -> p + r
                      ) 0 [start,(start + counter)..(start + counter * 4)]

sneakyList2 :: Int -> Int -> Int -> [Int]
sneakyList2 start counter end =
    foldl (\p r -> if | start >= end^2 -> p
                      | length p > 3 -> sneakyList2 (head p + counter + 2) (counter + 2) end ++ p
                      | otherwise -> r : p
                      ) [] [start,(start + counter)..(start + counter * 4)]

sumSneakyList2 :: Int -> Int -> Int -> Int
sumSneakyList2 start counter end = 
    if | (start + counter * 3) < end^2 -> sum (take 4 $ iterate (+ counter) start)
         + sumSneakyList2 (start + counter * 4 + 2) (counter + 2) end
       | otherwise -> sum $ take 4 $ iterate (+ counter) start

main :: IO()
main = print $ 1 + sumSneakyList2 3 2 1001
-- main = print $ sum $ 1 : sneakyList 3 2 1001
-- main = print $ 1 + sumSneakyList 3 2 1001
-- main = print $ sum $ sneakyList2 3 2 1001 ++ [1]