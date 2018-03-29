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
The `go.ps1` script will build and run a docker container using the included `dockerfile`. 

The image which is created uses a combination of *GoLang* and *Make* to execute the commands required to build and test the provider.

To run acceptance tests you will need to set your azure subscription credentials in `env.list`.

```PowerShell
 #Run container and create shell for user input
.\go.ps1

#Run the unit tests
.\go.ps1 -mode 'test'

#Run specific unit tests
.\go.ps1 -mode 'test' -testPrefix 'TestAzureFind'

#Run the acceptance tests
.\go.ps1 -mode 'testacc'

#Run specific acceptance tests
.\go.ps1 -mode 'testacc' -testPrefix 'TestAccAzureRM'
```