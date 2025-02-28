param clientName string
param location string
param environmentType string
param appServicePlanResourceId string

var functionAppName = '${clientName}-${environmentType}-function-${location}'

module site 'br/public:avm/res/web/site:0.14.0' = {
  name: functionAppName
  params: {
    // Required parameters
    kind: 'functionapp'
    name: functionAppName
    serverFarmResourceId: appServicePlanResourceId
  }
}
