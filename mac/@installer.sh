#!/bin/bash

URLS=(
    "https://raw.githubusercontent.com/shlifedev/personal-automator/refs/heads/main/mac/my-alias.sh"
) 
for url in "${URLS[@]}"; do
    echo "다운로드: ${url}"
    TEMP_FILE=$(mktemp)
    
    if curl -L -s -o "${TEMP_FILE}" "${url}"; then
        echo "실행~~: ${TEMP_FILE}"
        source "${TEMP_FILE}"
    else
        echo "오류: ${url} 다운로드 실패."
    fi
    
    rm "${TEMP_FILE}"
done

echo "설치가 완료되었습니다."