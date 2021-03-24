# Install WSL and restart (if necessary)
if (-Not (Get-Command wsl -ErrorAction SilentlyContinue))
{
  Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart
  Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart

  Restart-Computer
}

# Install Ubuntu
Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile Ubuntu2004.appx -UseBasicParsing
Add-AppxPackage .\Ubuntu2004.appx
Remove-Item .\Ubuntu2004.appx

# Enable Remoting (optinal: -SkipNetworkProfileCheck for public zones)
Enable-PSRemoting -Force -ErrorAction Stop
