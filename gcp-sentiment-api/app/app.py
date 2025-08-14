from flask import Flask, render_template, request, jsonify
from textblob import TextBlob
import random

app = Flask(__name__, static_folder="static", template_folder="static")

mock_tweets = [
    "I love the new MacBook, it’s amazing! 💻",
    "Battery life is worse than before 😡",
    "The keyboard feels okay, but not great.",
    "This is the best laptop I’ve ever used!",
    "Apple’s prices are way too high.",
    "Incredible performance and display quality!",
]

def get_sentiment(text):
    blob = TextBlob(text)
    polarity = blob.sentiment.polarity
    sentiment = "positive" if polarity > 0 else "negative" if polarity < 0 else "neutral"
    return sentiment, polarity

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/sentiment", methods=["GET"])
def sentiment():
    tweet = random.choice(mock_tweets)
    sentiment, polarity = get_sentiment(tweet)
    return jsonify({
        "text": tweet,
        "sentiment": sentiment,
        "polarity": polarity
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
