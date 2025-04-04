param clientName string
param environmentType string
param defaultLocation string
param environmentConfigurationMap object

param hasLogAnalyticsWorkspace bool

var defaultName = toLower('${clientName}-${environmentType}-buythesell')

module storageAccount './Modules/storage-account.bicep' = {
  name: 'storageDeployment'
  params: {
    environmentConfigurationMap: environmentConfigurationMap
    clientName: clientName
    environmentType: environmentType
  }
}

module logAnalyticsWorkspace 'Modules/log-analytics-workspace.bicep' = if(hasLogAnalyticsWorkspace) {
  params: {
    clientName: clientName
    environmentType: environmentType
    defaultLocation: defaultLocation
  }
}

module serachService 'Modules/search-service.bicep' = {
  params: {
    defaultName: defaultName
    defaultLocation: defaultLocation
  }
}
