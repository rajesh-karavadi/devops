from flask import Flask
app = Flask(__name__)

@app.route("/flask/hello")
def hello():
    return "Hello from Flask + Argo CD! >>>>>>>v3<<<<<<<<"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
