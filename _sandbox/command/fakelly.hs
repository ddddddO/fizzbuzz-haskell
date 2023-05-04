import System.Environment
import System.Directory

command :: String -> String -> IO ()
command "ls" = ls'
command "tree" = tree
command undefined = \_ -> putStrLn $ "'" ++ undefined ++ "'" ++ " is not implemented."

-- ghc --make fakelly
main :: IO ()
main = do
  (cmd:args) <- getArgs
  command cmd $ head args


ls' :: String -> IO ()
ls' dir = do
  dirs <- ls dir
  mapM_ putStrLn dirs

ls :: String -> IO [String]
ls dir = do
  dirs <- getDirectoryContents dir
  return dirs

tree :: String -> IO ()
tree path = do
  putStrLn path
  paths <- ls path
  let dirs = map (\p -> path ++ "/" ++ p) $ filter (\p -> not (p == path || p == "." || p == "..")) paths
  mapM_ (\p -> do
          existsDir <- doesDirectoryExist p
          case existsDir of
            True  -> tree p
            False -> putStrLn p
        ) dirs
-- ghci> :l Main.hs
-- ghci> tree "gtree"
-- gtree
-- gtree/tree.go
-- gtree/testdata
-- gtree/testdata/sample2.md
-- gtree/testdata/sample1.md
-- gtree/cmd
-- gtree/cmd/gtree
-- gtree/cmd/gtree/main.go
-- gtree/makefile
