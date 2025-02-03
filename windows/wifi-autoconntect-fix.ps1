    if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltinRole] "Administrator")) {
        Write-Warning "이 함수는 관리자 권한으로 실행되어야 합니다. PowerShell을 관리자 권한으로 다시 실행하세요."
        return
    } 
    $registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy" 
    if (-not (Test-Path -Path $registryPath)) {
        try {
            New-Item -Path $registryPath -Force | Out-Null
            Write-Output "레지스트리 경로가 생성되었습니다: $registryPath"
        } catch {
            Write-Error "레지스트리 경로를 생성하는 중 오류가 발생했습니다: $_"
            return
        }
    } else {
        Write-Output "레지스트리 경로가 이미 존재합니다: $registryPath"
    }
 
    try {
        Set-ItemProperty -Path $registryPath -Name "fMinimizeConnections" -Value 0 -Type DWord
        Write-Output "`fMinimizeConnections` 값이 `0`으로 설정되었습니다."
    } catch {
        Write-Error "`fMinimizeConnections` 값을 설정하는 중 오류가 발생했습니다: $_"
        return
    }
    try {
        $value = Get-ItemProperty -Path $registryPath -Name "fMinimizeConnections"
        Write-Output "현재 `fMinimizeConnections` 값: $($value.fMinimizeConnections)"
    } catch {
        Write-Error "`fMinimizeConnections` 값을 확인하는 중 오류가 발생했습니다: $_"
    }