Write-Host "Preparing to configure your Windows machine.."

Write-Host "Installing desired applications..."
. .\apps.ps1

Write-Host "Setting Windows settings and preferences..."
. .\windows.ps1

Write-Host "Removing bloatware..."
. .\win10debloat.ps1

Write-Host "Configuring features..."

#Write-Host "Configuring your terminal..."
#. .\ps.ps1

#Write-Host "Creating symlinks to important directories and files..."
#. .\symlinks.ps1
