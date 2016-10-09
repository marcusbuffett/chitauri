module Main where

import Parser (parseDictionary, dictionary)
import PhoneticWord (PhoneticWord(..))
import PhoneticDictionary (PhoneticDictionary)

import qualified Data.GenericTrie as T
import qualified System.Console.Haskeline as H
import Data.Either.Unwrap (fromRight)
import Text.Read (readMaybe)
import Data.Char (digitToInt, isDigit)
import Data.Maybe (fromMaybe)

main :: IO ()
main = do
  dict <- dictionary
  let parsed = parseDictionary dict
  case parseDictionary dict of
    Left a -> print a
    Right a -> mainLoop a

mainLoop dict = H.runInputT H.defaultSettings loop
  where
    loop :: H.InputT IO ()
    loop = do
      minput <- H.getInputLine "> "
      case minput of
        Nothing -> return ()
        Just "quit" -> return ()
        Just input -> do
          H.outputStrLn . formatPhoneticWords . findWords dict $ stringToDigits input
          loop

stringToDigits :: String -> [Int]
stringToDigits = fmap digitToInt . filter isDigit

formatPhoneticWords :: [PhoneticWord] -> String
formatPhoneticWords pWords = unlines $ zipWith formatPhoneticWord pWords [0..]
  where
    formatPhoneticWord :: PhoneticWord -> Int -> String
    formatPhoneticWord pWord i = show i ++ ") " ++ word pWord 

findWords :: PhoneticDictionary -> [Int] -> [PhoneticWord]
findWords dict ds = fromMaybe [] $ T.lookup ds dict
