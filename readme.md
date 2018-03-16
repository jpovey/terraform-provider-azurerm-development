# Terraform Provider Development

Use this project to help develop, run and test the azure terraform provider using windows with the help of docker. 

General Requirements
------------
-	[Docker](https://docs.docker.com/install/)

# Setup
Clone the [terraform-provider-azurerm](https://github.com/terraform-providers/terraform-provider-azurerm) repository into the `provider` folder in the root of this project.

```
terraform-provider-development
├── go.ps1
├── dockerfile
├── provider
│   ├── terraform-provider-azurerm
```

# Run
The *go.ps1* script will build and run a docker container using the included *dockerfile*. 

The image which is created uses a combination of `GoLang` and `Make` to execute the commands required to build and test the provider.

To run acceptance tests you will need to set your azure subscription credentials in *env.list*

```PowerShell
 #Run container and create shell for user input
.\go.ps1

#Run the unit tests
.\go.ps1 -mode 'test'

#Run the acceptance tests
.\go.ps1 -mode 'testacc'
```