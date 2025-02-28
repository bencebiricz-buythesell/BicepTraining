param clientName string
param environmentType string

param location string

var keyVautName = '${clientName}-${environmentType}-bts-${location}'

module vault 'br/public:avm/res/key-vault/vault:0.12.0' = {
  name: 'vaultDeployment'
  params: {
    // Required parameters
    name: keyVautName
    // Non-required parameters
    enablePurgeProtection: false
  }
}
