def two_fer(name = "you"):
    if name:
        name = name.strip()

    if not name:
        name = "you"

    return f"One for {name}, one for me."
