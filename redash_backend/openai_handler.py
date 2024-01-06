from flask import Flask, request, jsonify
from dotenv import load_dotenv
import openai
import json
import os
import random

# Load API key from .env file
load_dotenv()
openai.api_key = os.getenv("OPENAI_API_KEY")

app = Flask(__name__)

# List of possible answers for YouTube metadata analysis
youtube_answers = ["viewers_by_devices.sql","viewers_by_gender.sql", "views_by_cities.sql"
]

# Additional context about YouTube metadata analysis
context_about_metadata = """
YouTube metadata analysis involves examining users engagement on youtube interms of, devices used, viewers on the platfom by gender and the place where the youtube w
watched, it will give us the overview
 """

@app.route('/generate_response/<user_prompt>', methods=['GET'])
def generate_response(user_prompt):
    try:
        # Check if the user prompt is related to YouTube metadata analysis
        if "youtube metadata analysis" in user_prompt.lower():
            # Set temperature to 0.1 for a slight degree of randomness
            response = openai.Completion.create(
                engine="text-davinci-002",
                prompt=context_about_metadata + "\n" + user_prompt,
                temperature=0.1,
                max_tokens=150,
                stop=None  # Disable the stop condition to allow the model to continue generating text
            )
            # Calculate similarity between model response and each answer
            similarities = [
                max([openai.Completion.create(engine="text-davinci-002", prompt=sub_answer, temperature=0.0).choices[0].score for sub_answer in answer])
                for answer in youtube_answers
            ]
            # Choose the sublist of answers with the highest similarity
            chosen_answers = youtube_answers[similarities.index(max(similarities))]
        else:
            # Return a generic response for queries outside the YouTube metadata analysis context
            chosen_answers = ["I'm sorry, I cannot provide specific information on that topic. Ask only question related to youtube meta data analysis"]

        # Choose a random answer from the selected sublist
        chosen_answer = chosen_answers[random.randint(0, len(chosen_answers) - 1)]

        # Write the output to openai.json
        with open('openai.json', 'w') as file:
            json.dump({"query": chosen_answer}, file)

        return jsonify({"model_response": chosen_answer})

    except Exception as e:
        return jsonify({"error": str(e)})

if __name__ == '__main__':
    app.run(debug=True)
