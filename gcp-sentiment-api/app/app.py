from flask import Flask, render_template
from flask_socketio import SocketIO
from textblob import TextBlob
import time
import threading
import random

app = Flask(__name__, static_folder="static", template_folder="static")
socketio = SocketIO(app)

# Mock tweets for simulation
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

def stream_tweets():
    while True:
        tweet = random.choice(mock_tweets)
        sentiment, polarity = get_sentiment(tweet)

        socketio.emit('new_tweet', {
            "text": tweet,
            "sentiment": sentiment,
            "polarity": polarity
        })

        time.sleep(3)  # Simulate a tweet every 3 seconds

@app.route("/")
def index():
    return render_template("index.html")

if __name__ == "__main__":
    threading.Thread(target=stream_tweets, daemon=True).start()
    socketio.run(app, host="0.0.0.0", port=5000)
