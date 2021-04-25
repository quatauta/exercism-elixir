class Matrix:
    def __init__(self, matrix_string):
        self.rows = []
        lines = matrix_string.splitlines()

        for line in lines:
            columns = [int(value) for value in line.split()]

            self.rows.append(columns)

    def row(self, index):
        return self.rows[index - 1]

    def column(self, index):
        column = []

        for row in self.rows:
            column.append(row[index - 1])

        return column
