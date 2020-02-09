import docker
client = docker.from_env()

test_container_name = "ubuntu:latest"
print(f"Running {test_container_name}")
client.containers.run(test_container_name, "echo hello world")
print(client.containers.list())