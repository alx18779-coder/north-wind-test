# Roadmap — Northwind SQL Trainer (App)

本文档汇总后续高优先级改进项，按阶段（P0/P1/P2）划分，含目标、范围、验收标准与风险缓释。供后续开发排期与跟踪使用。

## P0 稳定性/正确性（优先完成）

- 初始化稳健性（MySQL/PG）
  - 目标：一键初始化在 MySQL/PG 都稳定成功；错误可读，日志不拖慢 UI。
  - 范围：
    - MySQL：继续完善从 PG → MySQL 的 DDL 兼容（默认值、索引命名冲突、保留字转义、大小写/排序差异）。
    - init 执行：后端分句执行已就绪；补充“失败回滚/断点续跑”（分阶段事务）。
    - 日志：后端对 job.log 加长度上限（例如 128KB），附“已截断”标记；前端已做折叠展示。
  - 验收：
    - 在 MySQL 8.x 与 PG 15+ 上初始化全量通过；单条失败时能定位到具体语句；长日志不影响页面。
  - 风险：语法覆盖不全 → 在 DDL 层做静态扫描并维护“已知兼容表”。

- 导入前置校验（已完成最小版）
  - 目标：导入前发现问题，减少失败回滚。
  - 范围：已支持 difficulty/status/instance_tags/reference_sql 覆盖校验；
    - 待补：question_id 重复检测（库内唯一）、SQL 只读静态检查（简单关键字黑名单）。
  - 验收：
    - 校验未通过不给导入；逐行错误提示清晰；通过后导入成功率显著提升。

## P1 体验提升

- 工作台增强
  - 快捷键：Ctrl/Cmd+Enter 执行、Ctrl/Cmd+Shift+F 美化、Alt+W 自动换行。
  - 结果导出：CSV/JSON 导出当前结果；保留列顺序与截断标记。
  - 题目级记忆：为每题记忆实例选择与折叠状态（localStorage 按题目 id）。

- 导入体验
  - 预览：在“校验并预览”视图中渲染结构化预览表（标题/难度/标签/参考引擎），支持下载错误清单。
  - 校验项扩展：枚举大小写宽容、空白修剪、提示式修复建议（例如自动补 engine）。

- 文档与可视化
  - ER 页面：支持缩放（wheel/触控缩放）与触摸拖动；提供下载原图按钮。
  - DDL 页面：增加 MySQL DDL 下载按钮（已支持 PG；MySQL 文件为 `infrastructure/sql/northwind_mysql.sql`）。

## P2 工程化与运维

- 测试与 CI/CD
  - 后端：集成测试覆盖 导入/初始化/执行限流/只读校验；
  - 前端：关键组件测试（PracticeWorkspace/QuestionImport/InstanceDetail）。
  - CI：GitHub Actions 跑 `uv sync && pytest` + `pnpm i && pnpm build`；工件缓存。

- 部署与配置
  - docker-compose：一键起 PG/MySQL/后端/前端；env 模板完善；
  - 配置基线：uv.lock 纳入仓库（已完成），生产/预发 `ALLOWED_CORS_ORIGINS`、密钥与实例示例。

---

## 执行与拆解建议

- Issue/PR 规范：每项创建独立 Issue，PR 附“目的/范围/测试步骤/回滚策略”。
- 里程碑（建议）：
  1) P0-Init 扫尾 + 导入校验补强
  2) P1-工作台增强（快捷键/导出/记忆）
  3) P1-导入预览与修复建议
  4) P2-测试与 CI/CD + docker-compose

## 变更记录

- 2025-11-05：首次落地（PR-1/PR-2 对应内容已合入），补充后续路线。

