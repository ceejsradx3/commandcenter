

# GUI Specs
Write-Host "Checking winget..."

# Check if winget is installed
if (Test-Path ~\AppData\Local\Microsoft\WindowsApps\winget.exe){
    Write-Host 'Winget Already Installed'
}
else{
	Write-Host "Winget not found, installing it now."
	Start-Process "ms-appinstaller:?source=https://aka.ms/getwinget"
	$nid = (Get-Process AppInstaller).Id
	Wait-Process -Id $nid
	Write-Host "Winget Installed"
}


winget install Google.Chrome
winget install Discord.Discord
winget install Adobe.AdobeAcrobatReaderDC
winget install Notepad++.Notepad++
winget install VideoLAN.VLC
winget install 7zip.7zip
winget install Microsoft.PowerToys
winget install GitHub.GitHubDesktop
winget install Balena.Etcher
winget install PuTTY.PuTTY
winget install WinSCP.WinSCP
winget install Microsoft.Teams
winget install GitHub.Atom
winget install Microsoft.WindowsTerminal
