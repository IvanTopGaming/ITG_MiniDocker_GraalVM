docker build -t docker.io/ivantopgaming/mini_graalvm:21 -f Dockerfile.graalvm-21 .
docker build -t docker.io/ivantopgaming/mini_graalvm:24 -f Dockerfile.graalvm-24 .
docker build -t docker.io/ivantopgaming/mini_graalvm:25 -f Dockerfile.graalvm-25 .
docker build -t docker.io/ivantopgaming/mini_graalvm:latest .

docker push docker.io/ivantopgaming/mini_graalvm:21
docker push docker.io/ivantopgaming/mini_graalvm:24
docker push docker.io/ivantopgaming/mini_graalvm:25
docker push docker.io/ivantopgaming/mini_graalvm:latest