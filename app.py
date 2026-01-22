# trigger build
from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/api/data")
def get_data():
    return jsonify({"message": "Hello from backend!"})

@app.route("/")
def health():
    return "Backend is running"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
