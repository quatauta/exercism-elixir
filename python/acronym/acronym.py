import re

def abbreviate(words):
    words = re.sub(r"[_']+", "", words)
    letters = re.compile(r"\b[a-zA-Z]").findall(words)
    letters = map(lambda x: x.upper(), letters)
    acronym = "".join(letters)

    return acronym
