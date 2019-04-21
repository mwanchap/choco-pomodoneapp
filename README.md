Updating to new version:
 - Download installer
 - Update paths in tools\chocolateyinstall.ps1
 - Update version in pomodoneapp.nuspec
 - Update the checksums: `checksum .\installer-name.exe -t=sha256`
 - In the main package directory run `choco pack`
 - Test the package installs: `choco install pomodoneapp --source=. -y -v`
 - Test the package uninstalls: `choco uninstall pomodoneapp -y -v`
 - Push to the main repository: `choco push`
