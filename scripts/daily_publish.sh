#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_DIR"

DATE_CN="$(TZ=Asia/Shanghai date +%F)"
FILE="notes/${DATE_CN}.md"

if [ ! -f "$FILE" ]; then
  cat > "$FILE" <<MD
# AI Research Daily - ${DATE_CN}

## 今日重点
- 

## 关键信息
- 

## 参考链接
- 

## 待办
- [ ] 
MD
fi

./scripts/publish.sh "$FILE"

echo "https://github.com/gtengliu/AI-Research-Daily/blob/main/${FILE}"
