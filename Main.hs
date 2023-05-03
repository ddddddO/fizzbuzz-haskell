module Main (main) where

import FizzBuzz

-- $ ghci
-- ghci> :l FBNum.hs FizzBuzz.hs Main.hs
-- ghci> Main.main
main :: IO()
main = do
  let max = 50
      nums = [0..max]

  putStrLn "----------------"
  putStrLn "   Fizz Buzz!   "
  putStrLn "----------------"

  let rets = [ fizzBuzz nums
             , fizzBuzz' nums
             , fizzBuzz'' nums
             , fizzBuzz''' nums
             , fizzBuzz'''' nums
             ]

  -- ["fizzbuzz","1","2","fizz","4","buzz","fizz","7","8","fizz","buzz","11","fizz","13","14","fizzbuzz","16","17","fizz","19","buzz","fizz","22","23","fizz","buzz","26","fizz","28","29","fizzbuzz","31","32","fizz","34","buzz","fizz","37","38","fizz","buzz","41","fizz","43","44","fizzbuzz","46","47","fizz","49","buzz"]
  print $ head rets
  putStrLn ""

  test rets


test :: [[String]] -> IO()
test rets = do
  putStrLn "----------------"
  putStrLn "      Test      "
  putStrLn "----------------"

  putStrLn (
          let succeeded = (length passed) == (length rets - 1); in case succeeded of
                True  -> "Ok!"
                False -> "Fail..."
        )
  where passed = filter (==True) $ zipWith (==) (init rets) (tail rets)


-- etc
square nums = map (\a -> a*a) nums
square' nums = [a^2 | a <- nums]

max4 = max 4
-- ghci> max4 5
-- 5
-- ghci> max4 3
-- 4

composition = replicate 2 . product . map (*3) $ zipWith max [1, 2] [4, 5]
testComp = composition == (replicate 2 (product (map (*3) (zipWith max [1, 2] [4, 5]))))

-- Binary Search Tree : http://learnyouahaskell.com/making-our-own-types-and-typeclasses#recursive-data-structures
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
  | x == a = Node x left right
  | x < a  = Node a (treeInsert x left) right
  | x > a  = Node a left (treeInsert x right)

treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node a left right)
  | x == a = True
  | x < a  = treeElem x left
  | x > a  = treeElem x right

-- ghci> :l Main.hs
-- ghci> let nums = [8,6,4,1,7,3,5]
-- ghci> let numsTree = foldr treeInsert EmptyTree nums
-- ghci> numsTree
-- Node 5 (Node 3 (Node 1 EmptyTree EmptyTree) (Node 4 EmptyTree EmptyTree)) (Node 7 (Node 6 EmptyTree EmptyTree) (Node 8 EmptyTree EmptyTree))
-- ghci> 8 `treeElem` numsTree
-- True
-- ghci> 100 `treeElem` numsTree
-- False

--
myPutStr :: String -> IO ()
myPutStr [] = return ()
myPutStr (x:xs) = do
  putChar x
  myPutStr xs
-- ghci> myPutStr "hellow!!"
-- hellow!!ghci>
