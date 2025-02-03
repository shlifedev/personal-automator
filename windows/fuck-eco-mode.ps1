Write-Output "절전모드를 끄겠읍니다. 그래도 양심상 전기세이슈로 디스플레이는 10분뒤에는 끄는걸로"
powercfg /change monitor-timeout-ac 10
powercfg /change standby-timeout-ac 0
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
Write-Output "절전모드 끔, 디스플레이 시간 10분설정, 고성능모드 설정 완료"