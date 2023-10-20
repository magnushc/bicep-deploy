using './main.bicep'

param resourceBaseName = readEnvironmentVariable('RGNAME', 'ddc-default')

param location = 'norwayeast'

param tags = {
  PROJECT: 'demo-test'
  OFFICE: 'Oslo'
}
