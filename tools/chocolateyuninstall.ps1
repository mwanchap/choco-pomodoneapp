$ErrorActionPreference = 'Stop'; # stop on all errors
$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    softwareName  = $env:ChocolateyPackageName  #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
    fileType      = 'EXE' #only one of these: MSI or EXE (ignore MSU for now)
    validExitCodes= @(0)
    silentArgs   = '--uninstall -s'           # Squirrel
}

[array]$key = Get-UninstallRegistryKey -SoftwareName $packageArgs['softwareName']

if ($key.Count -eq 1)
{
    Write-Verbose "Matched 1 uninstall key, with install location: $($key.InstallLocation)"
    $packageArgs['file'] = "$($key.InstallLocation)\Update.exe"
    Uninstall-ChocolateyPackage @packageArgs
}
elseif ($key.Count -eq 0)
{
    Write-Warning "$packageName has already been uninstalled by other means."
}
elseif ($key.Count -gt 1)
{
    Write-Warning "$($key.Count) matches found!"
    Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
    Write-Warning "Please alert package maintainer the following keys were matched:"
    $key | % { Write-Warning "- $($_.DisplayName)" }
}
