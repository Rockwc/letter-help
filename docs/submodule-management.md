# 子模块管理使用指南

本项目配置了便捷的子模块管理工具，让您可以轻松管理多个子仓库。

## 快速开始

### 方法一：使用 Makefile（推荐）

```bash
# 查看所有可用命令
make help

# 查看子模块状态
make status

# 更新所有子模块
make update

# 更新特定子模块
make admin-pc-update

# 推送特定子模块
make admin-pc-push

# 提交特定子模块更改
make admin-pc-commit
```

### 方法二：使用别名

```bash
# 加载别名（在项目根目录执行）
source scripts/submodule-aliases.sh

# 使用别名命令
sm-status
sm-update admin-pc
sm-commit admin-pc "更新功能"
```

### 方法三：直接使用脚本

```bash
# 查看帮助
./scripts/submodule-manager.sh help

# 查看状态
./scripts/submodule-manager.sh status

# 更新特定子模块
./scripts/submodule-manager.sh update admin-pc
```

## 可用命令

### 通用命令

| 命令 | 描述 | 示例 |
|------|------|------|
| `init` | 初始化所有子模块 | `make init` |
| `update` | 更新所有子模块 | `make update` |
| `status` | 查看子模块状态 | `make status` |
| `pull` | 拉取子模块代码 | `make pull` |
| `push` | 推送子模块代码 | `make push` |
| `commit` | 提交子模块更改 | `make commit` |
| `add` | 添加文件到子模块 | `make add` |
| `log` | 查看子模块日志 | `make log` |
| `branch` | 查看子模块分支 | `make branch` |
| `clean` | 清理子模块 | `make clean` |

### 特定子模块命令

| 命令 | 描述 | 示例 |
|------|------|------|
| `admin-pc-update` | 更新admin-pc子模块 | `make admin-pc-update` |
| `admin-pc-push` | 推送admin-pc子模块 | `make admin-pc-push` |
| `admin-pc-commit` | 提交admin-pc更改 | `make admin-pc-commit` |
| `admin-pc-status` | 查看admin-pc状态 | `make admin-pc-status` |
| `admin-pc-log` | 查看admin-pc日志 | `make admin-pc-log` |
| `admin-pc-branch` | 查看admin-pc分支 | `make admin-pc-branch` |
| `admin-pc-clean` | 清理admin-pc | `make admin-pc-clean` |

## 子模块配置

当前配置的子模块：

| 别名 | 路径 | 远程仓库 |
|------|------|----------|
| `admin-pc` | `letter-admin-pc/` | `https://github.com/Rockwc/letter-admin-pc.git` |

## 工作流程示例

### 日常开发流程

1. **查看状态**
   ```bash
   make status
   ```

2. **更新子模块**
   ```bash
   make admin-pc-update
   ```

3. **在子模块中开发**
   ```bash
   cd letter-admin-pc
   # 进行开发工作...
   ```

4. **提交更改**
   ```bash
   make admin-pc-commit
   ```

5. **推送更改**
   ```bash
   make admin-pc-push
   ```

### 新环境初始化

1. **克隆主仓库**
   ```bash
   git clone https://github.com/Rockwc/letter-help.git
   cd letter-help
   ```

2. **初始化子模块**
   ```bash
   make init
   ```

3. **验证配置**
   ```bash
   make status
   ```

## 故障排除

### 常见问题

1. **子模块更新失败**
   ```bash
   # 清理并重新初始化
   make clean
   make init
   ```

2. **权限问题**
   ```bash
   # 确保脚本有执行权限
   chmod +x scripts/submodule-manager.sh
   ```

3. **子模块状态异常**
   ```bash
   # 重置子模块
   git submodule deinit letter-admin-pc
   git submodule update --init letter-admin-pc
   ```

### 获取帮助

```bash
# 查看脚本帮助
./scripts/submodule-manager.sh help

# 查看Makefile帮助
make help
```

## 扩展配置

如需添加新的子模块，请编辑 `scripts/submodule-manager.sh` 文件中的 `SUBMODULES` 配置：

```bash
declare -A SUBMODULES=(
    ["admin-pc"]="letter-admin-pc"
    ["new-module"]="path/to/new-module"  # 添加新模块
)
```

然后更新 `Makefile` 添加相应的目标。 