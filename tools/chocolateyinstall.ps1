$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://theroundpie.com/assets/RoundPie-Setup-1.5.1545.exe'
$checksum   = '6390503F32BBC6868DA9D0A2DB49F1B34568833F2B0C460D8814DBAFA261B03B'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  silentArgs   = '-s'           # Squirrel
  checksum      = $checksum
  checksumType  = 'sha256'
  softwareName  = $env:ChocolateyPackageName
}

Install-ChocolateyPackage @packageArgs
