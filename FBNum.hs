module FBNum where

data FBNum = FBNum Int String
instance Show FBNum where
  show (FBNum num "") = show num
  show (FBNum _ msg)  = msg
toFizzBuzz :: [FBNum] -> (Int, String) -> [FBNum]
toFizzBuzz fbNums fb =
  map (\(FBNum num msg) -> genFBNum num msg) fbNums
  where (fbNum, fbMsg) = fb
        genFBNum num msg
          | num `mod` fbNum == 0 = FBNum num $ msg ++ fbMsg
          | otherwise            = FBNum num msg
