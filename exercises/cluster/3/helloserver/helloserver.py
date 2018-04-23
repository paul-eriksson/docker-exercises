from flask import Flask
from redis import Redis

app = Flask(__name__)
redis = Redis(host='redis', port=6379)

@app.route('/count')
def count():
    count = redis.incr('hits')
    return 'I have {} platinum hits!\n'.format(count)

@app.route('/hello')
def hello():
    return 'Hi man!'

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
