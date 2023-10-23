using './cosmosdb.bicep'
param name = '${resourceBaseName}-cdb'

param tags = {}
param databaseAccountOfferType = 'Standard'
param location = readEnvironmentVariable('R_LOCATION','norwayeast')
param locations = [
  {
    locationName: location
    isZoneRedundant: false
    failoverPriority: 0
  }
]

var resourceBaseName = readEnvironmentVariable('RGNAME', 'ddc-default')
