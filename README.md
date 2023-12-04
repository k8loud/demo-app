App created to push metrics with sender IP to prometheus. 

To test it properly:
1. run `forward.py` on worker-0 (as defined in manifest, this app is deployed on this node)
2. run `locust` locally (`locustfile.py` is prepared) and send requests to you worker-0 floating ip
3. you should see metrics in prometheus with label `origin=<your_ip>`