param clientName string
param environmentType string
param environmentConfigurationMap object

module storage './Modules/storage-account.bicep' = {
  name: 'storageDeployment'
  params: {
    environmentConfigurationMap: environmentConfigurationMap
    clientName: clientName
    environmentType: environmentType
  }
}
