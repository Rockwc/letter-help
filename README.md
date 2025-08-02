# Letter Help - 信件管理系统

一个基于子模块架构的信件管理系统，支持多平台开发和管理。

## 📋 项目概述

本项目采用主仓库 + 子模块的架构设计，便于团队协作和模块化开发：

- **主仓库**：`letter-help` - 项目管理和配置
- **子模块**：`letter-admin-pc` - PC端管理后台

## 🏗️ 项目架构

```
letter-help/                    # 主仓库
├── letter-admin-pc/           # 子模块：PC端管理后台
│   └── README.md             # 子模块文档
├── scripts/                   # 管理脚本
│   ├── submodule-manager.sh  # Linux/macOS脚本
│   ├── submodule-manager.ps1 # Windows PowerShell脚本
│   ├── submodule-manager.bat # Windows批处理脚本
│   └── submodule-aliases.sh  # 别名配置
├── docs/                     # 文档
│   └── submodule-management.md
├── Makefile                  # Linux/macOS Makefile
├── Makefile.windows          # Windows Makefile
└── README.md                 # 项目文档
```

## 🚀 快速开始

### 1. 克隆项目

```bash
# 克隆主仓库
git clone https://github.com/Rockwc/letter-help.git
cd letter-help

# 初始化子模块
make init  # Linux/macOS
# 或
.\scripts\submodule-manager.ps1 init  # Windows
```

### 2. 查看项目状态

```bash
# 查看所有子模块状态
make status  # Linux/macOS
# 或
.\scripts\submodule-manager.ps1 status  # Windows
```

### 3. 开始开发

```bash
# 进入子模块开发
cd letter-admin-pc
# 进行开发工作...

# 提交更改
make admin-pc-commit  # Linux/macOS
# 或
.\scripts\submodule-manager.ps1 commit admin-pc "更新功能"  # Windows
```

## 🛠️ 子模块管理工具

本项目提供了强大的子模块管理工具，支持多平台操作。

### 平台支持

| 平台 | 脚本类型 | 推荐度 | 使用方式 |
|------|----------|--------|----------|
| **Linux/macOS** | Bash脚本 | ⭐⭐⭐⭐⭐ | `make [命令]` |
| **Windows** | PowerShell | ⭐⭐⭐⭐⭐ | `.\scripts\submodule-manager.ps1 [命令]` |
| **Windows** | 批处理 | ⭐⭐⭐ | `scripts\submodule-manager.bat [命令]` |

### 常用命令

#### Linux/macOS 用户

```bash
# 查看帮助
make help

# 查看状态
make status

# 更新子模块
make admin-pc-update

# 推送代码
make admin-pc-push

# 提交更改
make admin-pc-commit
```

#### Windows 用户

```powershell
# 查看帮助
.\scripts\submodule-manager.ps1 help

# 查看状态
.\scripts\submodule-manager.ps1 status

# 更新子模块
.\scripts\submodule-manager.ps1 update admin-pc

# 推送代码
.\scripts\submodule-manager.ps1 push admin-pc

# 提交更改
.\scripts\submodule-manager.ps1 commit admin-pc "更新功能"
```

### 完整命令列表

| 命令 | 描述 | Linux/macOS | Windows |
|------|------|-------------|---------|
| `init` | 初始化所有子模块 | `make init` | `.\scripts\submodule-manager.ps1 init` |
| `update` | 更新所有子模块 | `make update` | `.\scripts\submodule-manager.ps1 update` |
| `status` | 查看子模块状态 | `make status` | `.\scripts\submodule-manager.ps1 status` |
| `pull` | 拉取子模块代码 | `make pull` | `.\scripts\submodule-manager.ps1 pull` |
| `push` | 推送子模块代码 | `make push` | `.\scripts\submodule-manager.ps1 push` |
| `commit` | 提交子模块更改 | `make commit` | `.\scripts\submodule-manager.ps1 commit` |
| `log` | 查看子模块日志 | `make log` | `.\scripts\submodule-manager.ps1 log` |
| `clean` | 清理子模块 | `make clean` | `.\scripts\submodule-manager.ps1 clean` |

## 📚 子模块说明

### letter-admin-pc

**PC端管理后台**

- **技术栈**：React + TypeScript + Ant Design
- **功能**：信件管理、用户管理、系统设置
- **路径**：`letter-admin-pc/`
- **远程仓库**：`https://github.com/Rockwc/letter-admin-pc.git`

## 🔧 开发工作流

### 日常开发流程

1. **查看状态**
   ```bash
   make status  # 或 .\scripts\submodule-manager.ps1 status
   ```

2. **更新子模块**
   ```bash
   make admin-pc-update  # 或 .\scripts\submodule-manager.ps1 update admin-pc
   ```

3. **进入子模块开发**
   ```bash
   cd letter-admin-pc
   # 进行开发工作...
   ```

4. **提交更改**
   ```bash
   make admin-pc-commit  # 或 .\scripts\submodule-manager.ps1 commit admin-pc "更新说明"
   ```

5. **推送代码**
   ```bash
   make admin-pc-push  # 或 .\scripts\submodule-manager.ps1 push admin-pc
   ```

### 新环境设置

```bash
# 1. 克隆主仓库
git clone https://github.com/Rockwc/letter-help.git
cd letter-help

# 2. 初始化子模块
make init  # Linux/macOS
# 或
.\scripts\submodule-manager.ps1 init  # Windows

# 3. 验证配置
make status
```

## 🐛 故障排除

### 常见问题

1. **子模块更新失败**
   ```bash
   # 清理并重新初始化
   make clean && make init
   # 或
   .\scripts\submodule-manager.ps1 clean
   .\scripts\submodule-manager.ps1 init
   ```

2. **权限问题（Linux/macOS）**
   ```bash
   chmod +x scripts/submodule-manager.sh
   ```

3. **PowerShell执行策略（Windows）**
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

4. **子模块状态异常**
   ```bash
   git submodule deinit letter-admin-pc
   git submodule update --init letter-admin-pc
   ```

### 获取帮助

```bash
# 查看脚本帮助
./scripts/submodule-manager.sh help  # Linux/macOS
.\scripts\submodule-manager.ps1 help  # Windows

# 查看Makefile帮助
make help  # Linux/macOS
make -f Makefile.windows help  # Windows
```

## 📖 详细文档

- [子模块管理详细指南](docs/submodule-management.md)
- [letter-admin-pc 子模块文档](letter-admin-pc/README.md)

## 🤝 贡献指南

1. Fork 项目
2. 创建功能分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 打开 Pull Request

## 📄 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

## 📞 联系方式

- 项目链接：[https://github.com/Rockwc/letter-help](https://github.com/Rockwc/letter-help)
- 子模块链接：[https://github.com/Rockwc/letter-admin-pc](https://github.com/Rockwc/letter-admin-pc)

---

**提示**：首次使用建议先运行 `make help` 或 `.\scripts\submodule-manager.ps1 help` 查看所有可用命令。 