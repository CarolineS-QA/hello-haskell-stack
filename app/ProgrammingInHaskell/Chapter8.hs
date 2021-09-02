module ProgrammingInHaskell.Chapter8 where

type Pos = (Int, Int)
type Translate = Pos -> Pos

-- could expand this to work on angles
data Move = North | East | South | West deriving (Show, Read)

move :: Move -> Pos -> Pos
move North (x,y) = (x,y+1)
move South (x,y) = (x,y-1)
move East (x,y) = (x+1,y)
move West (x,y) = (x-1,y)

moves :: [Move] -> Pos -> Pos
moves [] p = p
moves (m:ms) p = moves ms (move m p)

rev :: Move -> Move
rev North = South
rev South = North
rev East = West
rev West = East
 

-- 8.6 Tautology checker

{- negation, conjunction, implication
truth tables
-}

-- Prop = Proposition
data Prop = Const Bool
                | Var Char
                | Not Prop
                | And Prop Prop
                | Imply Prop Prop

p1 :: Prop
p1 = And (Var 'A') (Not (Var 'A'))

prop2 :: Prop
prop2 = Imply (And (Var 'A') (Var 'B')) (Var 'A')

p3 :: Prop
p3 = Imply (Var 'A') (And (Var 'A') (Var 'B'))

p4 :: Prop
p4 = Imply (And (Var 'A') (Imply (Var 'A') (Var 'B'))) (Var 'B')

type Assoc k v = [(k,v)] 

find :: Eq k => k -> Assoc k v -> v
find k t = head [v | (k',v) <- t, k == k']

type Subst = Assoc Char Bool

eval :: Subst -> Prop -> Bool
eval _ (Const b) = b
eval s (Var x) = find x s
eval s (Not p) = not (eval s p)
eval s (And p q) = eval s p && eval s q
eval s (Imply p q) = eval s p <= eval s q

vars :: Prop -> [Char]
vars (Const _) = []
vars (Var x) = [x]
vars (Not p) = vars p
vars (And p q) = vars p ++ vars q
vars (Imply p q) = vars p ++ vars q

-- For example
-- vars p2 = ['A', 'B', 'A']

-- producing lists of logical values of a given length
bools :: Int -> [[Bool]]
bools 0 = [[]]
bools n = map (False:) bss ++ map (True:) bss
          where bss = bools (n-1) 

-- From Chapter 7
rmdups :: Eq a => [a] -> [a]
rmdups [] = []
rmdups (x:xs) = x : filter (/= x) (rmdups xs)

substs :: Prop -> [Subst]
substs p = map (zip vs) (bools (length vs))
           where vs = rmdups (vars p)

isTaut :: Prop -> Bool
isTaut p = and [eval s p | s <- substs p]

-- 8.7 Abstract machine

data Expr = Val Int | Add Expr Expr

value :: Expr -> Int
value (Val n) = n
value (Add x y) = value x + value y

-- 8.9 Exercises
data Nat = Zero | Succ Nat

addnat :: Nat -> Nat -> Nat
addnat Zero n = n
addnat (Succ m) n = Succ (addnat m n)

-- Uno

multnat :: Nat -> Nat -> Nat
multnat Zero n = Zero
multnat (Succ Zero) n = n
multnat (Succ m) n = addnat n (multnat m n)

-- multnat 3 2
-- addnat 2 (multnat 2 2)
-- addnat 2 (addnat 2 (multnat 2 2))
-- addnat 2 (addnat 2 (addnat 2 (multnat 1 2)))
-- addnat 2 (addnat 2 (addnat 2 (2)))
-- evaluating all the addnats...
-- addnat 2 (addnat 2 (Succ addnat 1 2))
-- eventually get Succ (Succ (Succ (Succ (Succ (Succ Zero)))))
-- aka Natural number 6

data Ordering = LT | EQ | GT
-- compare :: Ord a => a -> a -> Ordering
-- occurs :: Ord a => a -> Tree a -> Bool
-- Search trees

-- binary trees
data Tree a = Leaf a | Node (Tree a) (Tree a)
