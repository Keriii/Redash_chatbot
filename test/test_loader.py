import unittest
from unittest.mock import patch
from utils.loader import LoadCSVToDatabase

class TestLoadCSVToDatabase(unittest.TestCase):

    def setUp(self):
        self.test_folder_path = 'test_data'  # Replace with your test data folder path

    def test_read_credentials(self):
        # Test reading credentials from the file
        with patch('builtins.open', return_value=iter(['test_user', 'test_password', '5432'])):
            loader = LoadCSVToDatabase(self.test_folder_path)
            username, password, port = loader.read_credentials()

        self.assertEqual(username, 'test_user')
        self.assertEqual(password, 'test_password')
        self.assertEqual(port, '5432')

    def test_create_db_and_load(self):
        loader = LoadCSVToDatabase(self.test_folder_path)
        loader.create_db_and_load()

if __name__ == '__main__':
    unittest.main()
