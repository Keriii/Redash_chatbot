import os
import json
import dotenv
import asyncio
from flask import Flask, jsonify
from redash_python import Redash

app = Flask(__name__)

class RedashQueryExecutor:
    def __init__(self, base_url, api_key):
        self.rd = Redash(base_url=base_url, api_key=os.getenv("REDASH_API_KEY")) #use api generated from redash

    async def execute_query_from_file(self, query_name, file_path):
        # Check if the file exists
        if not os.path.isfile(file_path):
            print(f"File '{file_path}' not found for query '{query_name}'.")
            return None

        # Read the SQL query from the file
        with open(file_path, 'r') as file:
            sql_query = file.read()

        # Execute the SQL query
        result = await self.rd.queries.run_query_async(query=sql_query)

        # Return the query result
        return query_name, result

async def execute_queries_async(executor, queries):
    tasks = [executor.execute_query_from_file(name, file) for name, file in queries.items()]
    results = await asyncio.gather(*tasks)
    return results

@app.route('/execute_queries', methods=['GET'])
def execute_queries():
    # Replace 'YOUR_API_KEY' with your Redash API key
    redash_executor = RedashQueryExecutor(base_url="http://localhost:5000", api_key="redash_api")

    # our json to read queries from
    json_file_path = 'openai.json'

    # Check if the JSON file exists
    if not os.path.isfile(json_file_path):
        return jsonify({"error": f"JSON file '{json_file_path}' not found."}), 404

    # Read the query information from the JSON file
    with open(json_file_path, 'r') as json_file:
        queries_mapping = json.load(json_file)

    # folder where the schema is located
    queries_folder = 'db_schema'

    # Prepare the full file paths for each query
    queries_paths = {name: os.path.join(queries_folder, file + '.sql') for name, file in queries_mapping.items()}

    # Run the queries asynchronously
    results = asyncio.run(execute_queries_async(redash_executor, queries_paths))

    return jsonify({"results": results})

if __name__ == '__main__':
    app.run(debug=True)
