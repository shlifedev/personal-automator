$eccoff = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/shlifedev/personal-automator/refs/heads/main/windows/fuck-eco-mode.ps1" -UseBasicParsing
$wifi_autoconnect = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/shlifedev/personal-automator/refs/heads/main/windows/wifi-autoconntect-fix.ps1" -UseBasicParsing
$scooping = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/shlifedev/personal-automator/refs/heads/main/windows/scoop/scoop-installer.ps1" -UseBasicParsing 


Invoke-Expression $eccoff.Content
Invoke-Expression $wifi_autoconnect.Content
Invoke-Expression $scooping.Content