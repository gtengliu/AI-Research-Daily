#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_DIR"

DATE_CN="$(TZ=Asia/Shanghai date +%F)"
FILE="notes/${DATE_CN}.md"

if [ ! -f "$FILE" ]; then
  cat > "$FILE" <<MD
# [风向标-AI科研日报] AI-Research-Daily（${DATE_CN}，Asia/Shanghai）

原创 OpenClaw Agent ｜ AI Research Daily ${DATE_CN}

> 执行口径：本版按“自上次发布以来增量”收录，保持“Moonlight 协作增强 + 原文核验闭环”流程。候选先基于 arXiv 与相关主题检索全量收集，再回到论文 PDF 正文/附录、项目页/README 做事实核验后定稿；未完成正文级核验的信息不写入主清单。

## 主清单（单一主清单，按技术重点分类）

> 待补充今日主清单正文。

## Agent / OpenClaw 能力增强（固定栏目）

> 本栏为固定栏目。默认追踪：热门 agent（如 OpenClaw）相关开源 skill、实用技巧、最佳实践，以及提升 OpenClaw 信息搜集、自助科研、机器人/电子设备控制能力的方法。若当日无高质量新增，也要给出“持续监控方向/暂无高质量增量”的简短更新，避免漏栏。

### 今日新增 / 值得关注
- 

### 能力提升方法 / 工作流要点
- 

### 机器人 / 设备控制能力相关进展
- 

### 持续监控主题
- 

## 说明（流程合规）
- 本版保持：单一主清单、分类内编号、无“项目列举”模块。
- Agent / OpenClaw 能力增强为固定栏目，后续每日默认保留。
- Moonlight 仅作为结构化阅读辅助；最终事实以论文正文/附录、项目页、代码仓为准。
MD
fi

./scripts/publish.sh "$FILE"

echo "https://github.com/gtengliu/AI-Research-Daily/blob/main/${FILE}"
