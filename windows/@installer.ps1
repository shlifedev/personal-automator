# 실행할 원격 스크립트들의 Raw URL 목록
$scriptUrls = @(
    "https://raw.githubusercontent.com/shlifedev/personal-automator/main/windows/fuck-eco-mode.ps1",
    "https://raw.githubusercontent.com/shlifedev/personal-automator/main/wifi-autoconntect-fix.ps1",
    "https://raw.githubusercontent.com/shlifedev/personal-automator/main/install-choco-packages.ps1"
)

# 각 스크립트를 순회하며 다운로드 및 실행 전에 사용자에게 확인
foreach ($url in $scriptUrls) {
    Write-Host "[$(Get-Date -Format 'HH:mm:ss')] 다운로드 및 실행할 스크립트 URL: $url"
    
    # 실행 여부 확인
    $confirm = Read-Host "이 스크립트를 실행하시겠습니까? (y/n)"
    
    if ($confirm -eq "y" -or $confirm -eq "Y") {
        try {
            # 스크립트 내용 다운로드
            $scriptContent = (New-Object System.Net.WebClient).DownloadString($url)
            
            # 스크립트 실행 (필요시 관리자 권한 또는 실행 정책 확인)
            Invoke-Expression $scriptContent
            
            Write-Host "[$(Get-Date -Format 'HH:mm:ss')] 스크립트 실행 완료: $url"
        }
        catch {
            Write-Error "[$(Get-Date -Format 'HH:mm:ss')] 스크립트 실행 중 오류 발생: $url - $_"
        }
    }
    else {
        Write-Host "[$(Get-Date -Format 'HH:mm:ss')] 실행 건너뛰기: $url"
    }
    
    Write-Host "-----------------------------------"
}