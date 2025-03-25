using 'main.bicep'

param clientName = 'default'
param environmentType = 'dev'
param location = 'eastus'
param sku = 'Standard_LRS'
param kind = 'StorageV2'
param accessTier = 'Hot'
param tags = {
  Environment: environmentType
  Client: clientName
}
