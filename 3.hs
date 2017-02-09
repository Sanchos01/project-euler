{-# Language MultiWayIf #-}
import Data.List
import Data.Int

cutPrime :: Int -> Int -> Int
cutPrime a b = if | mod a b == 0 -> cutPrime (div a b) b
                  | otherwise -> a

func :: [Int] -> [Int]
func [a, b, c] = if | mod c a == 0 -> func [a + 1, div c a, cutPrime c a]
                    | (fromIntegral a) >= (sqrt . fromIntegral $ c) -> [a - 1, b, c]
                    | otherwise -> func [a + 1, b, c]
-- func (x:xs) = if | not (length (x:xs) == 3) -> (x:xs)

main :: IO ()
main = 
  let numbers = [2, 1, 600851475143]
  in
  print . func $ numbers