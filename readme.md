# Terraform Provider Development

Use this project to help develop, run and test the azure terraform provider using windows with the help of docker. 

General Requirements
------------
-	[Docker](https://docs.docker.com/install/)

# Setup
Clone the [terraform-provider-azurerm](https://github.com/terraform-providers/terraform-provider-azurerm) repository into this projects `/src/provider` folder.

```
terraform-provider-azurerm-development
├── src
|   ├── go.ps1
|   ├── env.list
|   ├── dockerfile
|   ├── provider
|   |   ├── terraform-provider-azurerm
```

Set your azure service principle credentials in `env.list`. These are used to run acceptance tests, _these will create real resources and cost real money_.

# Run
The `go.ps1` script will build and run a docker container using the included `dockerfile`. By default a shell will be created for user input.

The image which is created uses a combination of *GoLang* and *Make* to execute the commands required to build the provider.

```PowerShell
.\go.ps1
```

# Automated Testing
Unit and acceptance tests can be run using the same `go.ps1` script.

To run acceptance tests you will need to set your azure subscription credentials in `env.list`.

```PowerShell
.\go.ps1 -mode 'test'

.\go.ps1 -mode 'testacc'
```

Use the `testPrefix` parameter to target a specific set of tests

```PowerShell
.\go.ps1 -mode 'test' -testPrefix 'TestAzureFind'

.\go.ps1 -mode 'testacc' -testPrefix 'TestAccAzureRM'
```

# Manual Testing
To test the provider manually run the `go.ps1` script to build the image and open a command line.

When the image is created any `*.tf` files will be copied from the src folder into the provider directory in the container. Create files with a .tf extension to configure terraform resources for testing.

From here use the normal terraform commands to test the provider. The azure subscription credentials set in `env.list` will be used to connect and login to azure and could cost money.

```PowerShell
terraform init

terraform plan

terraform apply
```