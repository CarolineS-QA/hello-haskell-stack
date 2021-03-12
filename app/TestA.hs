module TestA where

{--- CH 6 Excersies ---}

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
           | otherwise = euclid x (y - x)

-- cinco
-- just write it all out... eww.

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
mergeR xs [] = xs
mergeR [] xs = xs
mergeR (x:xs) (y:ys) | x > y = y : mergeR (x:xs) ys
                     | y > x = x : mergeR xs (y:ys)

-- octo
halve :: [a] -> ([a], [a])
halve xs = splitAt (length xs `div` 2) xs
--hint? use halve :: [a] -> ([a],[a])

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = mergeR (msort ys) (msort zs)
           where (ys, zs) = halve xs

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

{-

last2 :: [a] -> a
last2 xs = head (reverse xs)

-}

