# 子模块管理脚本 - PowerShell版本
# 使用方法: .\scripts\submodule-manager.ps1 [命令] [子模块名]

param(
    [Parameter(Position=0)]
    [string]$Command = "help",
    
    [Parameter(Position=1)]
    [string]$SubmoduleName,
    
    [Parameter(Position=2)]
    [string]$ExtraArgs
)

# 颜色定义
$Red = "Red"
$Green = "Green"
$Yellow = "Yellow"
$Blue = "Blue"
$White = "White"

# 脚本目录
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ProjectRoot = Split-Path -Parent $ScriptDir

# 子模块配置
$Submodules = @{
    "admin-pc" = "letter-admin-pc"
}

# 获取子模块路径
function Get-SubmodulePath {
    param([string]$Name)
    
    if ($Submodules.ContainsKey($Name)) {
        return $Submodules[$Name]
    }
    return $null
}

# 打印帮助信息
function Show-Help {
    Write-Host "子模块管理工具 - PowerShell版本" -ForegroundColor $Blue
    Write-Host ""
    Write-Host "使用方法: $($MyInvocation.MyCommand.Name) [命令] [子模块名]"
    Write-Host ""
    Write-Host "命令:"
    Write-Host "  init      - 初始化所有子模块"
    Write-Host "  update    - 更新所有子模块"
    Write-Host "  status    - 查看子模块状态"
    Write-Host "  pull      - 拉取子模块最新代码"
    Write-Host "  push      - 推送子模块代码"
    Write-Host "  commit    - 提交子模块更改"
    Write-Host "  add       - 添加新文件到子模块"
    Write-Host "  log       - 查看子模块提交历史"
    Write-Host "  branch    - 查看子模块分支信息"
    Write-Host "  clean     - 清理子模块未跟踪文件"
    Write-Host "  help      - 显示此帮助信息"
    Write-Host ""
    Write-Host "子模块名:"
    foreach ($key in $Submodules.Keys) {
        Write-Host "  $key -> $($Submodules[$key])"
    }
    Write-Host ""
    Write-Host "示例:"
    Write-Host "  $($MyInvocation.MyCommand.Name) init                    # 初始化所有子模块"
    Write-Host "  $($MyInvocation.MyCommand.Name) update admin-pc         # 更新admin-pc子模块"
    Write-Host "  $($MyInvocation.MyCommand.Name) status                  # 查看所有子模块状态"
}

# 检查是否在项目根目录
function Test-ProjectRoot {
    if (-not (Test-Path "$ProjectRoot\.gitmodules")) {
        Write-Host "错误: 请在项目根目录运行此脚本" -ForegroundColor $Red
        exit 1
    }
}

# 初始化子模块
function Initialize-Submodules {
    Write-Host "初始化子模块..." -ForegroundColor $Blue
    Set-Location $ProjectRoot
    git submodule init
    git submodule update
    Write-Host "子模块初始化完成" -ForegroundColor $Green
}

# 更新子模块
function Update-Submodules {
    param([string]$SubmoduleName)
    
    if ($SubmoduleName) {
        # 更新特定子模块
        $path = Get-SubmodulePath $SubmoduleName
        if ($path) {
            Write-Host "更新子模块: $SubmoduleName ($path)" -ForegroundColor $Blue
            Set-Location "$ProjectRoot\$path"
            git fetch origin
            git pull origin main
            Write-Host "子模块 $SubmoduleName 更新完成" -ForegroundColor $Green
        } else {
            Write-Host "错误: 未知的子模块名 '$SubmoduleName'" -ForegroundColor $Red
            exit 1
        }
    } else {
        # 更新所有子模块
        Write-Host "更新所有子模块..." -ForegroundColor $Blue
        Set-Location $ProjectRoot
        git submodule foreach git fetch origin
        git submodule foreach git pull origin main
        Write-Host "所有子模块更新完成" -ForegroundColor $Green
    }
}

# 查看子模块状态
function Show-Status {
    Write-Host "子模块状态:" -ForegroundColor $Blue
    Set-Location $ProjectRoot
    git submodule status
    Write-Host ""
    Write-Host "详细状态:" -ForegroundColor $Blue
    foreach ($key in $Submodules.Keys) {
        $path = $Submodules[$key]
        if (Test-Path $path) {
            Write-Host "$key ($path):" -ForegroundColor $Yellow
            Set-Location "$ProjectRoot\$path"
            git status --short
            Set-Location $ProjectRoot
        }
    }
}

# 拉取子模块
function Pull-Submodules {
    param([string]$SubmoduleName)
    
    if ($SubmoduleName) {
        $path = Get-SubmodulePath $SubmoduleName
        if ($path) {
            Write-Host "拉取子模块: $SubmoduleName" -ForegroundColor $Blue
            Set-Location "$ProjectRoot\$path"
            git pull origin main
        } else {
            Write-Host "错误: 未知的子模块名 '$SubmoduleName'" -ForegroundColor $Red
            exit 1
        }
    } else {
        Write-Host "拉取所有子模块..." -ForegroundColor $Blue
        Set-Location $ProjectRoot
        git submodule foreach git pull origin main
    }
}

# 推送子模块
function Push-Submodules {
    param([string]$SubmoduleName)
    
    if ($SubmoduleName) {
        $path = Get-SubmodulePath $SubmoduleName
        if ($path) {
            Write-Host "推送子模块: $SubmoduleName" -ForegroundColor $Blue
            Set-Location "$ProjectRoot\$path"
            git push origin main
        } else {
            Write-Host "错误: 未知的子模块名 '$SubmoduleName'" -ForegroundColor $Red
            exit 1
        }
    } else {
        Write-Host "推送所有子模块..." -ForegroundColor $Blue
        Set-Location $ProjectRoot
        git submodule foreach git push origin main
    }
}

# 提交子模块更改
function Commit-Submodules {
    param([string]$SubmoduleName, [string]$Message)
    
    if (-not $Message) {
        $Message = "更新子模块"
    }
    
    if ($SubmoduleName) {
        $path = Get-SubmodulePath $SubmoduleName
        if ($path) {
            Write-Host "提交子模块: $SubmoduleName" -ForegroundColor $Blue
            Set-Location "$ProjectRoot\$path"
            git add .
            git commit -m $Message
        } else {
            Write-Host "错误: 未知的子模块名 '$SubmoduleName'" -ForegroundColor $Red
            exit 1
        }
    } else {
        Write-Host "提交所有子模块更改..." -ForegroundColor $Blue
        Set-Location $ProjectRoot
        git submodule foreach 'git add . && git commit -m "自动提交更改" || true'
    }
}

# 添加文件到子模块
function Add-ToSubmodule {
    param([string]$SubmoduleName, [string]$Files)
    
    if (-not $SubmoduleName) {
        Write-Host "错误: 请指定子模块名" -ForegroundColor $Red
        exit 1
    }
    
    $path = Get-SubmodulePath $SubmoduleName
    if ($path) {
        Write-Host "添加文件到子模块: $SubmoduleName" -ForegroundColor $Blue
        Set-Location "$ProjectRoot\$path"
        if ($Files) {
            git add $Files
        } else {
            git add .
        }
        Write-Host "文件已添加到暂存区" -ForegroundColor $Green
    } else {
        Write-Host "错误: 未知的子模块名 '$SubmoduleName'" -ForegroundColor $Red
        exit 1
    }
}

# 查看子模块日志
function Show-Log {
    param([string]$SubmoduleName)
    
    if ($SubmoduleName) {
        $path = Get-SubmodulePath $SubmoduleName
        if ($path) {
            Write-Host "子模块日志: $SubmoduleName" -ForegroundColor $Blue
            Set-Location "$ProjectRoot\$path"
            git log --oneline -10
        } else {
            Write-Host "错误: 未知的子模块名 '$SubmoduleName'" -ForegroundColor $Red
            exit 1
        }
    } else {
        Write-Host "所有子模块日志:" -ForegroundColor $Blue
        foreach ($key in $Submodules.Keys) {
            $path = $Submodules[$key]
            if (Test-Path $path) {
                Write-Host "$key:" -ForegroundColor $Yellow
                Set-Location "$ProjectRoot\$path"
                git log --oneline -5
                Write-Host ""
                Set-Location $ProjectRoot
            }
        }
    }
}

# 查看子模块分支信息
function Show-Branch {
    param([string]$SubmoduleName)
    
    if ($SubmoduleName) {
        $path = Get-SubmodulePath $SubmoduleName
        if ($path) {
            Write-Host "子模块分支: $SubmoduleName" -ForegroundColor $Blue
            Set-Location "$ProjectRoot\$path"
            git branch -a
        } else {
            Write-Host "错误: 未知的子模块名 '$SubmoduleName'" -ForegroundColor $Red
            exit 1
        }
    } else {
        Write-Host "所有子模块分支:" -ForegroundColor $Blue
        foreach ($key in $Submodules.Keys) {
            $path = $Submodules[$key]
            if (Test-Path $path) {
                Write-Host "$key:" -ForegroundColor $Yellow
                Set-Location "$ProjectRoot\$path"
                git branch -a
                Write-Host ""
                Set-Location $ProjectRoot
            }
        }
    }
}

# 清理子模块
function Clean-Submodules {
    param([string]$SubmoduleName)
    
    if ($SubmoduleName) {
        $path = Get-SubmodulePath $SubmoduleName
        if ($path) {
            Write-Host "清理子模块: $SubmoduleName" -ForegroundColor $Blue
            Set-Location "$ProjectRoot\$path"
            git clean -fd
            git reset --hard HEAD
        } else {
            Write-Host "错误: 未知的子模块名 '$SubmoduleName'" -ForegroundColor $Red
            exit 1
        }
    } else {
        Write-Host "清理所有子模块..." -ForegroundColor $Blue
        Set-Location $ProjectRoot
        git submodule foreach 'git clean -fd && git reset --hard HEAD'
    }
}

# 主函数
function Main {
    Test-ProjectRoot
    
    switch ($Command.ToLower()) {
        "init" { Initialize-Submodules }
        "update" { Update-Submodules $SubmoduleName }
        "status" { Show-Status }
        "pull" { Pull-Submodules $SubmoduleName }
        "push" { Push-Submodules $SubmoduleName }
        "commit" { Commit-Submodules $SubmoduleName $ExtraArgs }
        "add" { Add-ToSubmodule $SubmoduleName $ExtraArgs }
        "log" { Show-Log $SubmoduleName }
        "branch" { Show-Branch $SubmoduleName }
        "clean" { Clean-Submodules $SubmoduleName }
        "help" { Show-Help }
        default {
            Write-Host "错误: 未知命令 '$Command'" -ForegroundColor $Red
            Show-Help
            exit 1
        }
    }
}

# 运行主函数
Main 