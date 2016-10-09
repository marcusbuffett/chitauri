module PhoneticDictionary where

import Data.GenericTrie (Trie)

import PhoneticWord (PhoneticWord)

type PhoneticDictionary = Trie [Int] [PhoneticWord]
