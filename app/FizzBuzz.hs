module FizzBuzz where

--replace n v xs = zipWith ($) (cycle ((replicate (n-1) (\x -> filter (/='"') (show x))) ++ [\x -> v])) xs
--replace 15 "fizzbuzz" . replace 5 "buzz" . replace 3 "fizz" $ [1..20]

--["1","2","fizz","4","buzz","fizz","7","8","fizz","buzz","11","fizz","13","14","fizzbuzz","16","17","fizz","19","buzz"]

--import Data.List.Split
--fizzbuzz :: Int -> Int -> [[Char]]
--fizzbuzz x y = concat $ map (\xs -> (take (y - 1) xs) ++ ["Buzz"]) $ chunksOf y $ concat $ map (\xs -> (take (x - 1) xs) ++ ["Fizz"]) $ chunksOf x $ map (\x' -> show x') [1 ..]

--[max(show x)(concat[n|(f,n)<-[(3,"Fizz"),(5,"Buzz")],mod x f==0])|x<-[1..25]]

-- replace n v xs = zipWith ($) (cycle ((replicate (n-1) (id)) ++ [\x -> v])) xs
-- replace 15 "fizzbuzz" . replace 5 "buzz" . replace 3 "fizz" $ map show [1..20]