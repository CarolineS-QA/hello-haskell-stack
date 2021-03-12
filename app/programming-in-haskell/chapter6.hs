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
andR (x:xs) | x = andR xs
            | otherwise = False

-- sies B
concatR :: [[a]] -> [a]
concatR [] = []
concatR (x:xs) = x ++ concatR xs

-- concatR xs = foldr (++) [] xs

-- sies C
replicateR :: Int -> a -> [a]
replicateR 0 x = []
replicateR 1 x = [x]
replicateR n x = x : replicateR (n-1) x

-- sies D
(!!*) :: [a] -> Int -> a
-- [] !!* _ =
(x:_) !!* 1 = x
(_:xs) !!* n = xs !!* (n-1)

-- sies E
elemR :: Eq a => a -> [a] -> Bool
elemR a [] = False
elemR a (x:xs) | a == x = True
               | otherwise = elemR a xs

-- seven!

mergeR :: Ord a => [a] -> [a] -> [a]
mergeR [] [] = []