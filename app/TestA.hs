module TestA where

{-
fives = 5555
order66 = "No Jedi"
-}

double :: Num a => a -> a
double x = x + x

quad :: Num a => a -> a
quad x = double (double x)

fac :: (Num a, Enum a) => a -> a
fac n = product [1..n]

average :: Foldable t => t Int -> Int
average ns = sum ns `div` length ns

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
