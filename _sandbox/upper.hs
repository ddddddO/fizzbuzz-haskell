-- $ ghc --make upper
import Data.Char

main = do
  contents <- getContents
  putStrLn $ map toUpper contents

-- $ ./upper
-- hello
-- HELLO
-- world
-- WORLD