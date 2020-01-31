if (-Not (Get-Command git -errorAction SilentlyContinue)) {
  ./Installer.ps1
  Write-Output "Warning: Git not found, installing it"
}

if (-Not (Get-Command hugo -errorAction SilentlyContinue)) {
  ./Installer.ps1
  Write-Output "Warning: Hugo not found, installing it"
}

$Url="http://127.0.0.1:1313/wiki/"

Start-Process $Url -PassThru

hugo server -D -v --disableFastRender -b $Url
