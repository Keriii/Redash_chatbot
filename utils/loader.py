import os
from sqlalchemy import create_engine
import pandas as pd

class LoadCSVToDatabase:
    def __init__(self, folder_path):
        self.folder_path = folder_path
    """Reading out db credential from db_credential.txt edit this text file according to your
    database credential add username, password and port No. respectively.
    """
    def read_credentials(self):
        with open('db_credential.txt', 'r') as file:
            lines = file.readlines()
            username = lines[0].strip()
            password = lines[1].strip()
            port = lines[2].strip()
        return username, password, port

    def create_db_and_load(self):
        db_name = os.path.basename(self.folder_path)
        username, password, port = self.read_credentials()
        db_url = f'postgresql://{username}:{password}@localhost:{port}/{db_name}'
        engine = create_engine(db_url)

        for dirpath, dirnames, filenames in os.walk(self.folder_path):
            for filename in filenames:
                if filename.endswith('.csv'):
                    csv_path = os.path.join(dirpath, filename)
                    parent_folder = os.path.basename(dirpath)
                    table_name = f'{parent_folder}_{os.path.splitext(filename)[0]}' # Use 'parentfolder_filename' as table name to avoid confusion in our db table

                    data = pd.read_csv(csv_path)
                    data.to_sql(table_name, engine, if_exists='replace', index=False)
                    print(f"Data from '{filename}' inserted into '{table_name}' table.")

        print(f"All CSV files from '{self.folder_path}' loaded into the '{db_name}' database.")