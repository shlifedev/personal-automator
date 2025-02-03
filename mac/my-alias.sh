# 안드로이드 재시작
restart-adb() {
    adb kill-server && adb start-server && adb connect 172.30.1.99:5555
}
alias @restart-adb='restart-adb'
# scrcpy로 안드로이드 폰 접속
alias @connect-android='scrcpy -m 720 --no-audio --keyboard=uhid --max-fps=60 --video-codec=h265'