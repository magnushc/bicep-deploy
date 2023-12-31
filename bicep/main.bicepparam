using './main.bicep'
param resourceBaseName = readEnvironmentVariable('RGNAME', 'ddc-default')

param location = 'norwayeast'

param tags = {
  PROJECT: 'demo-test'
  OFFICE: 'Oslo'
}

param cosmosDBPostName = 'cdb'

param cdbLocations = [
  {
    locationName: location
    isZoneRedundant: false
    failoverPriority: 0
  }
]
