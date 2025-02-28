@description('The location into which your Azure resources should be deployed.')
param location string
param clientName string
param environmentType string

var appServicePlanName = '${clientName}-${environmentType}-SP-${location}'

var environmentConfigurationMap = {
  Prod: {
    appServicePlan: {
      sku: {
        // name: 'P2v3'
        name: 'F1'
        capacity: 2
      }
    }
  }
  Dev: {
    appServicePlan: {
      sku: {
        name: 'F1'
        capacity: 0
      }
    }
  }
  Uat: {
    appServicePlan: {
      sku: {
        name: 'F1'
        capacity: 0
      }
    }
  }
}

module serverfarm 'br/public:avm/res/web/serverfarm:0.4.1' = {
  name: 'serverfarmDeployment'
  params: {
    name: appServicePlanName
    location: location
    skuCapacity: environmentConfigurationMap[environmentType].appServicePlan.sku.capacity
    skuName: environmentConfigurationMap[environmentType].appServicePlan.sku.name
    tags: {
      client: clientName
      Environment: environmentType
    }
  }
}

@description('The resource group the app service plan was deployed into.')
output resourceGroupName string = serverfarm.outputs.resourceGroupName
 
@description('The name of the app service plan.')
output name string = serverfarm.outputs.name
 
@description('The resource ID of the app service plan.')
output resourceId string = serverfarm.outputs.resourceId
 
@description('The location the resource was deployed into.')
output location string = serverfarm.outputs.location
