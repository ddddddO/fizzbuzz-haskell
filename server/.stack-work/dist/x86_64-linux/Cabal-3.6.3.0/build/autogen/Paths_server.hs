{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_server (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/ochi/github.com/ddddddO/fizzbuzz-haskell/server/.stack-work/install/x86_64-linux/9e94df201ff2f028c64229222402348d28a71213f33982fcf61483f4997bae42/9.2.7/bin"
libdir     = "/home/ochi/github.com/ddddddO/fizzbuzz-haskell/server/.stack-work/install/x86_64-linux/9e94df201ff2f028c64229222402348d28a71213f33982fcf61483f4997bae42/9.2.7/lib/x86_64-linux-ghc-9.2.7/server-0.1.0.0-3cHoFvdRWHzJsL7nT2Hlre"
dynlibdir  = "/home/ochi/github.com/ddddddO/fizzbuzz-haskell/server/.stack-work/install/x86_64-linux/9e94df201ff2f028c64229222402348d28a71213f33982fcf61483f4997bae42/9.2.7/lib/x86_64-linux-ghc-9.2.7"
datadir    = "/home/ochi/github.com/ddddddO/fizzbuzz-haskell/server/.stack-work/install/x86_64-linux/9e94df201ff2f028c64229222402348d28a71213f33982fcf61483f4997bae42/9.2.7/share/x86_64-linux-ghc-9.2.7/server-0.1.0.0"
libexecdir = "/home/ochi/github.com/ddddddO/fizzbuzz-haskell/server/.stack-work/install/x86_64-linux/9e94df201ff2f028c64229222402348d28a71213f33982fcf61483f4997bae42/9.2.7/libexec/x86_64-linux-ghc-9.2.7/server-0.1.0.0"
sysconfdir = "/home/ochi/github.com/ddddddO/fizzbuzz-haskell/server/.stack-work/install/x86_64-linux/9e94df201ff2f028c64229222402348d28a71213f33982fcf61483f4997bae42/9.2.7/etc"

getBinDir     = catchIO (getEnv "server_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "server_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "server_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "server_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "server_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "server_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
