Param(
  [string]$provider,
  [string]$mode='default'
)

docker build ./ -t "$provider-dev" --build-arg provider=$provider  
docker run -it --rm -e mode=$mode "$provider-dev"