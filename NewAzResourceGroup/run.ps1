param($name)
$guidID = (New-Guid).Guid
$createressource = ($("rg$name") + ($guidID.Substring(0, 8))).ToLower()
$location = "westus"
if((Get-AzResourceGroup).ResourceGroupName -notcontains $createressource ) {
    $grupoDeRecurso = New-AzResourceGroup -Name $createressource -Location $location -tag @{"env" = "criado com Durable Functions e PowerShell" }
}
$grupoDeRecurso