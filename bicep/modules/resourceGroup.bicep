targetScope='subscription'

param location string
param rgName string
param tags object

resource rg 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: rgName
  tags: tags
  location:  location
}
