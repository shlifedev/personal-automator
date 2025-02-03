# sync.ps1
# 함수: 로그 출력
function Write-Log {
    param (
        [string]$Message
    )
    $timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    Write-Output "$timestamp - $Message"
}

# 사용자로부터 소스 경로 입력 받기
$SOURCE_PATH = Read-Host "소스 경로를 입력하세요 (절대 경로):"

# 사용자로부터 대상 경로 입력 받기
$DESTINATION_PATH = Read-Host "대상 경로를 입력하세요 (절대 경로):"

# 작은따옴표 제거
$SOURCE_PATH = $SOURCE_PATH -replace "'", ""
$DESTINATION_PATH = $DESTINATION_PATH -replace "'", ""

# 입력된 경로 출력
Write-Log "소스 경로: $SOURCE_PATH"
Write-Log "대상 경로: $DESTINATION_PATH"

# 절대 경로 확인
function Is-AbsolutePath {
    param (
        [string]$Path
    )
    return [System.IO.Path]::IsPathRooted($Path)
}

if (-not (Is-AbsolutePath $SOURCE_PATH)) {
    Write-Log "에러: 소스 경로가 절대 경로가 아닙니다."
    exit 1
}

if (-not (Is-AbsolutePath $DESTINATION_PATH)) {
    Write-Log "에러: 대상 경로가 절대 경로가 아닙니다."
    exit 1
}

# rclone 동기화 실행
Write-Log "동기화를 시작합니다..."
rclone sync "$SOURCE_PATH" "$DESTINATION_PATH" `
    --delete-during `
    --size-only `
    -L `
    -P `
    --fast-list `
    --checkers=64 `
    --transfers=32 `
    --multi-thread-streams=8 `
    --multi-thread-cutoff=50M `
    --exclude "**/\$*" `
    --exclude "**/System Volume Information/**" `
    --exclude "**/Recovery/**" `
    --exclude "**/ProgramData/**"

if ($LASTEXITCODE -eq 0) {
    Write-Log "동기화가 성공적으로 완료되었습니다."
} else {
    Write-Log "동기화 중 오류가 발생했습니다."
}