{-# LANGUAGE MultiWayIf #-}
import Data.List
import Data.Int

func :: Int -> Int
func a = if | mod a 3 == 0 || mod a 5 == 0 -> a
            | otherwise -> 0

main :: IO ()
main = 
  let spisok = [1..999]
  in
  print . sum $ map func spisok