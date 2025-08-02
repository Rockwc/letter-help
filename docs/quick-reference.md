# 子模块管理工具快速参考

## 🚀 快速开始

### Linux/macOS
```bash
# 查看帮助
make help

# 查看状态
make status

# 更新子模块
make admin-pc-update

# 推送代码
make admin-pc-push
```

### Windows
```powershell
# 查看帮助
.\scripts\submodule-manager.ps1 help

# 查看状态
.\scripts\submodule-manager.ps1 status

# 更新子模块
.\scripts\submodule-manager.ps1 update admin-pc

# 推送代码
.\scripts\submodule-manager.ps1 push admin-pc
```

## 📋 命令速查表

### 基础命令

| 命令 | 描述 | Linux/macOS | Windows |
|------|------|-------------|---------|
| `help` | 显示帮助信息 | `make help` | `.\scripts\submodule-manager.ps1 help` |
| `init` | 初始化所有子模块 | `make init` | `.\scripts\submodule-manager.ps1 init` |
| `status` | 查看子模块状态 | `make status` | `.\scripts\submodule-manager.ps1 status` |
| `update` | 更新所有子模块 | `make update` | `.\scripts\submodule-manager.ps1 update` |
| `pull` | 拉取子模块代码 | `make pull` | `.\scripts\submodule-manager.ps1 pull` |
| `push` | 推送子模块代码 | `make push` | `.\scripts\submodule-manager.ps1 push` |
| `commit` | 提交子模块更改 | `make commit` | `.\scripts\submodule-manager.ps1 commit` |
| `add` | 添加文件到子模块 | `make add` | `.\scripts\submodule-manager.ps1 add` |
| `log` | 查看子模块日志 | `make log` | `.\scripts\submodule-manager.ps1 log` |
| `branch` | 查看子模块分支 | `make branch` | `.\scripts\submodule-manager.ps1 branch` |
| `clean` | 清理子模块 | `make clean` | `.\scripts\submodule-manager.ps1 clean` |

### 特定子模块命令

| 命令 | 描述 | Linux/macOS | Windows |
|------|------|-------------|---------|
| `admin-pc-update` | 更新admin-pc子模块 | `make admin-pc-update` | `.\scripts\submodule-manager.ps1 update admin-pc` |
| `admin-pc-push` | 推送admin-pc子模块 | `make admin-pc-push` | `.\scripts\submodule-manager.ps1 push admin-pc` |
| `admin-pc-commit` | 提交admin-pc更改 | `make admin-pc-commit` | `.\scripts\submodule-manager.ps1 commit admin-pc` |
| `admin-pc-status` | 查看admin-pc状态 | `make admin-pc-status` | `.\scripts\submodule-manager.ps1 status` |
| `admin-pc-log` | 查看admin-pc日志 | `make admin-pc-log` | `.\scripts\submodule-manager.ps1 log admin-pc` |
| `admin-pc-branch` | 查看admin-pc分支 | `make admin-pc-branch` | `.\scripts\submodule-manager.ps1 branch admin-pc` |
| `admin-pc-clean` | 清理admin-pc | `make admin-pc-clean` | `.\scripts\submodule-manager.ps1 clean admin-pc` |

## 🔄 常用工作流程

### 日常开发流程

```bash
# 1. 查看状态
make status

# 2. 更新子模块
make admin-pc-update

# 3. 进入子模块开发
cd letter-admin-pc
# 进行开发工作...

# 4. 提交更改
make admin-pc-commit

# 5. 推送代码
make admin-pc-push
```

### 新环境设置

```bash
# 1. 克隆项目
git clone https://github.com/Rockwc/letter-help.git
cd letter-help

# 2. 初始化子模块
make init

# 3. 验证配置
make status
```

## 🐛 故障排除

### 常见问题解决

| 问题 | 解决方案 |
|------|----------|
| 子模块更新失败 | `make clean && make init` |
| 权限问题 | `chmod +x scripts/submodule-manager.sh` |
| PowerShell执行策略 | `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser` |
| 子模块状态异常 | `git submodule deinit letter-admin-pc && git submodule update --init letter-admin-pc` |

### 获取帮助

```bash
# 查看脚本帮助
./scripts/submodule-manager.sh help  # Linux/macOS
.\scripts\submodule-manager.ps1 help  # Windows

# 查看Makefile帮助
make help  # Linux/macOS
make -f Makefile.windows help  # Windows
```

## 📁 项目结构

```
letter-help/
├── letter-admin-pc/           # 子模块：PC端管理后台
├── scripts/                   # 管理脚本
│   ├── submodule-manager.sh  # Linux/macOS脚本
│   ├── submodule-manager.ps1 # Windows PowerShell脚本
│   ├── submodule-manager.bat # Windows批处理脚本
│   └── submodule-aliases.sh  # 别名配置
├── docs/                     # 文档
│   ├── submodule-management.md
│   ├── technical-principles.md
│   └── quick-reference.md
├── Makefile                  # Linux/macOS Makefile
├── Makefile.windows          # Windows Makefile
└── README.md                 # 项目文档
```

## 🎯 最佳实践

### 1. 命令使用建议

- **首次使用**：先运行 `make help` 查看所有可用命令
- **日常开发**：使用 `make status` 检查状态，`make admin-pc-update` 更新代码
- **提交代码**：使用 `make admin-pc-commit` 和 `make admin-pc-push` 提交和推送

### 2. 错误处理

- **权限问题**：确保脚本有执行权限
- **路径问题**：确保在项目根目录运行命令
- **网络问题**：检查Git远程仓库连接

### 3. 团队协作

- **统一工具**：团队使用相同的管理工具
- **文档共享**：保持文档的及时更新
- **版本控制**：确保所有脚本都在版本控制中

## 📞 支持信息

- **项目仓库**：[https://github.com/Rockwc/letter-help](https://github.com/Rockwc/letter-help)
- **子模块仓库**：[https://github.com/Rockwc/letter-admin-pc](https://github.com/Rockwc/letter-admin-pc)
- **详细文档**：[docs/submodule-management.md](docs/submodule-management.md)
- **技术原理**：[docs/technical-principles.md](docs/technical-principles.md)

---

**提示**：将此文档保存为书签，方便快速查阅常用命令！ 