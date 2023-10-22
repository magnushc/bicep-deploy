metadata name = 'DocumentDB Database Accounts'
metadata description = 'This module deploys a DocumentDB Database Account.'

@description('Required. Name of the Database Account.')
param name string

@description('Optional. Tags of the Database Account resource.')
param tags object = {}

@description('Optional. The offer type for the Cosmos DB database account.')
@allowed([
  'Standard'
])
param databaseAccountOfferType string = 'Standard'

@description('The Azure region into which the resources should be deployed.')
param location string

@description('Required. Locations enabled for the Cosmos DB account.')
param locations array


@allowed([
  'Enabled'
  'Disabled'
  'SecuredByPerimeter'
])
param publicNetworkAccess string = 'Enabled'

var databaseAccount_locations = [for location in locations: {
  failoverPriority: location.failoverPriority
  isZoneRedundant: location.isZoneRedundant
  locationName: location.locationName
}]

var kind = 'GlobalDocumentDB'

resource databaseAccount 'Microsoft.DocumentDB/databaseAccounts@2023-09-15' = {
  name: name
  tags: tags
  kind: kind
  location: location
  properties: {
    databaseAccountOfferType: databaseAccountOfferType
    locations: databaseAccount_locations
    publicNetworkAccess: publicNetworkAccess
  }
}
