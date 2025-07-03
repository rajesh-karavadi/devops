from flask import Flask
app = Flask(__name__)

@app.route("/flask-api/hello")
def hello():
    return "Hello from Flask + Argo CD!>>>>>>>>>>>>>>><<<<<<<<"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
