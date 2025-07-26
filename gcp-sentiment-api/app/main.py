from flask import Flask, request, jsonify
from textblob import TextBlob
import os

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({"message": "Welcome to Sentiment Analysis API!"})

@app.route('/analyze', methods=['POST'])
def analyze_sentiment():
    data = request.get_json()
    text = data.get("text", "")

    if not text:
        return jsonify({"error": "No text provided"}), 400

    blob = TextBlob(text)
    sentiment = blob.sentiment

    return jsonify({
        "text": text,
        "polarity": sentiment.polarity,
        "subjectivity": sentiment.subjectivity
    })

if __name__ == '__main__':
    app.run(debug=True)
    port = int(os.environ.get("PORT", 8080))
    app.run(host='0.0.0.0', port=port, debug=True)