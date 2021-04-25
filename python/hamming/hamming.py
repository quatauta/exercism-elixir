def distance(strand_a, strand_b):
    if len(strand_a) != len(strand_b):
        raise ValueError("Strands A & B have different lengths. A: {len(strand_a)}, B: {len(strand_b)}")

    distance = 0

    for index in range(0, len(strand_a)):
        if strand_a[index] != strand_b[index]:
            distance += 1

    return distance
