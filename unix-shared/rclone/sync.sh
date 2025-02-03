#!/bin/bash

# sync.sh

# 함수: 로그 출력
write_log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

# 사용자로부터 소스 경로 입력 받기
read -p "소스 경로를 입력하세요 (절대 경로): " SOURCE_PATH

# 사용자로부터 대상 경로 입력 받기
read -p "대상 경로를 입력하세요 (절대 경로): " DESTINATION_PATH

# 작은따옴표 제거 (입력 시 포함될 수 있는 경우 대비)
SOURCE_PATH=${SOURCE_PATH//\'/}
DESTINATION_PATH=${DESTINATION_PATH//\'/}

# 입력된 경로 출력
write_log "소스 경로: $SOURCE_PATH"
write_log "대상 경로: $DESTINATION_PATH"

# 절대 경로 확인
if [[ "$SOURCE_PATH" != /* ]]; then
    write_log "에러: 소스 경로가 절대 경로가 아닙니다."
    exit 1
fi

if [[ "$DESTINATION_PATH" != /* ]]; then
    write_log "에러: 대상 경로가 절대 경로가 아닙니다."
    exit 1
fi

# rclone 동기화 실행
write_log "동기화를 시작합니다..."
rclone sync "$SOURCE_PATH" "$DESTINATION_PATH" \
    --delete-during \
    --size-only \
    -L \
    -P \
    --fast-list \
    --checkers=64 \
    --transfers=32 \
    --multi-thread-streams=8 \
    --multi-thread-cutoff=50M \
    --exclude '**/$*' \
    --exclude '**/System Volume Information/**' \
    --exclude '**/Recovery/**' \
    --exclude '**/ProgramData/**'

if [ "$?" -eq 0 ]; then
    write_log "동기화가 성공적으로 완료되었습니다."
else
    write_log "동기화 중 오류가 발생했습니다."
fi