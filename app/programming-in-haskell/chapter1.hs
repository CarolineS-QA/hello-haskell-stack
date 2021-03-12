module Chapter1 where
-- Chapter 1

-- quad = double (double 2)

{-
sum [] = 0
sum (x:xs) = x + sum xs
-- Q2 proof?
sum [x] = x
sum (5) = 5 + sum []
-- because a thing + 0 always equals itself
-}

product' [] = 1
product' (x:xs) = x * product xs

fac :: (Num a, Enum a) => a -> a
fac x = product [1..x] -- such effciency, oh my!

--quick sort
qs [] = []
qs (x:xs) = qs smaller ++ [x] ++ qs larger
            where
                smaller = [a | a <- xs, a <= x]
                larger = [b | b <- xs, b > x]

-- would kill duplicates
qs1 [] = []
qs1 (x:xs) = qs smaller ++ [x] ++ qs larger
            where
                smaller = [a | a <- xs, a < x]
                larger = [b | b <- xs, b > x]

-- Chapter 1-ish
double :: Num a => a -> a
double x = x + x

quad :: Num a => a -> a
quad x = double (double x)

average :: Foldable t => t Int -> Int
average ns = sum ns `div` length ns
