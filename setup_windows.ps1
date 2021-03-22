# Install WSL and restart (if necessary)
if (-Not (Get-Command wsl -ErrorAction SilentlyContinue))
{
  #dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
  #dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
  Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart
  Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart

  Restart-Computer
}

# Install Ubuntu
Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile Ubuntu2004.appx -UseBasicParsing
Add-AppxPackage .\Ubuntu2004.appx

# Start WinRM Service
#Set-Service -Name "WinRM" -StartupType Automatic
#Start-Service -Name "WinRM" -ErrorAction Stop

# Enable Remoting (optinal: -SkipNetworkProfileCheck for public zones)
Enable-PSRemoting -Force -ErrorAction Stop

#winrm set winrm/config/service @{AllowUnencrypted="false"}
#winrm set winrm/config/service/auth @{Basic="false"}
#winrm set winrm/config/service/auth @{Kerberos="true"}
