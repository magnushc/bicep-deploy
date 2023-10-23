targetScope = 'subscription'

@description('The base name of the resources to deploy.')
param resourceBaseName string


@description('The Azure region into which the resources should be deployed.')
param location string

@description('Tags to apply to all resources')
param tags object

@description('The post name of cosmosDB account following resourceBaseName.')
param cosmosDBPostName string

@description('Locations settings of cosmosDB account.')
param cdbLocations array

@allowed([
  'subscription'
  'resourcegroup'
])
param scope string = 'resourcegroup'

var resourceGroupName = '${resourceBaseName}-rg'

var cosmosDBName = '${resourceBaseName}-${cosmosDBPostName}'

module resourceGroup 'modules/resourceGroup.bicep' = if (scope == 'subscription') {
  name : 'rgDeploy'
  params: {
    location: location
    rgName: resourceGroupName
    tags: tags
  }
}

module cosmosDB 'modules/cosmosDB.bicep' = {
  name: 'cdbDeploy'
  scope: az.resourceGroup(resourceGroupName)
  dependsOn: [
    resourceGroup
  ]
  params: {
    name: cosmosDBName
    location: location
    locations: cdbLocations
    tags: tags
  }
}
