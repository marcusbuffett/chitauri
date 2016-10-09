module Phoneme (Phoneme(..), charsToPhoneme) where

data Phoneme = AA | AE | AH | AO | AW | AY | B | CH | D | DH | EH | ER | EY | F | G | HH | IH | IY | JH | K | L | M | N | NG | OW | OY | P | R | S | SH | T | TH | UH | UW | V | W | Y | Z | ZH
  deriving (Show)

charsToPhoneme :: String -> Maybe Phoneme
charsToPhoneme "AA" = Just AA
charsToPhoneme "AE" = Just AE
charsToPhoneme "AH" = Just AH
charsToPhoneme "AO" = Just AO
charsToPhoneme "AW" = Just AW
charsToPhoneme "AY" = Just AY
charsToPhoneme "B"  = Just B
charsToPhoneme "CH" = Just CH
charsToPhoneme "D"  = Just D
charsToPhoneme "DH" = Just DH
charsToPhoneme "EH" = Just EH
charsToPhoneme "ER" = Just ER
charsToPhoneme "EY" = Just EY
charsToPhoneme "F"  = Just F
charsToPhoneme "G"  = Just G
charsToPhoneme "HH" = Just HH
charsToPhoneme "IH" = Just IH
charsToPhoneme "IY" = Just IY
charsToPhoneme "JH" = Just JH
charsToPhoneme "K"  = Just K
charsToPhoneme "L"  = Just L
charsToPhoneme "M"  = Just M
charsToPhoneme "N"  = Just N
charsToPhoneme "NG" = Just NG
charsToPhoneme "OW" = Just OW
charsToPhoneme "OY" = Just OY
charsToPhoneme "P"  = Just P
charsToPhoneme "R"  = Just R
charsToPhoneme "S"  = Just S
charsToPhoneme "SH" = Just SH
charsToPhoneme "T"  = Just T
charsToPhoneme "TH" = Just TH
charsToPhoneme "UH" = Just UH
charsToPhoneme "UW" = Just UW
charsToPhoneme "V"  = Just V
charsToPhoneme "W"  = Just W
charsToPhoneme "Y"  = Just Y
charsToPhoneme "Z"  = Just Z
charsToPhoneme "ZH" = Just ZH
charsToPhoneme _    = Nothing
