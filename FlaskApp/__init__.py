#hello world
from flask import Flask
app = Flask(__name__)
@app.route("/")
def hello():
    return "Hello, I love AWS"
if __name__ == "__main__":
    app.run()
