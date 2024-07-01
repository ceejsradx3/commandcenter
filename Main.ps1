###############################################################################
# Configure Windows Device                                                    #
###############################################################################

### Are you even the admin
function check_rights {
    If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
    {
        Write-Warning "Stopping wasting time: you ain't the admin. Try that again."
        Break
    }
}

check_rights

Write-Host "Preparing to configure your Windows machine.."

Write-Host "Installing desired applications..."
. .\Install-Programs.ps1

Write-Host "Configuring Windows settings and preferences..."
. .\Configure-WindowsSettings.ps1

Write-Host "Removing bloatware..."
. .\Remove-Bloat.ps1

Write-Host "Installing Windows features..."
. .\Install-WindowsFeatures.ps1

#Write-Host "Configuring your terminal..."
#. .\Configure-PowerShell.ps1

#Write-Host "Creating symlinks to important directories and files..."
#. .\Create-Sysmlinks.ps1
