@echo off
echo ==========================================
echo  检查 Free-FS 扩展表是否存在
echo ==========================================
echo.

mysql -h 127.0.0.1 -P 3306 -u root -p582000 -e "USE \`free-fs\`; SHOW TABLES LIKE 'file_%';"

if %errorlevel% neq 0 (
    echo.
    echo ❌ 连接数据库失败！请检查：
    echo    1. MySQL 服务是否启动
    echo    2. 用户名和密码是否正确
    echo    3. 数据库 free-fs 是否存在
    echo.
    pause
    exit /b 1
)

echo.
echo ==========================================
echo  如果看到以下三个表，说明扩展表已创建：
echo    - file_version
echo    - file_audit_log
echo    - file_permission
echo ==========================================
echo.
pause
