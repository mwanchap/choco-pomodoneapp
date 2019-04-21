$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://app.pomodoneapp.com/installers/PomoDoneApp%20Setup%201.5.1534.exe'
$checksum   = '5C5CC6A6A1D198E6B19C9608DEBACC2F9DC998E92CDEF2104BC893A5EC07A5A6'

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
