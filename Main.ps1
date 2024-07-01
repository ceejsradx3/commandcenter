###############################################################################
# Configure Windows Device                                                    #
###############################################################################

Write-Host "Preparing to configure your Windows machine.."

Write-Host "Installing desired applications..."
. .\Install-Programs.ps1

Write-Host "Setting Windows settings and preferences..."
. .\Configure-WindowsSettings.ps1

Write-Host "Removing bloatware..."
. .\Remove-Bloat.ps1

Write-Host "Configuring features..."
. .\Install-WindowsFeatures.ps1

#Write-Host "Configuring your terminal..."
#. .\Configure-PowerShell.ps1

#Write-Host "Creating symlinks to important directories and files..."
#. .\Create-Sysmlinks.ps1
