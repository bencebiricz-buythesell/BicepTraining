param location string
param clientName string

param environmentType string

param publisherEmail string = 'test.com'
param publisherName string = 'BuyTheSell'
param sku string = 'Developer'

var apiManagementName = '${environmentType}-${clientName}-buythesell-${location}'

param hostnameConfigurations array

module service 'br/public:avm/res/api-management/service:0.8.0' = {
  name: apiManagementName
  params: {
    // Required parameters
    name: apiManagementName
    publisherEmail: publisherEmail
    publisherName: publisherName
    // Non-required parameters
    location: location
    tags: {
      Environment: environmentType
      client: clientName
    }
    sku: sku
    hostnameConfigurations: hostnameConfigurations
  }
}
