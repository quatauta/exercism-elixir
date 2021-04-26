def distance(strand_a, strand_b):
    if len(strand_a) != len(strand_b):
        raise ValueError("Strands A & B have different lengths. A: {len(strand_a)}, B: {len(strand_b)}")

    return len([1 for a, b in zip(strand_a, strand_b) if a != b])
