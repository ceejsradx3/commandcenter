

$apps = @(
    "Google.Chrome"
    "Microsoft.Office"
    "VideoLAN.VLC"
    "Discord.Discord"
    "Notepad++.Notepad++"
    "7zip.7zip"
    "Microsoft.PowerToys"
    "WinSCP.WinSCP"
    "Microsoft.WindowsTerminal"
    "Microsoft.VisualStudioCode"
    "Termius.Terminus"
    "GitHub.GitHubDesktop"
    "QMK.QMKToolbox"
    "Olivia.VIA"
    "WiresharkFoundation.Wireshark"
    "Zoom.Zoom"
    "Teamviewer.Teamviewer"
);

function install_winget {
    Clear-Host
    Write-Host -ForegroundColor Yellow "Checking if WinGet is installed"
    if (!$hasPackageManager) {
            if ($hasVCLibs.Version -lt "14.0.30035.0") {
                Write-Host -ForegroundColor Yellow "Installing VCLibs dependencies..."
                Add-AppxPackage -Path "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx"
                Write-Host -ForegroundColor Green "VCLibs dependencies successfully installed."
            }
            else {
                Write-Host -ForegroundColor Green "VCLibs is already installed. Skip..."
            }
            if ($hasXAML.Version -lt "7.2203.17001.0") {
                Write-Host -ForegroundColor Yellow "Installing XAML dependencies..."
                Add-AppxPackage -Path "https://github.com/Kugane/winget/raw/main/Microsoft.UI.Xaml.2.7_7.2203.17001.0_x64__8wekyb3d8bbwe.Appx"
                Write-Host -ForegroundColor Green "XAML dependencies successfully installed."
            }
            else {
                Write-Host -ForegroundColor Green "XAML is already installed. Skip..."
            }
            if ($hasAppInstaller.Version -lt "1.16.12653.0") {
                Write-Host -ForegroundColor Yellow "Installing WinGet..."
    	        $releases_url = "https://api.github.com/repos/microsoft/winget-cli/releases/latest"
    		    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls13
    		    $releases = Invoke-RestMethod -Uri "$($releases_url)"
    		    $latestRelease = $releases.assets | Where-Object { $_.browser_download_url.EndsWith("msixbundle") } | Select-Object -First 1
    		    Add-AppxPackage -Path $latestRelease.browser_download_url
                Write-Host -ForegroundColor Green "WinGet successfully installed."
            }
    }
    else {
        Write-Host -ForegroundColor Green "WinGet is already installed. Skipping..."
        Write-Host ""
        }
    Pause
}

function install_apps {
    Clear-Host
    Write-Host -ForegroundColor Cyan "Installing new Apps"
    Foreach ($app in $apps) {
        $listApp = winget list --exact --accept-source-agreements -q $app
        if (![String]::Join("", $listApp).Contains($app)) {
            Write-Host -ForegroundColor Yellow  "Install:" $app
            # MS Store apps
            if ((winget search --exact -q $app) -match "msstore") {
                winget install --exact --silent --accept-source-agreements --accept-package-agreements $app --source msstore
            }
            # All other Apps
            else {
                winget install --exact --silent --scope machine --accept-source-agreements --accept-package-agreements $app
            }
            if ($LASTEXITCODE -eq 0) {
                Write-Host -ForegroundColor Green "$app successfully installed."
            }
            else {
                $app + " couldn't be installed." | Add-Content $errorlog
                Write-Warning "$app couldn't be installed."
                Write-Host -ForegroundColor Yellow "Write in $errorlog"
                Pause
            }  
        }
        else {
            Write-Host -ForegroundColor Yellow "$app already installed. Skipping..."
        }
    }
    Pause
}


install_winget

install_apps