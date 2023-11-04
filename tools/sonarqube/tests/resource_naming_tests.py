import unittest

from src.helper_funcs import _no_accent, _norm, _sorted_quoted, _res_name


class MyTestCase(unittest.TestCase):
    def test_no_accent(self):
        self.assertEqual(_no_accent('é'), 'e')
        self.assertEqual(_no_accent('á'), 'a')
        self.assertEqual(_no_accent('ç'), 'c')
        self.assertEqual(_no_accent('c'), 'c')  # No accent to begin with
        self.assertEqual(_no_accent('2'), '2')  # No accent to begin with

    def test_norm(self):
        self.assertEqual(_norm('hello world!'), 'hello_world_')
        self.assertEqual(_norm('Python 3.8'), 'python_3_8')
        self.assertEqual(_norm('Café'), 'cafe')
        self.assertEqual(_norm(''), '')  # Empty string

    def test_sorted_quoted(self):
        self.assertEqual(_sorted_quoted(['banana', 'apple', 'cherry']), '"apple", "banana", "cherry"')
        self.assertEqual(_sorted_quoted(['Python', 'Java', 'C++']), '"C++", "Java", "Python"')
        self.assertEqual(_sorted_quoted([]), '')  # Empty list

    def test_res_name(self):
        self.assertEqual(_res_name('Python', '3.8'), 'python_3_8')
        self.assertEqual(_res_name('hello', 'world'), 'hello_world')
        self.assertEqual(_res_name('Café', 'au lait'), 'cafe_au_lait')

if __name__ == '__main__':
    unittest.main()
