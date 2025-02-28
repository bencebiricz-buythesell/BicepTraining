@description('The location into which your Azure resources should be deployed.')
param location string
param clientName string
param appServicePlanResourceId string

param environmentType string

var appServiceName = '${clientName}-${environmentType}-buythesell-${location}'

module site 'br/public:avm/res/web/site:0.14.0' = {
  name: 'siteDeployment'
  params: {
    kind: 'app'
    name: appServiceName
    serverFarmResourceId: appServicePlanResourceId
    location: location
    tags: {
      client: clientName
      Environment: environmentType
    }
  }
}
