param clientName string
param environmentType string
param tags object
param location string
param sku string
param kind string
param accessTier string

var name = toLower('${clientName}${environmentType}buythesell${location}')

module storageAccount 'br/public:avm/res/storage/storage-account:0.19.0' = {
  name: 'storageAccountDeployment'
  params: {
    // Required parameters
    name: name
    // Non-required parameters
    tags: tags
    allowBlobPublicAccess: false
    location: location
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Deny'
    }
    accessTier: accessTier
    skuName: sku
    kind: kind
  }
}
