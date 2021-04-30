from collections import Counter
from functools import *
import string

def score(word):
    letter_count = Counter(letters(word.lower()))
    return sum(map(lambda x: x[1] * letter_score(x[0]), letter_count.items()))

def letter_score(letter):
    letter_classes = { "aeioulnrst": 1, "dg": 2, "bcmp": 3, "fhvwy": 4, "k": 5, "jx": 8, "qz": 10 }
    score = [score for letters, score in letter_classes.items() if letter in letters][0]

    return score

def letters(word):
    return list(filter(lambda letter: letter in string.ascii_letters, list(word)))
