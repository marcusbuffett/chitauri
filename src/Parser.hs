module Parser where

import Text.Parsec.Char (endOfLine)
import Text.ParserCombinators.Parsec.Char (anyChar, upper, digit)
import Text.Parsec (lookAhead, manyTill, skipMany, many, many1, oneOf, parse, char, sepBy, endBy, (<|>))
import Text.Parsec.Error (ParseError)
import Data.GenericTrie (fromListWith)
import Data.Maybe (catMaybes)
import Data.Char (toLower, toUpper)
import Data.List (sortBy)
import Data.Ord (compare)
import Data.Function (on)

import PhoneticDictionary (PhoneticDictionary)
import Phoneme (charsToPhoneme)
import PhoneticWord (PhoneticWord(..))
import MajorSystem(phonemeToNumber)
import Paths_chitauri (getDataFileName)

parseDictionary :: String -> Either ParseError PhoneticDictionary
parseDictionary dict = do
  let wordsOrError = parse parser "Failure" dict
  wordsToDictionary <$> wordsOrError

wordsToDictionary ws = fromListWith combineEntries $ fmap wordToTuple ws
  where
    wordToTuple pWord = (catMaybes $ phonemeToNumber <$> phonemes pWord, [pWord])
    combineEntries :: [PhoneticWord] -> [PhoneticWord] -> [PhoneticWord]
    combineEntries xs ys = sortBy (compare `on` (length . word)) $ xs ++ ys

dictionary :: IO String
dictionary = getDataFileName "assets/dict.txt" >>= readFile 
{- dictionary = readFile "assets/dict.txt"  -}

phonemesParser = many1 (char ' ') *> sepBy phonemeParser (char ' ') 
phonemeParser = many1 upper <* skipMany digit
wordParser = garbageParser *> (fixCase <$> manyTill anyChar (lookAhead $ char ' '))
garbageParser = many $ oneOf "?!@#$%^&*().,'><\"+=-_][}{/':; " <|> digit

fixCase :: String -> String
fixCase (x:xs) = toUpper x : map toLower xs
fixCase [] = []

line = do
  w <- wordParser
  ps <- catMaybes . fmap charsToPhoneme <$> phonemesParser
  return PhoneticWord { word = w, phonemes = ps }

parser = endBy line endOfLine
