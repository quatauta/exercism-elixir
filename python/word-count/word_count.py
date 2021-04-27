import re
import string

def count_words(sentence):
    words = re.split("[^a-z0-9']", sentence.lower())
    words = [re.sub("(^'+|'+$)", "", w) for w in words]
    words = [w for w in words if w]
    counts = {}

    for word in words:
        counts[word] = counts.get(word, 0) + 1

    return counts
