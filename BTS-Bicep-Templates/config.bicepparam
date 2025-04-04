using 'main.bicep'

param clientName = 'test'
param environmentType = 'Prod'
param defaultLocation = 'eastus'

param hasLogAnalyticsWorkspace = true

param environmentConfigurationMap = {
  Prod: {
    Regions: [
      {
        name: 'eastus'
        abbreviation: null
      }
      {
        name: 'northeurope'
        abbreviation: 'na'
      }
      {
        name: 'southeastasia'
        abbreviation: 'sa'
      }
    ]
    Sku: 'Standard_LRS'
    Kind: 'StorageV2'
    AccessTier: 'Hot'
    Tags: {
      Environment: environmentType
      Client: clientName
    }
  }
  Dev: {
    Regions: [
      {
        name: 'eastus'
        abbreviation: null
      }
    ]
    Sku: 'Standard_LRS'
    Kind: 'StorageV2'
    AccessTier: 'Hot'
    Tags: {
      Environment: environmentType
      Client: clientName
    }
  }
  Uat: {
    Regions: [
      {
        name: 'eastus'
        abbreviation: null
      }
    ]
    Sku: 'Standard_LRS'
    Kind: 'StorageV2'
    AccessTier: 'Hot'
    Tags: {
      Environment: environmentType
      Client: clientName
    }
  }
}
