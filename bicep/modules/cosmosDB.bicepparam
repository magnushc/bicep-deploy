using './cosmosdb.bicep'

param name = 'cdb'
param tags = {}
param databaseAccountOfferType = 'Standard'
param location = 'norwayeast'
param locations = [
  {
    locationName: 'norwayeast'
    isZoneRedundant: false
    failoverPriority: 0
  }
]


