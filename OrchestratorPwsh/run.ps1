using namespace System.Net

param($Context)
$Context
$output = @()
$newResource = Invoke-ActivityFunction -FunctionName 'NewAzResourceGroup' -Input 'helloworld'
$output += $newResource

$newStgAcc = Invoke-ActivityFunction -FunctionName 'NewStgAccount' -Input $($newResource | ConvertTo-Json -Depth 5)
$output += $newStgAcc 

$newBlob = Invoke-ActivityFunction -FunctionName 'NewBlob' -Input $($newStgAcc | ConvertTo-Json -Depth 12)
$output += $newBlob
$output