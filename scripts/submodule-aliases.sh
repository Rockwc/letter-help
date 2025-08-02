#!/bin/bash

# 子模块管理别名配置
# 使用方法: source scripts/submodule-aliases.sh

# 获取脚本目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MANAGER_SCRIPT="$SCRIPT_DIR/submodule-manager.sh"

# 检查脚本是否存在
if [[ ! -f "$MANAGER_SCRIPT" ]]; then
    echo "错误: 找不到子模块管理脚本"
    return 1
fi

# 设置执行权限
chmod +x "$MANAGER_SCRIPT"

# 定义别名
alias sm-init="$MANAGER_SCRIPT init"
alias sm-update="$MANAGER_SCRIPT update"
alias sm-status="$MANAGER_SCRIPT status"
alias sm-pull="$MANAGER_SCRIPT pull"
alias sm-push="$MANAGER_SCRIPT push"
alias sm-commit="$MANAGER_SCRIPT commit"
alias sm-add="$MANAGER_SCRIPT add"
alias sm-log="$MANAGER_SCRIPT log"
alias sm-branch="$MANAGER_SCRIPT branch"
alias sm-clean="$MANAGER_SCRIPT clean"
alias sm-help="$MANAGER_SCRIPT help"

# 特定子模块的别名
alias sm-admin-pc="$MANAGER_SCRIPT"

# 显示别名信息
echo "子模块管理别名已加载:"
echo "  sm-init     - 初始化所有子模块"
echo "  sm-update   - 更新所有子模块"
echo "  sm-status   - 查看子模块状态"
echo "  sm-pull     - 拉取子模块代码"
echo "  sm-push     - 推送子模块代码"
echo "  sm-commit   - 提交子模块更改"
echo "  sm-add      - 添加文件到子模块"
echo "  sm-log      - 查看子模块日志"
echo "  sm-branch   - 查看子模块分支"
echo "  sm-clean    - 清理子模块"
echo "  sm-help     - 显示帮助信息"
echo ""
echo "使用示例:"
echo "  sm-status                    # 查看所有子模块状态"
echo "  sm-update admin-pc           # 更新admin-pc子模块"
echo "  sm-commit admin-pc '更新功能' # 提交admin-pc的更改" 