module FizzBuzz
  ( fizzBuzz
  , fizzBuzz'
  , fizzBuzz''
  , fizzBuzz'''
  , fizzBuzz''''
  ) where

fizzBuzz :: [Int] -> [String]
fizzBuzz nums =
  let fizzBuzzNums = [a | a <- fizz nums, b <- buzz nums, a == b] -- [0,15,30,45]
      fizzNums = [a | a <- fizz nums] -- [3,6,9,12,15,18,21,24,27,30,33,36,39,42,45,48]
      buzzNums = [a | a <- buzz nums] -- [5,10,15,20,25,30,35,40,45,50]
      judge a
        | a `elem` fizzBuzzNums = "fizzbuzz"
        | a `elem` fizzNums = "fizz"
        | a `elem` buzzNums = "buzz"
        | otherwise = show a
  in
    [ judge a | a <- nums ]

fizz nums = [a | a <- nums, a `mod` 3 == 0]
buzz nums = [a | a <- nums, a `mod` 5 == 0]


fizzBuzz' :: [Int] -> [String]
fizzBuzz' nums =
  map (\a -> if a `mod` 15 == 0 then "fizzbuzz" else if a `mod` 3 == 0 then "fizz" else if a `mod` 5 == 0 then "buzz" else show a) nums


fizzBuzz'' :: [Int] -> [String]
fizzBuzz'' nums =
  let initializedTupls = zip nums (cycle [""])
      fizzBuzz = zipFizzBuzz (zipFizzBuzz initializedTupls (3, "fizz")) (5, "buzz")
  in
    map (\tupl -> if snd tupl == "" then show (fst tupl) else snd tupl) fizzBuzz

zipFizzBuzz :: [(Int, String)] -> (Int, String) -> [(Int, String)]
zipFizzBuzz numTupls fb =
  let fbNums = take (length numTupls) (cycle [fst fb])
  in
    zipWith (\tupl -> \a -> (fst tupl, (snd tupl) ++ (if (fst tupl) `mod` a == 0 then snd fb else ""))) numTupls fbNums


fizzBuzz''' :: [Int] -> [String]
fizzBuzz''' nums =
  let initializedNums = map (\a -> FBNum a "") nums
      fizzBuzz = toFizzBuzz (toFizzBuzz initializedNums (3, "fizz")) (5, "buzz")
  in
    toStrings fizzBuzz

data FBNum = FBNum Int String
instance Show FBNum where
  show (FBNum num msg) = if msg == "" then show num else msg
getMsg :: FBNum -> String
getMsg (FBNum _ msg) = msg
getNum :: FBNum -> Int
getNum (FBNum num _) = num
toFizzBuzz :: [FBNum] -> (Int, String) -> [FBNum]
toFizzBuzz fbNums fb =
  map (\a -> if getNum a `mod` (fst fb) == 0 then FBNum (getNum a) ((getMsg a) ++ (snd fb)) else FBNum (getNum a) (getMsg a)) fbNums
toStrings :: [FBNum] -> [String]
toStrings fbNums = map (\a -> show a) fbNums


fizzBuzz'''' :: [Int] -> [String]
fizzBuzz'''' nums =
  let judge a
        | a `mod` 15 == 0 = "fizzbuzz"
        | a `mod` 3 == 0 = "fizz"
        | a `mod` 5 == 0 = "buzz"
        | otherwise = show a
  in
    [ judge a | a <- nums ]
