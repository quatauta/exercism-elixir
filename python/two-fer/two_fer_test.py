import unittest

from two_fer import two_fer

# Tests adapted from `problem-specifications//canonical-data.json`


class TwoFerTest(unittest.TestCase):
    def test_no_name_given(self):
        self.assertEqual(two_fer(), "One for you, one for me.")

    def test_none_name_given(self):
        self.assertEqual(two_fer(None), "One for you, one for me.")

    def test_spaces_only_name_given(self):
        self.assertEqual(two_fer("   "), "One for you, one for me.")

    def test_a_name_given(self):
        self.assertEqual(two_fer("Alice"), "One for Alice, one for me.")

    def test_another_name_given(self):
        self.assertEqual(two_fer("Bob"), "One for Bob, one for me.")

    def test_another_name_with_spaces_given(self):
        self.assertEqual(two_fer("  Bob  "), "One for Bob, one for me.")


if __name__ == "__main__":
    unittest.main()
