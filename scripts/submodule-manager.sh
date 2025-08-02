#!/bin/bash

# 子模块管理脚本
# 使用方法: ./scripts/submodule-manager.sh [命令] [子模块名]

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 脚本目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# 子模块配置 - 使用普通数组
SUBMODULE_NAMES=("admin-pc")
SUBMODULE_PATHS=("letter-admin-pc")

# 获取子模块路径
get_submodule_path() {
    local name="$1"
    for i in "${!SUBMODULE_NAMES[@]}"; do
        if [[ "${SUBMODULE_NAMES[$i]}" == "$name" ]]; then
            echo "${SUBMODULE_PATHS[$i]}"
            return 0
        fi
    done
    return 1
}

# 打印帮助信息
show_help() {
    echo -e "${BLUE}子模块管理工具${NC}"
    echo ""
    echo "使用方法: $0 [命令] [子模块名]"
    echo ""
    echo "命令:"
    echo "  init      - 初始化所有子模块"
    echo "  update    - 更新所有子模块"
    echo "  status    - 查看子模块状态"
    echo "  pull      - 拉取子模块最新代码"
    echo "  push      - 推送子模块代码"
    echo "  commit    - 提交子模块更改"
    echo "  add       - 添加新文件到子模块"
    echo "  log       - 查看子模块提交历史"
    echo "  branch    - 查看子模块分支信息"
    echo "  clean     - 清理子模块未跟踪文件"
    echo "  help      - 显示此帮助信息"
    echo ""
    echo "子模块名:"
    for i in "${!SUBMODULE_NAMES[@]}"; do
        echo "  ${SUBMODULE_NAMES[$i]} -> ${SUBMODULE_PATHS[$i]}"
    done
    echo ""
    echo "示例:"
    echo "  $0 init                    # 初始化所有子模块"
    echo "  $0 update admin-pc         # 更新admin-pc子模块"
    echo "  $0 status                  # 查看所有子模块状态"
}

# 检查是否在项目根目录
check_project_root() {
    if [[ ! -f "$PROJECT_ROOT/.gitmodules" ]]; then
        echo -e "${RED}错误: 请在项目根目录运行此脚本${NC}"
        exit 1
    fi
}

# 初始化子模块
init_submodules() {
    echo -e "${BLUE}初始化子模块...${NC}"
    cd "$PROJECT_ROOT"
    git submodule init
    git submodule update
    echo -e "${GREEN}子模块初始化完成${NC}"
}

# 更新子模块
update_submodules() {
    local submodule_name="$1"
    
    if [[ -n "$submodule_name" ]]; then
        # 更新特定子模块
        local path=$(get_submodule_path "$submodule_name")
        if [[ -n "$path" ]]; then
            echo -e "${BLUE}更新子模块: $submodule_name ($path)${NC}"
            cd "$PROJECT_ROOT/$path"
            git fetch origin
            git pull origin main
            echo -e "${GREEN}子模块 $submodule_name 更新完成${NC}"
        else
            echo -e "${RED}错误: 未知的子模块名 '$submodule_name'${NC}"
            exit 1
        fi
    else
        # 更新所有子模块
        echo -e "${BLUE}更新所有子模块...${NC}"
        cd "$PROJECT_ROOT"
        git submodule foreach git fetch origin
        git submodule foreach git pull origin main
        echo -e "${GREEN}所有子模块更新完成${NC}"
    fi
}

# 查看子模块状态
show_status() {
    echo -e "${BLUE}子模块状态:${NC}"
    cd "$PROJECT_ROOT"
    git submodule status
    echo ""
    echo -e "${BLUE}详细状态:${NC}"
    for i in "${!SUBMODULE_NAMES[@]}"; do
        local name="${SUBMODULE_NAMES[$i]}"
        local path="${SUBMODULE_PATHS[$i]}"
        if [[ -d "$path" ]]; then
            echo -e "${YELLOW}$name ($path):${NC}"
            cd "$PROJECT_ROOT/$path"
            git status --short
            cd "$PROJECT_ROOT"
        fi
    done
}

# 拉取子模块
pull_submodules() {
    local submodule_name="$1"
    
    if [[ -n "$submodule_name" ]]; then
        local path=$(get_submodule_path "$submodule_name")
        if [[ -n "$path" ]]; then
            echo -e "${BLUE}拉取子模块: $submodule_name${NC}"
            cd "$PROJECT_ROOT/$path"
            git pull origin main
        else
            echo -e "${RED}错误: 未知的子模块名 '$submodule_name'${NC}"
            exit 1
        fi
    else
        echo -e "${BLUE}拉取所有子模块...${NC}"
        cd "$PROJECT_ROOT"
        git submodule foreach git pull origin main
    fi
}

# 推送子模块
push_submodules() {
    local submodule_name="$1"
    
    if [[ -n "$submodule_name" ]]; then
        local path=$(get_submodule_path "$submodule_name")
        if [[ -n "$path" ]]; then
            echo -e "${BLUE}推送子模块: $submodule_name${NC}"
            cd "$PROJECT_ROOT/$path"
            git push origin main
        else
            echo -e "${RED}错误: 未知的子模块名 '$submodule_name'${NC}"
            exit 1
        fi
    else
        echo -e "${BLUE}推送所有子模块...${NC}"
        cd "$PROJECT_ROOT"
        git submodule foreach git push origin main
    fi
}

# 提交子模块更改
commit_submodules() {
    local submodule_name="$1"
    local message="$2"
    
    if [[ -z "$message" ]]; then
        message="更新子模块"
    fi
    
    if [[ -n "$submodule_name" ]]; then
        local path=$(get_submodule_path "$submodule_name")
        if [[ -n "$path" ]]; then
            echo -e "${BLUE}提交子模块: $submodule_name${NC}"
            cd "$PROJECT_ROOT/$path"
            git add .
            git commit -m "$message"
        else
            echo -e "${RED}错误: 未知的子模块名 '$submodule_name'${NC}"
            exit 1
        fi
    else
        echo -e "${BLUE}提交所有子模块更改...${NC}"
        cd "$PROJECT_ROOT"
        git submodule foreach 'git add . && git commit -m "自动提交更改" || true'
    fi
}

# 添加文件到子模块
add_to_submodule() {
    local submodule_name="$1"
    local files="$2"
    
    if [[ -z "$submodule_name" ]]; then
        echo -e "${RED}错误: 请指定子模块名${NC}"
        exit 1
    fi
    
    local path=$(get_submodule_path "$submodule_name")
    if [[ -n "$path" ]]; then
        echo -e "${BLUE}添加文件到子模块: $submodule_name${NC}"
        cd "$PROJECT_ROOT/$path"
        if [[ -n "$files" ]]; then
            git add "$files"
        else
            git add .
        fi
        echo -e "${GREEN}文件已添加到暂存区${NC}"
    else
        echo -e "${RED}错误: 未知的子模块名 '$submodule_name'${NC}"
        exit 1
    fi
}

# 查看子模块日志
show_log() {
    local submodule_name="$1"
    
    if [[ -n "$submodule_name" ]]; then
        local path=$(get_submodule_path "$submodule_name")
        if [[ -n "$path" ]]; then
            echo -e "${BLUE}子模块日志: $submodule_name${NC}"
            cd "$PROJECT_ROOT/$path"
            git log --oneline -10
        else
            echo -e "${RED}错误: 未知的子模块名 '$submodule_name'${NC}"
            exit 1
        fi
    else
        echo -e "${BLUE}所有子模块日志:${NC}"
        for i in "${!SUBMODULE_NAMES[@]}"; do
            local name="${SUBMODULE_NAMES[$i]}"
            local path="${SUBMODULE_PATHS[$i]}"
            if [[ -d "$path" ]]; then
                echo -e "${YELLOW}$name:${NC}"
                cd "$PROJECT_ROOT/$path"
                git log --oneline -5
                echo ""
                cd "$PROJECT_ROOT"
            fi
        done
    fi
}

# 查看子模块分支信息
show_branch() {
    local submodule_name="$1"
    
    if [[ -n "$submodule_name" ]]; then
        local path=$(get_submodule_path "$submodule_name")
        if [[ -n "$path" ]]; then
            echo -e "${BLUE}子模块分支: $submodule_name${NC}"
            cd "$PROJECT_ROOT/$path"
            git branch -a
        else
            echo -e "${RED}错误: 未知的子模块名 '$submodule_name'${NC}"
            exit 1
        fi
    else
        echo -e "${BLUE}所有子模块分支:${NC}"
        for i in "${!SUBMODULE_NAMES[@]}"; do
            local name="${SUBMODULE_NAMES[$i]}"
            local path="${SUBMODULE_PATHS[$i]}"
            if [[ -d "$path" ]]; then
                echo -e "${YELLOW}$name:${NC}"
                cd "$PROJECT_ROOT/$path"
                git branch -a
                echo ""
                cd "$PROJECT_ROOT"
            fi
        done
    fi
}

# 清理子模块
clean_submodules() {
    local submodule_name="$1"
    
    if [[ -n "$submodule_name" ]]; then
        local path=$(get_submodule_path "$submodule_name")
        if [[ -n "$path" ]]; then
            echo -e "${BLUE}清理子模块: $submodule_name${NC}"
            cd "$PROJECT_ROOT/$path"
            git clean -fd
            git reset --hard HEAD
        else
            echo -e "${RED}错误: 未知的子模块名 '$submodule_name'${NC}"
            exit 1
        fi
    else
        echo -e "${BLUE}清理所有子模块...${NC}"
        cd "$PROJECT_ROOT"
        git submodule foreach 'git clean -fd && git reset --hard HEAD'
    fi
}

# 主函数
main() {
    check_project_root
    
    local command="$1"
    local submodule_name="$2"
    local extra_args="$3"
    
    case "$command" in
        "init")
            init_submodules
            ;;
        "update")
            update_submodules "$submodule_name"
            ;;
        "status")
            show_status
            ;;
        "pull")
            pull_submodules "$submodule_name"
            ;;
        "push")
            push_submodules "$submodule_name"
            ;;
        "commit")
            commit_submodules "$submodule_name" "$extra_args"
            ;;
        "add")
            add_to_submodule "$submodule_name" "$extra_args"
            ;;
        "log")
            show_log "$submodule_name"
            ;;
        "branch")
            show_branch "$submodule_name"
            ;;
        "clean")
            clean_submodules "$submodule_name"
            ;;
        "help"|"")
            show_help
            ;;
        *)
            echo -e "${RED}错误: 未知命令 '$command'${NC}"
            show_help
            exit 1
            ;;
    esac
}

# 运行主函数
main "$@" 