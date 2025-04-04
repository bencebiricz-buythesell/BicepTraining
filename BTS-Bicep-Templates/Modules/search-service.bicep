param defaultLocation string
param defaultName string

module searchService 'br/public:avm/res/search/search-service:0.9.2' = {
  name: 'searchServiceDeployment'
  params: {
    // Required parameters
    name: defaultName
    // Non-required parameters
    location: defaultLocation
    sku: 'basic'
    replicaCount: 1
  }
}
