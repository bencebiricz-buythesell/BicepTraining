using './main.bicep'

param clientName = 'training'
param deploymentNumber = '3'
param location = 'westus2'
param environmentType = 'Dev'
param environmentConfigurationMap = {
  Prod: {
    Regions: [
      {
        name: 'EastUS'
        abbreviation: null
        skuName: 'Standard_GRS'
      }
      {
        name: 'northeurope'
        abbreviation: 'na'
        skuName: 'Standard_LRS'
      }
      {
        name: 'southeastasia'
        abbreviation: 'sa'
        skuName: 'Standard_LRS'
      }
    ]
  }
  Dev: {
    Regions: [
      {
        name: 'EastUS'
        abbreviation: null
        skuName: 'Standard_LRS'
      }
    ]
  }
  Uat: {
    Regions: [
      {
        name: 'EastUS'
        abbreviation: null
        skuName: 'Standard_LRS'
      }
    ]
  }
}

param publisherEmail = 'test.com'
param publisherName = 'BuyTheSell'
param sku = 'Developer'

param hostnameConfigurations = [
  {
    type: 'Proxy'
    hostName: '${environmentType}-${clientName}-buythesell-${location}.azure-api.net'
    negotiateClientCertificate: false
    defaultSslBinding: true
    certificateSource: 'BuiltIn'
  }
]

