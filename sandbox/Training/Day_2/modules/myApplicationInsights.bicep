param clientName string
param environmentType string
param location string

var componentName = '${clientName}-${environmentType}-buythesell-${location}'

module component 'br/public:avm/res/insights/component:0.6.0' = {
  name: 'componentDeployment'
  params: {
    // Required parameters
    name: componentName
    workspaceResourceId: '<workspaceResourceId>'
    // Non-required parameters
    location: location
  }
}
