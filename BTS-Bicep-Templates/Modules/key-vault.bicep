param defaultName string

module vault 'br/public:avm/res/key-vault/vault:0.12.1' = {
  name: 'vaultDeployment'
  params: {
    // Required parameters
    name: defaultName
    // Non-required parameters
    enablePurgeProtection: false
    sku: 'standard'
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
    secrets: [
      
    ]
  }
}
