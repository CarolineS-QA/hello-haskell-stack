module Cha4 where
{- Defining Functions -}

-- Conditional experessions

-- Guarded expressions | is 'such that' (||) is OR

-- Pattern Matching - from top to bottom

(&&) :: Bool -> Bool -> Bool
True && True = True
True && False = False
False && True = False
False && False = False

(&&*) :: Bool -> Bool -> Bool
True &&* True = True
_ &&* _ = False

-- Best efficiency for lazy evaluation (lib def)
(&&**) :: Bool -> Bool -> Bool
True &&** b = b
False &&** _ = False

-- b && b = b -- gives an error for repeat variables

-- List Patterns

-- 'cons' : opperator builds and separates lists

head' :: [a] -> a
head' (x:_) = x
-- no case for empty list

-- head'' x:_ = x
-- (head'' x):_ = x

-- Lambda \

odds :: (Num b, Enum b) => b -> [b]
odds n = map f [0..n-1]
        where
            f x = x*2 + 1

odds' :: (Num b, Enum b) => b -> [b]
odds' n = map (\x -> x*2 + 1) [0..n-1]

-- `div`
-- (/) 1 2
-- orerator sections - can include an argument
-- (2+)
-- (+5)

-- (2*) doube (/2) half

{- Excersies -}
--splitAt (a/2) = (take (l/2) xs, drop (l/2) xs)

--halve' xs = if even (length xs) then splitAt (length xs / 2) xs else ([],[])
--          where l = length xs

halve :: [a] -> ([a], [a])
halve xs = splitAt (length xs `div` 2) xs

thirdA :: [a] -> a
thirdA xs = head (tail (tail xs))

thirdB :: [a] -> a
thirdB xs = xs !! 2

thirdC :: [a] -> a
thirdC [_,_,a,_] = a

--if
safetailA :: [a] -> [a]
safetailA xs = if null xs then [] else tail xs

--guarded
safetailB :: [a] -> [a]
safetailB xs | null xs = []
             | otherwise = tail xs

--pattern matching
safetailC :: [a] -> [a]
safetailC [] = []
safetailC xs = tail xs
-- alt safetailC (_:xs) = xs

-- Q4
(||) :: Bool -> Bool -> Bool
True || True = True
True || False = True
False || True = True
False || False = False 

(||*) :: Bool -> Bool -> Bool
True ||* _ = True
False ||* b = b

(||**) :: Bool -> Bool -> Bool
False ||** False = False
_ ||** _ = True

-- Q5

(&&@) :: Bool -> Bool -> Bool
a &&@ b = if a == True then
    if b == True then
        True
        else False
    else False

-- Q6
(&&@@) :: Bool -> Bool -> Bool
a &&@@ b = if a == True then b else False

-- Q7
mult :: Int -> Int -> Int -> Int
mult x y z = x*y*z
-- mult = \x -> (\y -> (\z -> x * y * z))

-- collapsed lambda
mult1 :: Int -> (Int -> (Int -> Int))
mult1 = \ x y z -> x * y * z

-- Q8

(*2)

luhnDouble :: Int -> Int
luhnDouble x | x*2 < 9 = x*2
             | otherwise = x*2 - 9