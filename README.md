# Bicep Training
Bicep training to learn how to create BICEP templates for Azure

###  Azure CLI commands to upload template file

1.) After installing Azure CLI need to run this 
```properties
az bicep install && az bicep upgrade
```  

2.) Now log in to azure account
```properties
az login
```  

3.) Choose and set default subscription (Sandbox for training)
```properties
az account set --subscription "Concierge Subscription"
```

Extra stepts if there is more than one sandbox subscription
```properties
az account list --refresh --query "[?contains(name, 'Concierge Subscription')].id" --output table
az account set --subscription {your subscription ID}
```

4.) Possible to set the default group for the session
```properties
az configure --defaults group=<resource_group_name>
```

5.) Deploy to azure
```properties
az deployment group create --template-file main.bicep
```

Deploy with parameters
```properties
az deployment group create --name main --template-file main.bicep --parameters environmentType=nonprod
```  

6.) Check if deployment succeeded
```properties
az deployment group list --output table
```

### Useful links
[Overview of Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)

[Fundamentals of Bicep](https://learn.microsoft.com/en-gb/training/paths/fundamentals-bicep/)

[Azure Automation](https://learn.microsoft.com/en-us/azure/automation/overview)
