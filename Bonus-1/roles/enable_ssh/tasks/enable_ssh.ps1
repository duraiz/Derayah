# powershell script to enable SSH on remote machine



# Create folder location
New-Item -Path c:\ -Name temp -ItemType Directory
# Download openssh
(New-Object System.Net.WebClient).DownloadFile('https://github.com/PowerShell/Win32-OpenSSH/releases/download/v7.9.0.0p1-Beta/OpenSSH-Win64.zip','C:\temp\OpenSSH-Win64.zip')
# Unzip the files
Expand-Archive -Path "c:\temp\OpenSSH-Win64.Zip" -DestinationPath "C:\Program Files\OpenSSH"
# Install service
. "C:\Program Files\OpenSSH\OpenSSH-Win64\install-sshd.ps1"
# Set firewall permissions
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22

# Set service startup
Set-Service sshd -StartupType Automatic
Start-Service sshd

# Set Authentication to public key
((Get-Content -path C:\ProgramData\ssh\sshd_config -Raw) `
-replace '#PubkeyAuthentication yes','PubkeyAuthentication yes' `
-replace '#PasswordAuthentication yes','PasswordAuthentication no' `
-replace 'Match Group administrators','#Match Group administrators' `
-replace 'AuthorizedKeysFile __PROGRAMDATA__/ssh/administrators_authorized_keys','#AuthorizedKeysFile __PROGRAMDATA__/ssh/administrators_authorized_keys') | Set-Content -Path C:\ProgramData\ssh\sshd_config

# Restart after changes
Restart-Service sshd

# force file creation
New-item -Path $env:USERPROFILE -Name .ssh -ItemType Directory -force