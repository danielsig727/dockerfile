# export CR_PAT=$GITHUB_TOKEN
# echo $CR_PAT | docker login ghcr.io -u danielsig727 --password-stdin

docker build -t ghcr.io/danielsig727/goofys:latest .
docker push ghcr.io/danielsig727/goofys:latest
