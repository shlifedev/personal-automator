Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

$eccoff = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/shlifedev/personal-automator/refs/heads/main/windows/fuck-eco-mode.ps1" -UseBasicParsing
$wifi_autoconnect = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/shlifedev/personal-automator/refs/heads/main/windows/wifi-autoconntect-fix.ps1" -UseBasicParsing


Invoke-Expression $eccoff.Content
Invoke-Expression $wifi_autoconnect.Content
#Invoke-Expression $scooping.Content
