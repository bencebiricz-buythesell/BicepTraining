param clientName string
param environmentType string
param location string

var databaseAccountName = '${clientName}-${environmentType}-buythesell-${location}'

module databaseAccount 'br/public:avm/res/document-db/database-account:0.11.0' = {
  name: 'databaseAccountDeployment'
  params: {
    // Required parameters
    name: databaseAccountName
    // Non-required parameters
    location: location
  }
}
