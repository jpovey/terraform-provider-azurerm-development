# Terraform Provider Development

Use this project to help develop, run and test terraform providers using windows with the help of docker. 

Terraform is built using GoLang. This can be installed for windows but issues arise when contributing to existing terraform providers, especially with path lengths being too long.

General Requirements
------------
-	[Docker](https://docs.docker.com/install/)

# Setup
Clone your required terraform provider module into a folder called `providers` in the root of this project. e.g. [terraform-provider-azurerm](https://github.com/terraform-providers/terraform-provider-azurerm)

You can import multiple providers to test & develop side by side if required.

```
terraform-provider-development
├── go.ps1
├── dockerfile
├── providers
│   ├── terraform-provider-azurerm
│   ├── terraform-provider-aws
```

# Run
The *go.ps1* script will build and run a docker container using the included *dockerfile*. 

The image which is created uses a combination of `GoLang` and `Make` to execute the commands required to build and test the provider.

```PowerShell
 #Run container and create shell for user input
.\go.ps1 -provider 'terraform-provider-azurerm'

#Run the unit tests
.\go.ps1 -provider 'terraform-provider-azurerm' -mode 'test'

#Run the acceptance tests
.\go.ps1 -provider 'terraform-provider-azurerm' -mode 'testacc'
```