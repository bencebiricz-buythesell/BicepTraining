param clientName string
param location string = 'westus2'
param deploymentNumber string 

@description('Select the type of environment you want to provision. Allowed values are Production and NonProduction.')
@allowed([
  'Prod'
  'Dev'
  'Uat'
])
param environmentType string = 'Dev'

module appServicePlanModule 'modules/myAppSeRvicePlanModule.bicep' = {
  name: 'appServicePlanDeployment-${clientName}-${deploymentNumber}'
  params: {
    clientName: clientName
    location: location
    environmentType: environmentType
  }
}

@description('The resource group the app service plan was deployed into.')
output appServicePlanResourceGroupName string = appServicePlanModule.outputs.resourceGroupName
 
@description('The name of the app service plan.')
output appServicePlanName string = appServicePlanModule.outputs.name
 
@description('The resource ID of the app service plan.')
output appServicePlanResourceId string = appServicePlanModule.outputs.resourceId
 
@description('The location the resource was deployed into.')
output appServicePlanLocation string = appServicePlanModule.outputs.location


module appServiceApp 'modules/myAppServiceModule.bicep' = {
  name: 'site-${clientName}-${deploymentNumber}'
  params: {
    appServicePlanResourceId: appServicePlanModule.outputs.resourceId
    clientName: clientName
    environmentType: environmentType
    location: location
  }
}
