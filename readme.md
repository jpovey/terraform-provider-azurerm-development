# Terraform Provider Development

Develop, run and test terraform providers using with windows. 

General Requirements
------------
-	[Docker](https://docs.docker.com/install/)

# Setup
Clone your required terraform provider module into the *providers* folder. e.g. [terraform-provider-azurerm](https://github.com/terraform-providers/terraform-provider-azurerm)

You can import multiple providers to test & develop side by side if required

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

```powershell
 #Run container and create shell for user input
.\go.ps1 -provider 'terraform-provider-azurerm'

#Run the unit tests
.go.ps1 -provider 'terraform-provider-azurerm' -mode 'test'

#Run the acceptance tests
./go.ps1 -provider 'terraform-provider-azurerm' -mode 'testacc'
```