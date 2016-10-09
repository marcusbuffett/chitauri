# Chitauri

## What?

A command line program to help with [the
major system][1]. [The source][2] is a list of ~130,000 words and
their phonemes.

## How?

  - Uses the monadic parser combinator library [parsec][3] to parse the CMU dict
  - Constructs a Trie, where the keys are `[Int]` and the values at the nodes are `[PhoneticWord]`
  - Uses [haskeline][4] to read input and support readline niceties like ctrl-p / ctrl-n

## Why?

The major system is really helpful for remembering numbers, but it's often hard to think of words, especially when first learning the system. I thought it would be useful to have a tool that could spit out candidates for a given number.

## No, I mean why the stupid name?

TL;DR: I'm terrible at naming things.

I use the major system combined with the method of loci to memorize numbers, as the major system makes the method of loci much more effective. Loki, in the first Avengers movie, uses the Chitauri Scepter to enhance his abilities. Loki is to the Chitauri Scepter as the method of loci is to the major system.

[1]: https://www.wikiwand.com/en/Mnemonic_major_system
[2]: http://www.speech.cs.cmu.edu/cgi-bin/cmudict
[3]: https://hackage.haskell.org/package/parsec
[4]: https://hackage.haskell.org/package/haskeline
