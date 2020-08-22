param($name)
$guidID = (New-Guid).Guid
$akaStorage = ("storageaz" + ($guidID.Substring(0, 8))).ToLower()
$azsContext = New-AzStorageAccount -ResourceGroupName $name.ResourceGroupName `
    -Name $akaStorage `
    -Location $name.location `
    -SkuName Standard_LRS `
    -Kind Storage `
    -EnableHttpsTrafficOnly $true `
    -tag @{"env" = "criado com Durable Functions e PowerShell" }
$azsContext 