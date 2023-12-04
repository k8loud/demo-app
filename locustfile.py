from locust import HttpUser, HttpLocust, TaskSet, task

class HelloWorldUser(HttpUser):
    @task
    def hello_world(self):
        self.client.get("/")
