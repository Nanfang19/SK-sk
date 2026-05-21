# 检查扩展表是否存在
# Free-FS 扩展表检查脚本

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  检查 Free-FS 扩展表是否存在" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

# 检查 MySQL 命令是否可用
try {
    $mysqlPath = Get-Command mysql -ErrorAction SilentlyContinue
    if (-not $mysqlPath) {
        Write-Host "❌ 未找到 mysql 命令！" -ForegroundColor Red
        Write-Host "请先确保 MySQL 已安装并添加到系统 PATH 中" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "或者使用以下方法检查：" -ForegroundColor Yellow
        Write-Host "1. 使用 Navicat/HeidiSQL 等图形化工具" -ForegroundColor Yellow
        Write-Host "2. 直接执行 SQL 脚本：check_and_init.sql" -ForegroundColor Yellow
        Write-Host ""
        pause
        exit 1
    }
    
    Write-Host "✅ 找到 MySQL 命令行工具" -ForegroundColor Green
    Write-Host ""
    
    # 构建命令
    $query = "USE \`free-fs\`; SHOW TABLES LIKE 'file_%';"
    
    Write-Host "正在连接数据库并检查..." -ForegroundColor Yellow
    Write-Host ""
    
    # 执行查询
    $result = & mysql -h 127.0.0.1 -P 3306 -u root -p582000 -e $query 2>&1
    
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ 连接数据库失败！" -ForegroundColor Red
        Write-Host "错误信息: $result" -ForegroundColor Red
        Write-Host ""
        Write-Host "请检查：" -ForegroundColor Yellow
        Write-Host "1. MySQL 服务是否启动" -ForegroundColor Yellow
        Write-Host "2. 用户名和密码是否正确 (root/582000)" -ForegroundColor Yellow
        Write-Host "3. 数据库 'free-fs' 是否存在" -ForegroundColor Yellow
        Write-Host ""
        pause
        exit 1
    }
    
    Write-Host "==========================================" -ForegroundColor Cyan
    Write-Host "查询结果：" -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host $result
    Write-Host ""
    
    # 检查结果
    $hasFileVersion = $result -match 'file_version'
    $hasFileAuditLog = $result -match 'file_audit_log'
    $hasFilePermission = $result -match 'file_permission'
    
    Write-Host "==========================================" -ForegroundColor Cyan
    Write-Host "检查结果汇总：" -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor Cyan
    Write-Host ""
    
    if ($hasFileVersion) {
        Write-Host "✅ file_version 表 - 已存在" -ForegroundColor Green
    } else {
        Write-Host "❌ file_version 表 - 不存在" -ForegroundColor Red
    }
    
    if ($hasFileAuditLog) {
        Write-Host "✅ file_audit_log 表 - 已存在" -ForegroundColor Green
    } else {
        Write-Host "❌ file_audit_log 表 - 不存在" -ForegroundColor Red
    }
    
    if ($hasFilePermission) {
        Write-Host "✅ file_permission 表 - 已存在" -ForegroundColor Green
    } else {
        Write-Host "❌ file_permission 表 - 不存在" -ForegroundColor Red
    }
    
    Write-Host ""
    
    if ($hasFileVersion -and $hasFileAuditLog -and $hasFilePermission) {
        Write-Host "🎉 所有扩展表都已存在！" -ForegroundColor Green
        Write-Host ""
        Write-Host "下一步：" -ForegroundColor Yellow
        Write-Host "1. 重启后端服务" -ForegroundColor Yellow
        Write-Host "2. 测试文件操作功能" -ForegroundColor Yellow
        Write-Host "3. 在文件详情页查看操作历史" -ForegroundColor Yellow
    } else {
        Write-Host "⚠️  缺少扩展表！" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "请执行以下任一 SQL 脚本：" -ForegroundColor Yellow
        Write-Host "1. check_and_init.sql - 智能检查并创建" -ForegroundColor Cyan
        Write-Host "2. init_extension_tables.sql - 完整初始化" -ForegroundColor Cyan
    }
    
    Write-Host ""
    
} catch {
    Write-Host "❌ 执行过程出错：$_" -ForegroundColor Red
}

Write-Host ""
pause
