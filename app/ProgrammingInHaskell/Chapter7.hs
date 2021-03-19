module ProgrammingInHaskell.Chapter7 where

{- Higher Order functions -}

{- Set up -}
import Data.Char
import Data.List ( sort )
type Bit = Int

{--- Notes ---}{-
Example: Binary string transmitter

This is reversed order binary...

bin2int :: [Bit] -> Int
bin2int bits = sum [w*b | (w,b) <- zip weights bits] 
               where weights = iterate (*2) 1 

iterate f x = [x, f x, f (f x), f (f (f x)), ...] 

-}

bin2int :: [Bit] -> Int
bin2int = foldr (\x y -> x + 2*y) 0

int2bin :: Int -> [Bit]
int2bin 0 = []
int2bin n = n `mod` 2 : int2bin (n `div` 2)

make8 :: [Bit] -> [Bit]
make8 bits = take 8 (bits ++ repeat 0)

encode :: String -> [Bit]
encode = concatMap (make8 . int2bin . ord)

chop8 :: [Bit] -> [[Bit]]
chop8 [] = []
chop8 bits = take 8 bits : chop8 (drop 8 bits)

decode :: [Bit] -> String
decode = map (chr . bin2int) . chop8

transmit :: String -> String
transmit = decode . channel . encode

channel :: [Bit] -> [Bit]
channel = id


{-
Example: Vote algorithms

---}{---

-}

votes :: [String]
votes = ["Red", "Blue", "Green", "Blue", "Blue", "Red"]

count :: Eq a => a -> [a] -> Int
count x = length . filter (== x)

removedups :: Eq a => [a] -> [a]
removedups [] = []
removedups (x:xs) = x : filter (/= x) (removedups xs)

result :: Ord a => [a] -> [(Int,a)]
result vs = sort [(count v vs, v) | v <- removedups vs]

winner :: Ord a => [a] -> a
winner = snd . last . result


ballots :: [[String]]
ballots = [["Red", "Green"], ["Blue"], ["Green", "Red", "Blue"], ["Blue", "Green", "Red"], ["Green"]]

 
{--- Excersies ---}