param clientName string
param deploymentNumber string 

@description('Select the type of environment you want to provision. Allowed values are Production and NonProduction.')
@allowed([
  'Prod'
  'Dev'
  'Uat'
])
param environmentType string = 'Dev'

@allowed([
  'westus2'
  'north-europe'
  'southeast-asia'
])
param location string  = 'westus2'

param environmentConfigurationMap object

param publisherEmail string = 'test.com'
param publisherName string = 'BuyTheSell'
param sku string = 'Developer'

param hostnameConfigurations array

module appServicePlanModule 'modules/myAppSeRvicePlanModule.bicep' = {
  name: 'appServicePlanDeployment-${clientName}-${deploymentNumber}'
  params: {
    clientName: clientName
    location: location
    environmentType: environmentType
  }
}

module appServiceApp 'modules/myAppServiceModule.bicep' = {
  name: 'site-${clientName}-${deploymentNumber}'
  params: {
    appServicePlanResourceId: appServicePlanModule.outputs.resourceId
    location: location
    clientName: clientName
    environmentType: environmentType
  }
}

module storageAccount 'modules/myStorageAccount.bicep' = {
  name: 'storageAcc-${clientName}-${deploymentNumber}'
  params: {
    clientName: clientName
    environmentType: environmentType
    environmentConfigurationMap: environmentConfigurationMap
  }
}

module apiManagement 'modules/myApiManagement.bicep' = {
  name: 'apiManagement-${clientName}-${deploymentNumber}'
  params: {
    location: location
    clientName: clientName
    environmentType: environmentType
    publisherEmail: publisherEmail
    publisherName: publisherName
    sku: sku
    hostnameConfigurations: hostnameConfigurations
  }
}

// module functionApp 'modules/myFunctionApp.bicep' = {
//   name: 'functionApp-${clientName}-${deploymentNumber}'
//   params: {
//     location: location
//     appServicePlanResourceId: appServicePlanModule.outputs.resourceId
//     clientName: clientName
//     environmentType: environmentType
//   }
// }

// module logicApp 'modules/myLogicApp.bicep' = {
//   name: 'logicApp-${clientName}-${deploymentNumber}'
//   params: {
//     location: location
//     clientName: clientName
//     environmentType: environmentType
//   }
// }
