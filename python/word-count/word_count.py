import re
import string

def count_words(sentence):
    words = re.sub(r"\W\B|\B\W|_|,", " ", sentence).lower().split()
    counts = {}

    for word in words:
        counts[word] = counts.get(word, 0) + 1

    return counts
