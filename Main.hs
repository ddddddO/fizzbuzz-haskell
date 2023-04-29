import FizzBuzz

-- $ ghci
-- ghci> :l Main.hs FizzBuzz.hs
-- ghci> main
main :: IO()
main = do
  let max = 50
      nums = [0..max]

  print "----------------"
  print "   Fizz Buzz!   "
  print "----------------"

  let rets = [ fizzBuzz nums
             , fizzBuzz' nums
             , fizzBuzz'' nums
             , fizzBuzz''' nums
             , fizzBuzz'''' nums
             ]

  -- ["fizzbuzz","1","2","fizz","4","buzz","fizz","7","8","fizz","buzz","11","fizz","13","14","fizzbuzz","16","17","fizz","19","buzz","fizz","22","23","fizz","buzz","26","fizz","28","29","fizzbuzz","31","32","fizz","34","buzz","fizz","37","38","fizz","buzz","41","fizz","43","44","fizzbuzz","46","47","fizz","49","buzz"]
  print $ head rets

  test rets


test :: [[String]] -> IO()
test rets = do
  print "----------------"
  print "      Test      "
  print "----------------"

  print (
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