param clientName string
param environmentType string
param tags object

@allowed([
  'eastus'
  'eastus2'
  'westus'
  'westeurope'
  'northeurope'
])
param location string

@allowed([
  'Standard_LRS'
  'Standard_GRS'
  'Standard_RAGRS'
  'Standard_ZRS'
  'Premium_LRS'
])
param sku string

@allowed([
  'Storage'
  'StorageV2'
  'BlobStorage'
  'FileStorage'
  'BlockBlobStorage'
])
param kind string

@allowed([
  'Hot'
  'Cool'
  'Cold'
  'Premium'
])
param accessTier string

module storage './Modules/storage-account.bicep' = {
  name: 'storageDeployment'
  params: {
    clientName: clientName
    environmentType: environmentType
    tags: tags
    location: location
    sku: sku
    kind: kind
    accessTier: accessTier
  }
}
