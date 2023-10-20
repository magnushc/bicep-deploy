targetScope = 'subscription'

@description('The base name of the resources to deploy.')
param resourceBaseName string

@description('The Azure region into which the resources should be deployed.')
param location string

@description('Tags to apply to all resources')
param tags object

var resourceGroupName = '${resourceBaseName}-rg'

module resourceGroup 'modules/resourceGroup.bicep' = {
  name : 'rg'
  params: {
    location: location
    rgName: resourceGroupName
    tags: tags
  }
}
