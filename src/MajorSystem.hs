module MajorSystem where

import Phoneme

phonemeToNumber :: Phoneme -> Maybe Int
phonemeToNumber S  = Just 0
phonemeToNumber Z  = Just 0
phonemeToNumber D  = Just 1
phonemeToNumber T  = Just 1
phonemeToNumber TH = Just 1
phonemeToNumber N  = Just 2
phonemeToNumber M  = Just 3
phonemeToNumber ER = Just 4
phonemeToNumber R  = Just 4
phonemeToNumber L  = Just 5
phonemeToNumber CH = Just 6
phonemeToNumber JH = Just 6
phonemeToNumber SH = Just 6
phonemeToNumber ZH = Just 6
phonemeToNumber G  = Just 7
phonemeToNumber K  = Just 7
phonemeToNumber F  = Just 8
phonemeToNumber V  = Just 8
phonemeToNumber B  = Just 9
phonemeToNumber P  = Just 9
phonemeToNumber NG = Just 27
phonemeToNumber _  = Nothing
