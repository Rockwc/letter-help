# 子模块管理使用指南

本项目配置了便捷的子模块管理工具，支持Linux/macOS和Windows平台，让您可以轻松管理多个子仓库。

## 🖥️ 跨平台支持

### 平台兼容性

| 平台 | 脚本类型 | 文件 | 推荐度 |
|------|----------|------|--------|
| **Linux/macOS** | Bash脚本 | `scripts/submodule-manager.sh` | ⭐⭐⭐⭐⭐ |
| **Windows** | PowerShell | `scripts/submodule-manager.ps1` | ⭐⭐⭐⭐⭐ |
| **Windows** | 批处理 | `scripts/submodule-manager.bat` | ⭐⭐⭐ |
| **Windows** | Makefile | `Makefile.windows` | ⭐⭐⭐⭐ |

## 快速开始

### Linux/macOS 用户

#### 方法一：使用 Makefile（推荐）

```bash
# 查看所有可用命令
make help

# 查看子模块状态
make status

# 更新特定子模块
make admin-pc-update

# 推送特定子模块
make admin-pc-push
```

#### 方法二：使用别名

```bash
# 加载别名（在项目根目录执行）
source scripts/submodule-aliases.sh

# 使用别名命令
sm-status
sm-update admin-pc
sm-commit admin-pc "更新功能"
```

#### 方法三：直接使用脚本

```bash
# 查看帮助
./scripts/submodule-manager.sh help

# 查看状态
./scripts/submodule-manager.sh status

# 更新特定子模块
./scripts/submodule-manager.sh update admin-pc
```

### Windows 用户

#### 方法一：使用 PowerShell（推荐）

```powershell
# 查看所有可用命令
.\scripts\submodule-manager.ps1 help

# 查看子模块状态
.\scripts\submodule-manager.ps1 status

# 更新特定子模块
.\scripts\submodule-manager.ps1 update admin-pc

# 推送特定子模块
.\scripts\submodule-manager.ps1 push admin-pc
```

#### 方法二：使用批处理文件

```cmd
# 查看帮助
scripts\submodule-manager.bat help

# 查看状态
scripts\submodule-manager.bat status

# 更新特定子模块
scripts\submodule-manager.bat update admin-pc
```

#### 方法三：使用 Windows Makefile

```cmd
# 查看所有可用命令
make -f Makefile.windows help

# 查看子模块状态
make -f Makefile.windows status

# 更新特定子模块
make -f Makefile.windows admin-pc-update
```

## 可用命令

### 通用命令

| 命令 | Linux/macOS | Windows PowerShell | Windows 批处理 |
|------|-------------|-------------------|----------------|
| `init` | `make init` | `.\scripts\submodule-manager.ps1 init` | `scripts\submodule-manager.bat init` |
| `update` | `make update` | `.\scripts\submodule-manager.ps1 update` | `scripts\submodule-manager.bat update` |
| `status` | `make status` | `.\scripts\submodule-manager.ps1 status` | `scripts\submodule-manager.bat status` |
| `pull` | `make pull` | `.\scripts\submodule-manager.ps1 pull` | `scripts\submodule-manager.bat pull` |
| `push` | `make push` | `.\scripts\submodule-manager.ps1 push` | `scripts\submodule-manager.bat push` |
| `commit` | `make commit` | `.\scripts\submodule-manager.ps1 commit` | `scripts\submodule-manager.bat commit` |
| `add` | `make add` | `.\scripts\submodule-manager.ps1 add` | `scripts\submodule-manager.bat add` |
| `log` | `make log` | `.\scripts\submodule-manager.ps1 log` | `scripts\submodule-manager.bat log` |
| `branch` | `make branch` | `.\scripts\submodule-manager.ps1 branch` | `scripts\submodule-manager.bat branch` |
| `clean` | `make clean` | `.\scripts\submodule-manager.ps1 clean` | `scripts\submodule-manager.bat clean` |

### 特定子模块命令

| 命令 | Linux/macOS | Windows PowerShell | Windows 批处理 |
|------|-------------|-------------------|----------------|
| `admin-pc-update` | `make admin-pc-update` | `.\scripts\submodule-manager.ps1 update admin-pc` | `scripts\submodule-manager.bat update admin-pc` |
| `admin-pc-push` | `make admin-pc-push` | `.\scripts\submodule-manager.ps1 push admin-pc` | `scripts\submodule-manager.bat push admin-pc` |
| `admin-pc-commit` | `make admin-pc-commit` | `.\scripts\submodule-manager.ps1 commit admin-pc` | `scripts\submodule-manager.bat commit admin-pc` |

## 子模块配置

当前配置的子模块：

| 别名 | 路径 | 远程仓库 |
|------|------|----------|
| `admin-pc` | `letter-admin-pc/` | `https://github.com/Rockwc/letter-admin-pc.git` |

## 工作流程示例

### Linux/macOS 日常开发流程

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

### Windows 日常开发流程

1. **查看状态**
   ```powershell
   .\scripts\submodule-manager.ps1 status
   ```

2. **更新子模块**
   ```powershell
   .\scripts\submodule-manager.ps1 update admin-pc
   ```

3. **在子模块中开发**
   ```powershell
   cd letter-admin-pc
   # 进行开发工作...
   ```

4. **提交更改**
   ```powershell
   .\scripts\submodule-manager.ps1 commit admin-pc "更新功能"
   ```

5. **推送更改**
   ```powershell
   .\scripts\submodule-manager.ps1 push admin-pc
   ```

### 新环境初始化

#### Linux/macOS
```bash
# 克隆主仓库
git clone https://github.com/Rockwc/letter-help.git
cd letter-help

# 初始化子模块
make init

# 验证配置
make status
```

#### Windows
```powershell
# 克隆主仓库
git clone https://github.com/Rockwc/letter-help.git
cd letter-help

# 初始化子模块
.\scripts\submodule-manager.ps1 init

# 验证配置
.\scripts\submodule-manager.ps1 status
```

## 技术原理

### Shell脚本（.sh文件）原理

- **解释执行**：由bash解释器逐行执行命令
- **自动化**：将复杂的Git命令组合成简单的一步操作
- **封装**：隐藏底层Git子模块的复杂操作

### PowerShell脚本（.ps1文件）原理

- **面向对象**：PowerShell是面向对象的脚本语言
- **参数化**：支持参数验证和类型检查
- **模块化**：函数化设计，易于维护

### Makefile原理

- **任务定义**：定义构建任务和依赖关系
- **跨平台**：通过不同版本的Makefile支持不同平台
- **简化命令**：将复杂命令简化为简单的make目标

## 故障排除

### 常见问题

1. **子模块更新失败**
   ```bash
   # Linux/macOS
   make clean
   make init
   
   # Windows
   .\scripts\submodule-manager.ps1 clean
   .\scripts\submodule-manager.ps1 init
   ```

2. **权限问题**
   ```bash
   # Linux/macOS
   chmod +x scripts/submodule-manager.sh
   
   # Windows PowerShell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

3. **子模块状态异常**
   ```bash
   # 重置子模块
   git submodule deinit letter-admin-pc
   git submodule update --init letter-admin-pc
   ```

### 获取帮助

```bash
# Linux/macOS
./scripts/submodule-manager.sh help
make help

# Windows
.\scripts\submodule-manager.ps1 help
scripts\submodule-manager.bat help
```

## 扩展配置

如需添加新的子模块，请编辑相应脚本文件中的配置：

### Linux/macOS
```bash
# scripts/submodule-manager.sh
SUBMODULE_NAMES=("admin-pc" "new-module")
SUBMODULE_PATHS=("letter-admin-pc" "path/to/new-module")
```

### Windows PowerShell
```powershell
# scripts/submodule-manager.ps1
$Submodules = @{
    "admin-pc" = "letter-admin-pc"
    "new-module" = "path/to/new-module"
}
```

然后更新相应的Makefile添加目标。 