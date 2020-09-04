# Durable Functions Chain chainning patter

Little sample to write Durable Functions (PowerShell)

For use this sample do you need:

- PowerShell 7
- Azure Functions core tools >= 3
- Azure CLI

```powershell

$resourceGroupDef = @{
  Name = "demoFuncApp"
  Location = "westus"
}
$storageDef = @{
    Name = "stgfuncapp"
    Sku = "Standard_LRS"
    Kind = "Storage"
}
$funcAppServicePlan = @{
    Name = "funcAppPlan"
    sku = "FREE"
}
$funcAppDefinition = @{
    Name = "azFunctionPwsh"
    OS = "Windows"
    Version = "3"
    Runtime = "powershell" #always 
    RTimeVersion = "7.0"
}
az group create --name $resourceGroupDef.Name --location $resourcegroupDef.Location
az storage account create --name  $storageDef.Name --resource-group $resourceGroupDef.Name --location $resourcegroupDef.Location --kind $storageDef.kind --sku $storageDef.sku
az functionapp create --name $funcAppDefinition.Name `
                      --resource-group $resourceGroupDef.Name `
                      --storage-account $storageDef.Name `
                      --consumption-plan-location westus `
                      --os-type $funcAppDefinition.OS `
                      --runtime $funcAppDefinition.Runtime `
                      --runtime-version $funcAppDefinition.RTimeVersion`
                      --functions-version $funcAppDefinition.Version
```

If you use this sample in Azure, you can create identity for your function app interact with resources above your subscription then you can use follow commands:
