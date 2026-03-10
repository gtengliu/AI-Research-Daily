#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "用法: $0 <文件或目录...>"
  exit 1
fi

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_DIR"

# 确保远程与分支存在
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "错误: 当前目录不是 git 仓库"
  exit 1
fi

for p in "$@"; do
  if [ ! -e "$p" ]; then
    echo "跳过不存在路径: $p"
    continue
  fi
  git add "$p"
done

if git diff --cached --quiet; then
  echo "没有可提交的变更"
  exit 0
fi

msg="update markdown: $(date '+%Y-%m-%d %H:%M:%S %Z')"
git commit -m "$msg"

# 兼容当前环境 SSH over 443
GIT_SSH_COMMAND='ssh -i ~/.ssh/openclaw_github_ai_research_daily -o IdentitiesOnly=yes -o StrictHostKeyChecking=accept-new -p 443 -o HostName=ssh.github.com' \
  git push origin HEAD:main

echo "发布完成"
