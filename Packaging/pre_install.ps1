$uuid = [guid]::NewGuid().toString()

Write-Output $dom
Write-Output $usr
Write-Output [Environment]::GetFolderPath("Documents")

$docs_folder = [Environment]::GetFolderPath('Personal')
$identity_path = $docs_folder + "\Test.txt"
Write-Output $identity_path

if (-not(Test-Path -Path $identity_path -PathType Leaf))
{
    try
    {
        $null = New-Item -ItemType File -Path $identity_path -Force -ErrorAction Stop
        $uuid | Out-File -FilePath $identity_path -encoding utf8
        Write-Output $uuid
    }
    catch
    {
        throw $_.Exception.Message
    }
}
else
{
    $uuid = Get-Content $identity_path -First 1 | Out-String
    Write-Output $uuid
    Write-Output "File Exists"
}