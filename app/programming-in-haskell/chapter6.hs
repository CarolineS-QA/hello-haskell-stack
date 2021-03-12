module Cha6 where

{- Recursive functions -}

{--- Notes ---}{-

defined in two lines:
base case = something
recursive case = itself

eg.
fac :: Int -> Int
fac 0 = 1
fac n = n * fac (n-1)

where n is positive, otherwise it will diverge aka. go on forever

empty list case
non empty list case

eg.

reverse [] = []
reverse (x:xs) = reverse xs ++ [x]

legnth [] = 0
length (_:xs) = 1 + length xs
^ don't need first value, hence it's a wildcard

Multiple arguments...

zip :: [a] -> [b] -> [(a,b)]

zip [] _ = []
zip _ [] = []
zip (x:xs) (y:ys) = (x,y) : zip xs ys

-}{-

Multi recursion examples...

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-2) + fib (n-1)


qs [] = []
qs (x:xs) = qs smaller ++ [x] ++ qs larger
            where
                smaller = [a | a <- xs, a <= x]
                larger = [b | b <- xs, b > x]

-}{-

Mutual recursion - in terms of each other

even:: Int -> Bool
even 0 = True
even n = odd (n-1)

odd :: Int -> Bool
odd 0 = False
odd n = even (n-1)

-}

{--- Excersies ---}

-- uno
facNoNegatives :: Int -> Int
facNoNegatives 0 = 1
facNoNegatives n | n > 0 = n * facNoNegatives (n-1)
                 | otherwise = 0

-- dos
sumdown :: Int -> Int
sumdown 0 = 0
sumdown n = n + sumdown (n-1)

-- tres
(^*) :: Int -> Int -> Int
m ^* 0 = 1 -- anything to the power of 0 is 1 not itself haha
m ^* n = m * (m ^* (n-1))

-- quatro
euclid :: Int -> Int -> Int
euclid 1 1 = 1
euclid x y | x == y = x
           | x > y = euclid y (x - y)
           | y > x = euclid x (y - x)

-- cinco
--eww.

-- sies A
andR :: [Bool] -> Bool
andR [] = True
andR (b:bs) | b = andR bs
            | otherwise = False

-- andR (b:bs) = b && andR bs

-- sies B
concatR :: [[a]] -> [a]
concatR [] = []
concatR (xs:xss) = xs ++ concatR xss

-- wants to be:
--concatR xs = foldr (++) [] xs

-- sies C
replicateR :: Int -> a -> [a]
replicateR 0 _ = []
replicateR n x = x : replicateR (n-1) x

-- sies D
(!!*) :: [a] -> Int -> a
-- [] !!* _ = error?
(x:_) !!* 0 = x
(_:xs) !!* n = xs !!* (n-1)

-- sies E
elemR :: Eq a => a -> [a] -> Bool
elemR a [] = False
elemR a (x:xs) | a == x = True
               | otherwise = elemR a xs

-- seven!

mergeR :: Ord a => [a] -> [a] -> [a]
mergeR [] [] = []
mergeR (x:xs) (y:ys) | x > y = y : mergeR (x:xs) ys
                     | y > x = x : mergeR xs (y:ys)

-- octo

--TODO
--msort :: Ord a => [a] -> [a]

--halve :: [a] -> ([a],[a])


-- nein A

sumR :: Num p => [p] -> p
sumR [] = 0
sumR (x:xs) = x + sumR xs

--sumR xs = foldr (+) 0 xs

-- nein B
takeR :: Int -> [a] -> [a]
takeR 0 (x:xs) = x:xs
takeR n (x:xs) = x : takeR (n-1) xs

-- nein C
lastR :: [a] -> a
lastR [x] = x
lastR (_:xs) = lastR xs