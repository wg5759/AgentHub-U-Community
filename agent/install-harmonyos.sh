#!/bin/bash
# AgentHub-U Agent Installer for HarmonyOS PC (鸿蒙PC版)
# HarmonyOS PC runs Linux kernel — this script uses standard bash + apt/brew

set -e

echo "============================================"
echo " AgentHub-U Agent — HarmonyOS PC Installer"
echo " 鸿蒙PC版安装脚本"
echo "============================================"
echo ""

# Detect HarmonyOS
IS_HARMONYOS=0
if [ -d "/system/ohos" ] || [ -d "/system/arkui" ]; then
    IS_HARMONYOS=1
elif uname -r | grep -qi "ohos\|harmony"; then
    IS_HARMONYOS=1
fi

if [ "$IS_HARMONYOS" -eq 1 ]; then
    echo "✓ 检测到 HarmonyOS 系统"
else
    echo "⚠ 未检测到 HarmonyOS 标记，将以 Linux 模式安装"
fi

# Check Python
PYTHON=""
for py in python3 python; do
    if command -v $py &>/dev/null; then
        PYTHON=$py
        break
    fi
done

if [ -z "$PYTHON" ]; then
    echo "安装 Python 3..."
    if command -v apt &>/dev/null; then
        sudo apt update && sudo apt install -y python3 python3-pip
    elif command -v brew &>/dev/null; then
        brew install python@3
    else
        echo "请手动安装 Python 3: https://www.python.org/downloads/"
        exit 1
    fi
    PYTHON=python3
fi

echo "✓ Python: $($PYTHON --version)"

# Setup agent directory
AGENT_DIR="$HOME/.agenthub-agent"
mkdir -p "$AGENT_DIR"

# Download agent.py (server URL, adjust as needed)
AGENT_URL="${AGENTHUB_SERVER:-https://agenthub-u.com}/agent/agent.py"
echo "下载 Agent..."
if command -v curl &>/dev/null; then
    curl -fsSL "$AGENT_URL" -o "$AGENT_DIR/agent.py"
elif command -v wget &>/dev/null; then
    wget -q "$AGENT_URL" -O "$AGENT_DIR/agent.py"
fi

# Install pip deps
echo "安装依赖..."
$PYTHON -m pip install --quiet httpx websockets

# Create systemd user service
SERVICE_DIR="$HOME/.config/systemd/user"
mkdir -p "$SERVICE_DIR"

cat > "$SERVICE_DIR/agenthub-agent.service" << 'EOF'
[Unit]
Description=AgentHub-U Local Agent
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
ExecStart=python3 %h/.agenthub-agent/agent.py
Restart=on-failure
RestartSec=10
Environment=AGENTHUB_SERVER=https://agenthub-u.com

[Install]
WantedBy=default.target
EOF

# Enable and start
systemctl --user daemon-reload
systemctl --user enable agenthub-agent
systemctl --user start agenthub-agent

echo ""
echo "============================================"
echo " ✅ AgentHub-U Agent 安装完成!"
echo ""
echo " 服务状态: systemctl --user status agenthub-agent"
echo " 日志: journalctl --user -u agenthub-agent -f"
echo ""
echo " 打开 https://agenthub-u.com 开始使用"
echo "============================================"
