targetScope = 'subscription'

param resourceBaseName string = 'hmm'

param location string = 'norwayeast'

param tags object = {
  PROJECT: 'demo-test'
  OFFICE: 'Oslo'
}


var resourceGroupName = '${resourceBaseName}-rg'

module resourceGroup 'modules/resourceGroup.bicep' = {
  name : 'rg'
  params: {
    location: location
    rgName: resourceGroupName
    tags: tags
  }
}
