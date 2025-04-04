param clientName string
param environmentType string
param defaultLocation string
 
var workspaceName = toLower('${clientName}-${environmentType}')

module workspace 'br/public:avm/res/operational-insights/workspace:0.11.1' = {
  name: '${workspaceName}-LAWS'
  params: {
    // Required parameters
    name: '${workspaceName}-LAWS'
    // Non-required parameters
    location: defaultLocation
  }
}
