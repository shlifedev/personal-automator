$eccoff = Invoke-WebRequest -Uri "https://example.com/script.ps1" -UseBasicParsing
$wifi_autoconnect = Invoke-WebRequest -Uri "https://example.com/script.ps1" -UseBasicParsing
$scooping = Invoke-WebRequest -Uri "https://example.com/script.ps1" -UseBasicParsing 


Invoke-Expression $eccoff.Content
Invoke-Expression $wifi_autoconnect.Content
Invoke-Expression $scooping.Content