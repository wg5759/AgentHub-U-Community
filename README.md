# AgentHub-U Community 🌐

> 精选 AI 工具目录 · 工作流模板 · SKILL 配置 — 免费使用，无需注册

[![Tools](https://img.shields.io/badge/Tools-83-blue)](tools.json)
[![Workflows](https://img.shields.io/badge/Workflows-24-orange)](workflows/index.json)
[![Languages](https://img.shields.io/badge/i18n-4_languages-green)](i18n/)
[![License](https://img.shields.io/badge/License-MIT-yellow)](LICENSE)

---

## 📦 这是什么？

这是 [AgentHub-U](https://agenthub-u.com) 的**社区开源资源库**。

AgentHub-U 是一个 AI 工具管理平台，支持一键安装 83+ 款 AI 工具。本仓库包含：

- **`tools.json`** — 完整的 AI 工具目录（名称、安装命令、启动方式、API Key 需求）
- **`workflows/`** — 高质量工作流模板（ComfyUI / n8n / Flowise / Dify）
- **`i18n/`** — 4 语种翻译文件（简体中文 / English / 日本語 / 한국어）

> 💡 **主平台地址**: [agenthub-u.com](https://agenthub-u.com) — 一键安装、统一 API Key、AI 客服支持

---

## 🛠️ 工具目录 (tools.json)

```json
{
  "agents": {
    "OpenCode": {
      "name": "OpenCode",
      "category_key": "coding",
      "install_cmd": ["npm", "install", "-g", "opencode-ai"],
      "launch_cmd": "opencode",
      "requires_api_key": false
    }
  }
}
```

**覆盖 83 款工具**，分类包括：

| 分类 | 工具数 | 示例 |
|------|--------|------|
| 编程助手 | 15+ | OpenCode, Claude Code, Cursor, Aider |
| 对话平台 | 12+ | ChatGPT, DeepSeek Chat, Qwen Chat |
| 框架库 | 10+ | LangChain, LlamaIndex, CrewAI |
| 绘画创意 | 8+ | ComfyUI, Stable Diffusion, Midjourney |
| 视频生成 | 6+ | Runway, Pika, Sora |
| 语音音频 | 5+ | Whisper, ElevenLabs, Suno |
| 国产 AI | 10+ | 通义千问, 文心一言, 智谱清言, DeepSeek |
| 自动化 | 8+ | n8n, Flowise, Dify |

---

## 🔄 工作流模板 (workflows/)

**24 个精选工作流**，覆盖 4 个平台：

| 平台 | 数量 | 用途 |
|------|------|------|
| **ComfyUI** | 5 | SDXL 人像、电商打光、4K 放大、ControlNet 姿态、背景移除 |
| **n8n** | 3 | 微信机器人、日报自动化、智能客服 |
| **Flowise** | 2 | SQL Agent、文档问答 |
| **Dify** | 3 | 多 Agent 协作、RAG 聊天、翻译流水线 |

每个工作流包含：
- ✅ 4 语种名称和描述
- ✅ 来源作者和 Stars 数
- ✅ 导入指南
- ✅ 标签分类

---

## 🌍 国际化 (i18n/)

4 种语言完整翻译，381 个翻译键：

- `zh-CN.json` — 简体中文
- `en.json` — English
- `ja.json` — 日本語
- `ko.json` — 한국어

---

## 🤝 贡献指南

欢迎提交 PR 贡献：

1. **添加新工具**: 按 `tools.json` 格式提交
2. **分享工作流**: 放入对应平台目录，更新 `workflows/index.json`
3. **完善翻译**: 修正或补充 i18n 文件
4. **报告问题**: 提交 Issue

### 工具条目规范

```json
"ToolName": {
  "name": "ToolName",
  "category_key": "coding|chat|framework|data|drawing|video|audio|deploy|regional|security|automation",
  "requires": ["node", "python"],
  "install_cmd": ["npm", "install", "-g", "package-name"],
  "launch_cmd": "command",
  "check_type": "binary",
  "check_name": "binary-name",
  "price": 0,
  "is_free": true,
  "requires_api_key": false
}
```

---

## 📄 许可证

MIT License — 自由使用、修改、分发。

---

## 🔗 链接

- **主平台**: [agenthub-u.com](https://agenthub-u.com)
- **GitHub**: [github.com/wg5759/AgentHub-U-Community](https://github.com/wg5759/AgentHub-U-Community)
