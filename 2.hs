{-# LANGUAGE MultiWayIf #-}
import Data.List
import Data.Int

even :: Int -> Int
even a = if | mod a 2 == 0 -> a
			   | otherwise -> 0

extra :: [Int] -> [Int]
extra [] = [0]
extra (x:xs) = if | length (x:xs) < 2 -> [x]
				  | (head . lastprevlast $ (x:xs)) > 4000000 -> (x:xs)
				  | otherwise -> extra ((x:xs) ++ lastprevlast (x:xs))

lastprevlast :: [Int] -> [Int]
lastprevlast [] = [0]
lastprevlast (x:xs) = if | length (x:xs) < 2 -> [x]
						 | otherwise -> [last (x:xs) + (last . init $ (x:xs))]

resultList :: [Int] -> [Int]
resultList (x:xs) = map even (extra (x:xs))

main :: IO()
main = print . sum . resultList $ spisok
	where
		spisok = [1,2]