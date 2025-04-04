param clientName string
param environmentType string
param environmentConfigurationMap object
 
var regions = environmentConfigurationMap[environmentType].Regions

module storageAccounts 'br/public:avm/res/storage/storage-account:0.18.0' = [
  for region in regions: {
    name: toLower('${clientName}${environmentType}buythesell${region.abbreviation}')
    params: {
      // Required parameters
      name: toLower('${clientName}${environmentType}buythesell${region.abbreviation}')
      // Non-required parameters
      allowBlobPublicAccess: false
      location: region.name
      skuName: environmentConfigurationMap[environmentType].Sku
      accessTier: environmentConfigurationMap[environmentType].AccessTier
      kind: environmentConfigurationMap[environmentType].Kind
      tags: environmentConfigurationMap[environmentType].Tags
    }
  }
]
