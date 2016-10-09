module PhoneticWord (PhoneticWord(..)) where

import Phoneme (Phoneme)

data PhoneticWord = PhoneticWord { word :: String
                                 , phonemes :: [Phoneme]
                                 } deriving (Show)
