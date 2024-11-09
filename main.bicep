param location string = resourceGroup().location

param workbookName string = 'AzMapping'
param workbookDescription string = 'This workbook provides a mapping of Logic and Physical Availability zones on Azure subscriptions. '
param tags object = {
  'hidden-title': workbookName
}

var workbookVersion = '1.0'
var workbookJSON = string(loadJsonContent('./workbook.json'))

resource workbook 'Microsoft.Insights/workbooks@2023-06-01' = {
  name: guid(resourceGroup().id, 'Microsoft.Insights/workbooks', workbookName)
  location: location
  tags: tags
  kind: 'shared'
  properties: {
    displayName: workbookName
    description: workbookDescription
    category: 'Custom'
    serializedData: workbookJSON
    sourceId: 'Azure Monitor'
    version: workbookVersion
  }
} 
