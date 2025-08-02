# 子模块管理 Makefile
# 使用方法: make [目标]

.PHONY: help init update status pull push commit add log branch clean

# 默认目标
help:
	@echo "子模块管理命令:"
	@echo "  make init      - 初始化所有子模块"
	@echo "  make update    - 更新所有子模块"
	@echo "  make status    - 查看子模块状态"
	@echo "  make pull      - 拉取子模块代码"
	@echo "  make push      - 推送子模块代码"
	@echo "  make commit    - 提交子模块更改"
	@echo "  make add       - 添加文件到子模块"
	@echo "  make log       - 查看子模块日志"
	@echo "  make branch    - 查看子模块分支"
	@echo "  make clean     - 清理子模块"
	@echo ""
	@echo "特定子模块操作:"
	@echo "  make admin-pc-update  - 更新admin-pc子模块"
	@echo "  make admin-pc-push    - 推送admin-pc子模块"
	@echo "  make admin-pc-commit  - 提交admin-pc更改"

# 初始化子模块
init:
	@./scripts/submodule-manager.sh init

# 更新所有子模块
update:
	@./scripts/submodule-manager.sh update

# 查看子模块状态
status:
	@./scripts/submodule-manager.sh status

# 拉取子模块代码
pull:
	@./scripts/submodule-manager.sh pull

# 推送子模块代码
push:
	@./scripts/submodule-manager.sh push

# 提交子模块更改
commit:
	@./scripts/submodule-manager.sh commit

# 添加文件到子模块
add:
	@./scripts/submodule-manager.sh add

# 查看子模块日志
log:
	@./scripts/submodule-manager.sh log

# 查看子模块分支
branch:
	@./scripts/submodule-manager.sh branch

# 清理子模块
clean:
	@./scripts/submodule-manager.sh clean

# admin-pc 子模块特定操作
admin-pc-update:
	@./scripts/submodule-manager.sh update admin-pc

admin-pc-push:
	@./scripts/submodule-manager.sh push admin-pc

admin-pc-commit:
	@./scripts/submodule-manager.sh commit admin-pc

admin-pc-status:
	@./scripts/submodule-manager.sh status

admin-pc-log:
	@./scripts/submodule-manager.sh log admin-pc

admin-pc-branch:
	@./scripts/submodule-manager.sh branch admin-pc

admin-pc-clean:
	@./scripts/submodule-manager.sh clean admin-pc 