###############################################################################
# Windows Features                                                            #
###############################################################################
Write-Host "Installing Windows Features..."

# .net Framework

$NET = @(
"NetFx3"
"NetFx4-AdvSrvs"
)

foreach ($feature in $NET) {
Write-Host "Installing $feature"
Enable-WindowsOptionalFeature -Online -All -FeatureName $NET
}

# RSAT
# wouldnt work via loop ??!?
Add-WindowsCapability -Online -Name "Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.DHCP.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.BitLocker.Recovery.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.CertificateServices.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.Dns.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.FailoverCluster.Management.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.FileServices.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.IPAM.Client.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.LLDP.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.NetworkController.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.NetworkLoadBalancing.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.RemoteAccess.Management.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.ServerManager.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.Shielded.VM.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.StorageMigrationService.Management.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.StorageReplica.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.SystemInsights.Management.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.VolumeActivation.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.WSUS.Tools~~~~0.0.1.0"
