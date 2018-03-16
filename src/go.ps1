Param(
  [string]$mode='default'
)

$provider="terraform-provider-azurerm"

docker build ./ -t "$provider-dev" --build-arg provider=$provider
docker run -it --rm -e mode=$mode --env-file ./env.list "$provider-dev"