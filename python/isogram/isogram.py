import string

def is_isogram(text):
    chars = {}

    for char in text.lower():
        if char in string.ascii_lowercase:
            chars[char] = chars.get(char, 0) + 1

    return len([x for x in chars.values() if x > 1]) == 0
