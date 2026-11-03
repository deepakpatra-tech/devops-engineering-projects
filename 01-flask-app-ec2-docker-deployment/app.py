from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello! Flask Application Successfully Deployed on AWS EC2 using Docker."

@app.route("/health")
def health():
    return {"status": "healthy"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)