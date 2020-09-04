using namespace System.Net

param($Request, $TriggerMetadata)
$FunctionName = $Request.Params.FunctionName
Write-Host $Request 
if ($Request.Body) {
    Write-Host $Request.Body
    $bodyReq = $Request.Body | ConvertFrom-Json
    Write-Host $bodyReq.name
    $InstanceId = Start-NewOrchestration -FunctionName $FunctionName -input $bodyReq.name
    Write-Host "Started orchestration with ID = '$InstanceId'"
    $Response = New-OrchestrationCheckStatusResponse -Request $Request -InstanceId $InstanceId
    $status =  [HttpStatusCode]::OK
    $body = $Response
}
else {
    $status = [HttpStatusCode]::BadRequest
    $body = "Error Msg"
}
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = $status
    Body =$body
})