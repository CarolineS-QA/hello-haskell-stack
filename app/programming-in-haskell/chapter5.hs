module Chapter5 where

import Data.Char

{- List comprehensions -}

-- in repl
--[x^2 | x <- [1..5]]
-- returns:
-- [1, 4, 9, 16, 25]

{-
| read as 'such that'
<- read as 'drawn from'
x <- [1..5] expression is called a generator

think of it like a for loop

[(x,y) | x <- [1,2,3], y <- [4,5]]

[(x,y) | y <- [4,5], x <- [1,2,3]]
same outputs, different order

later generators more deeply nested - the var changes more frequently

order matters for lists not for sets
same for number of occurances

[(x,y) | x <- [1..3], y <- [x..3]]

[[a]] -> [a]
concat xss = [ x | xs <- xss, x <- xs]
take lists from lists of lists, take value x from lists


can use conditions "guards"

[x | x <- [1..10], even x]

even x is the guard

--

factors :: Int -> [Int]
factors = n [x | x <- [1..n], n `mod` x == 0]

prime :: Int -> Bool
prime n = factors n == [1,n]

primes :: Int -> [Int]
primes n = [x | x <- [2..n], prime x]

--but we can go faster...

allprimes :: [Int]
allprimes = sieve [2..] --infite list!?

sieve :: [Int] -> [Int]
sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p /=0] 

takeWhile (<=15000) allprimes

--

zip :: [a] -> [b] -> [(a,b)]


pairs :: [a] -> [(a,a)]
pairs xs = zip xs (tail xs)

sorted :: Ord a => [a] -> Bool
sorted xs = and [x =< y | (x,y) <- pairs xs]



-- String comprehension

"abc" :: String
is actually
['a','b','c'] :: [Char]

any polymorphic function on lists will work on strings

zip works

count :: Char -> String -> Int
count x xs =  length [x' | x' <- xs, x == x']
needleCount needle haystack =  length [needles | needles <- haystack, needle == needles]

altCount needle haystack =  length (filter (==needle) haystack)
-}