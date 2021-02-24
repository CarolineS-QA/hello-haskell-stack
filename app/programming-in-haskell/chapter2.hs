{- Chapter 2 -}

-- layout rule

--syntax check

--lowercase n, use `back ticks`, correct spacing
n = a `div` length xs
    where
        a = 10
        xs = [1, 2, 3, 4, 5]

--last takes the last element of the list
last0 xs = xs !! (length xs - 1)
last1 xs = sum(drop(length xs - 1) xs)
-- more Haskelly way
last2 xs = head (reverse xs)
last3 xs = head . reverse


--init takes initial segment (everything but last element)
init0 xs = take y xs
           where y = length xs - 1
-- a more Haskelly way
init1 xs = reverse (tail (reverse xs))
