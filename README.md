# AngularCLI and docker multi-stage build

Example project to demonstrate a docker multi-stage build using nginx as webserver for the final Angular application.
Build:
```
docker build -t sample/angular-app
```

Execute final image using

```
docker run --rm -p 8080:8080 sample/angular-app
```

And access using http://localhost:8080

The project is using the Docker image https://hub.docker.com/r/trion/ng-cli/ for building the Angular application using Docker.
