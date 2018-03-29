Param(
  [string]$mode='default',
  [string]$testPrefix=''
)

$provider="terraform-provider-azurerm"

docker build ./ -t "$provider-dev" --build-arg provider=$provider
docker run -it --rm -e mode=$mode -e testPrefix=$testPrefix --env-file ./env.list "$provider-dev"