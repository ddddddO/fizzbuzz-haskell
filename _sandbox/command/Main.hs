import System.Directory

main :: IO()
main = do
  dirs <- ls "../../."
  mapM_ putStrLn dirs

ls :: String -> IO [String]
ls dir = do
  dirs <- getDirectoryContents dir
  return dirs