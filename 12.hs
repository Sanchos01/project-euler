{-# LANGUAGE MultiWayIf #-}
import Data.List

triangles :: [Int]
triangles = next 1 2
  where
    next x y = x : (next (x + y) (y + 1))

findDivisor :: [Int] -> Int -> Int
findDivisor (x:xs) y = if numberDivisors x > y then x else findDivisor xs y

numberDivisors :: Int -> Int
numberDivisors 1 = 1
numberDivisors x = foldl (\p r -> if | rem x r == 0 -> p + 2
                                     | otherwise -> p
                         ) 0 [1..end]
    where
        end = (+) 1 $ truncate . sqrt . fromIntegral $ x

main :: IO()
main = print $ findDivisor triangles 500