module FizzBuzz
  ( fizzBuzz
  , fizzBuzz'
  , fizzBuzz''
  , fizzBuzz'''
  , fizzBuzz''''
  ) where

import qualified Data.List as L
import qualified FBNum as FB

--
fizzBuzz :: [Int] -> [String]
fizzBuzz nums =
  let fizzBuzzNums = [a | a <- fizz nums, b <- buzz nums, a == b] -- [0,15,30,45]
      fizzNums = [a | a <- fizz nums] -- [0,3,6,9,12,15,18,21,24,27,30,33,36,39,42,45,48]
      buzzNums = [a | a <- buzz nums] -- [0,5,10,15,20,25,30,35,40,45,50]
      judge a
        | a `elem` fizzBuzzNums = "fizzbuzz"
        | a `elem` fizzNums     = "fizz"
        | a `elem` buzzNums     = "buzz"
        | otherwise             = show a
  in [ judge a | a <- nums ]
  where fizz nums = [a | a <- nums, a `mod` 3 == 0]
        buzz nums = [a | a <- nums, a `mod` 5 == 0]


--
fizzBuzz' :: [Int] -> [String]
fizzBuzz' nums =
  map (\a -> if a `mod` 15 == 0 then "fizzbuzz" else if a `mod` 3 == 0 then "fizz" else if a `mod` 5 == 0 then "buzz" else show a) nums


--
fizzBuzz'' :: [Int] -> [String]
fizzBuzz'' nums =
  map (\(num, msg) -> case msg of ""        -> show num
                                  otherwise -> msg
      ) $ L.foldl' zipFizzBuzz (zip nums $ cycle [""]) [(3, "fizz"), (5, "buzz")]
  where
    zipFizzBuzz :: [(Int, String)] -> (Int, String) -> [(Int, String)]
    zipFizzBuzz numTupls fb =
      map (\(num, msg) -> (num, msg ++ message num)) numTupls
      where
        (fbNum, fbMsg) = fb
        message num
          | num `mod` fbNum == 0 = fbMsg
          | otherwise            = ""


--
fizzBuzz''' :: [Int] -> [String]
fizzBuzz''' nums =
  map show $ L.foldl' FB.toFizzBuzz (map (\a -> FB.FBNum a "") nums) [(3, "fizz"), (5, "buzz")]


--
fizzBuzz'''' :: [Int] -> [String]
fizzBuzz'''' nums =
  [ judge a | a <- nums ]
  where judge a
          | a `mod` 15 == 0 = "fizzbuzz"
          | a `mod` 3  == 0 = "fizz"
          | a `mod` 5  == 0 = "buzz"
          | otherwise       = show a
