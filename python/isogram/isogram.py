import string

def is_isogram(text):
    chars = [c for c in text.lower() if c in string.ascii_lowercase]
    unique = set(chars)

    return len(chars) == len(unique)
