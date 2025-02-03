# Scoop 설치 (이미 설치된 경우 건너뛰기)
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    # 관리자 권한으로 Scoop 설치
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    Invoke-Expression "& {$(Invoke-RestMethod get.scoop.sh)} -RunAsAdmin"
}


# 필요한 Scoop 소스 추가 (소스가 없는 경우)
scoop bucket add nerd-fonts  # nerd-fonts 추가
scoop bucket add nonportable
scoop bucket add extras       # extras 추가
scoop bucket add main         # main 추가
scoop bucket add versions

# 프로그램 설치
scoop install 0ad
scoop install 0xProto-NF-Mono
scoop install 7zip
scoop install adb
scoop install bandizip
scoop install bitwarden
scoop install blender
scoop install cacert
scoop install curl
scoop install dark
scoop install discord
scoop install dotnet-sdk
scoop install ffmpeg
scoop install gimp
scoop install git
scoop install github
scoop install goodbyedpi
scoop install googlechrome
scoop install innounp
scoop install jetbrains-toolbox
scoop install krita
scoop install nodejs
scoop install notion
scoop install obs-studio
scoop install openssh
scoop install postman
scoop install putty
scoop install python
scoop install qbittorrent
scoop install rclone
scoop install scrcpy
scoop install vscode
scoop install wget
scoop install windows-terminal
scoop install yt-dlp
scoop install extras/kakaotalk
scoop install games/steam-achievement-manager
scoop install versions/steam
scoop install nonportable/unity-hub-np
scoop install extras/firefox