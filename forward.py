from flask import Flask, request, jsonify
import requests

app = Flask(__name__)

@app.route('/')
def forward_request():
    # Preserve original client's IP address
    client_ip = request.remote_addr

    # Forward the request to the target server
    target_url = 'http://<CLUSTER_IP>:80'
    response = requests.get(target_url, headers={'X-Forwarded-For': client_ip})
    #return client_ip
    # Return the response from the target server
    return response.content, response.status_code, response.headers.items()

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
