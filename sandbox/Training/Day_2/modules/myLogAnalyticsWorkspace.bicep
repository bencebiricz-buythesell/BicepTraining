param clientName string
param location string
param environmentType string

var workspaceName = '${clientName}-${environmentType}-LAWS'

module workspace 'br/public:avm/res/operational-insights/workspace:0.11.0' = {
  name: 'workspaceDeployment'
  params: {
    // Required parameters
    name: workspaceName
    // Non-required parameters
    location: location
  }
}
