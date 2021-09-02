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

noChannel:: String -> String
noChannel = decode . encode

withId :: String -> String
withId = decode . id . encode

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

rmempty :: Eq a => [[a]] -> [[a]]
rmempty = filter (/= [])

elim :: Eq a => a -> [[a]] -> [[a]]
elim x = map (filter (/= x))

rank :: Ord a => [[a]] -> [a]
rank = map snd . result . map head

winner' :: Ord a => [[a]] -> a
winner' bs = case rank (rmempty bs) of
    [c] -> c
    (c:cs) -> winner' (elim c bs)
 
{--- Excersies ---}



listComp :: (a -> b) -> [a] -> (a -> Bool) -> [b]
listComp f xs p = map f (filter p xs)

all' :: (a -> Bool) -> [a] -> Bool
all' p = and . map p

any' :: (a -> Bool) -> [a] -> Bool
any' p = or . map p


takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile xs p = take . filter p xs

dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile xs p = take . filter p xs

map' :: Foldable t1 => (t2 -> a) -> t1 t2 -> [a]
map' f xs = foldr (\x ys -> f x : ys) [] xs

filter' :: Foldable t => (a -> Bool) -> t a -> [a]
filter' p = foldr (\x xs -> if p x then x:xs else xs) []


dec2int :: [Int] -> Int
dec2int = foldl (\x y -> 10*x + y) 0

curry :: ((a,b) -> c) -> (a -> b -> c)
curry f = \x y -> f (x,y)

uncurry :: (a -> b -> c) -> ((a,b) -> c)
uncurry f = \(x,y) -> f x y

--filter p [] = []
--filter p 