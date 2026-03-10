# AI Research Daily

自动发布 Markdown 到 GitHub 的仓库。

## 用法

在仓库目录执行：

```bash
./scripts/publish.sh notes/2026-03-10.md
```

或一次发布整个 `notes/` 目录：

```bash
./scripts/publish.sh notes
```

脚本会自动：
1. `git add`
2. `git commit`
3. `git push`

## 建议结构

- `notes/`：每日或每次生成的 Markdown
- `summary/`：周报、月报、专题总结
