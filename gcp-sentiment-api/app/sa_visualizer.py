import os
import requests
from flask import request
import pandas as pd
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer
import plotly.express as px
from flask import Flask, render_template_string
from datetime import datetime, timedelta

# Flask app
app = Flask(__name__)

# Finnhub API key (set it as ENV variable: export FINNHUB_KEY=your_key)
API_KEY = "d2i9sehr01qgfkrlao80d2i9sehr01qgfkrlao8g"

def fetch_news(symbol: str, finhub_key: str):
    """Fetch latest Apple news from Finnhub"""
    url = "https://finnhub.io/api/v1/company-news"
    yesterday = (datetime.now() - timedelta(days=10)).strftime("%Y-%m-%d")
    today = datetime.now().strftime("%Y-%m-%d")

    params = {
        "symbol": symbol,
        "from": yesterday,
        "to": today,
        "token": finhub_key
    }

    response = requests.get(url, params=params)
    try:
        data = response.json()
    except Exception as e:
        print("❌ JSON decode error:", e)
        return pd.DataFrame()

    if not isinstance(data, list) or len(data) == 0:
        print("⚠️ No news returned. Full response:", data)
        return pd.DataFrame()

    df = pd.DataFrame([{
        "date": datetime.utcfromtimestamp(a["datetime"]).date(),
        "headline": a.get("headline", "")
    } for a in data if "headline" in a])

    return df

def analyze_sentiment(df):
    """Run VADER sentiment analysis"""
    analyzer = SentimentIntensityAnalyzer()
    df["sentiment"] = df["headline"].apply(
        lambda x: analyzer.polarity_scores(str(x))["compound"]
    )
    daily = df.groupby("date")["sentiment"].mean().reset_index()
    return daily

@app.route("/fetch")
def sentiment_chart():

    finhub_key = os.getenv("FINNHUB_API_KEY")
    
    if not finhub_key:
        raise ValueError("❌ API key not found! Did you set FINNHUB_API_KEY in GitHub Secrets?")
    
    symbol = request.args.get("symbol", "AAPL").upper()

    # Fetch + analyze
    df = fetch_news(symbol, finhub_key)
    if df.empty:
        return "<h3>No news data available. Check your API key or quota.</h3>"

    daily_sentiment = analyze_sentiment(df)

    # Plot with Plotly
    fig = px.line(
        daily_sentiment,
        x="date",
        y="sentiment",
        title="Apple News Daily Sentiment (Finnhub)",
        markers=True
    )
    fig.add_hline(y=0, line_dash="dash", line_color="red")
    graph_html = fig.to_html(full_html=False)

    return render_template_string("""
        <html>
        <head><title>Apple Sentiment</title></head>
        <body>
            <h2>Apple Stock News Daily Sentiment</h2>
            {{ graph|safe }}
        </body>
        </html>
    """, graph=graph_html)

if __name__ == "__main__":
    # Cloud Run requires port 8080
    app.run(host="0.0.0.0", port=8080)
