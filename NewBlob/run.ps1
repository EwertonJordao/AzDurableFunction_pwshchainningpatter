param($name)
$blobs = "blob1,blob2,blob3"
$key = Get-AzStorageAccountKey -ResourceGroupName $name.ResourceGroupName `
                               -Name $name.StorageAccountName `
                               | Where-Object{$_.KeyName -match "key1"}
$context =  (New-AzStorageContext -StorageAccountName $name.StorageAccountName -StorageAccountKey $key.Value)
[array]$container = @()
$blobs.Split(",") | ForEach-Object -process {
    [array]$container += New-AzStorageContainer -name $_ -Context $context -Permission blob
}
$container