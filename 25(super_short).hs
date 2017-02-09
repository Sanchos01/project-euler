fibs = 0 : 1 : zipWith (+) fibs (tail fibs) 
neededIndex a = foldr (\x y -> if x > 10^(a - 1) then 0 else 1 + y) 0 fibs 
main :: IO() 
main = print $ neededIndex 1000