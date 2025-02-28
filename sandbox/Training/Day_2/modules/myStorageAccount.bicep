param clientName string
param environmentType string = 'Dev'
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
      skuName: region.skuName
      tags: {
        client: clientName
        Environment: environmentType
      }
    }
  }
]

output storageAccountInfo array = [
  for i in range(0, length(regions)): {
    Id: storageAccounts[i].outputs.resourceId
    name: storageAccounts[i].outputs.name
    location: storageAccounts[i].outputs.location
  }
]
