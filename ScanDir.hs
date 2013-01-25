{-# LANGUAGE RecordWildCards #-}
module Main where

import Data.Maybe
import Options.Applicative
import System.FilePath
import System.Directory
import Control.Monad

safeHead [] = Nothing
safeHead (x:_) = Just x

scan ScanOpts {..} = do
    -- let f d = d </> ".." </> template
    -- print $ take limit $ iterate f dir
    xs <- filterM doesFileExist $ take limit $ map (\i-> dir </> i </> template) $ iterate (".." </>) "."
    maybe (return "") canonicalizePath $ safeHead xs

data ScanOpts = ScanOpts
  { template :: String
  , limit :: Int 
  , dir :: String }

mkOpts :: Parser ScanOpts
mkOpts = ScanOpts
     <$> strOption
         ( long "template"
        <> metavar "FILENAME"
        <> help "Name of template file" )
     <*> option
         ( long "limit"
        <> metavar "DEPTH"
        <> help "Max depth value" )
     <*> argument str ( metavar "FILE" )
         
main :: IO ()
main = execParser opts >>= scan >>= putStrLn
  where
    opts = info (helper <*> mkOpts)
      ( fullDesc    
     <> progDesc "Print a greeting for TARGET"
     <> header "hello - a test for optparse-applicative" )
