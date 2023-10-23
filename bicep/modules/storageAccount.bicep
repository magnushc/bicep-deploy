metadata name = 'Storage V2 Account'
metadata description = 'This module deploys a Storage Account.'

@description('Required. Name of the Database Account.')
param name string

@description('Optional. Tags of the Database Account resource.')
param tags object = {}

@description('The Stock Keeping Unit')
param sku object = {
  name: 'Standard_LRS'
}

@description('The Azure region into which the resources should be deployed.')
param location string


resource storageV2Account 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: name
  location: location
  tags: tags
  sku: sku
  kind:'StorageV2'
}
