module Cha1 where
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

