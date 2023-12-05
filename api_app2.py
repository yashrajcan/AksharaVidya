
from flask import Flask, request, jsonify
import pickle
import numpy as np

model = pickle.load(open('dyslexia_model.pkl', 'rb'))
app = Flask(__name__)

@app.route('/')
def home():
    return "api key"

@app.route('/predict', methods=['POST'])
def predict():
    language_vocab = float(request.form.get('language_vocab'))
    memory = float(request.form.get('memory'))
    speed = float(request.form.get('speed'))
    visual_discrimination = float(request.form.get('visual_discrimination'))
    audio_discrimination = float(request.form.get('audio_discrimination'))
    survey_score = float(request.form.get('survey_score'))

    input_query = np.array([[language_vocab, memory, speed, visual_discrimination, audio_discrimination, survey_score]])
    result = model.predict(input_query)[0]

    response = {'dyslexic': str(result)}
    return jsonify(response)

if __name__ == '__main__':
    app.run(debug=True)
