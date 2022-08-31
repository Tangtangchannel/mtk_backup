@echo off
echo 请求权限......
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
cls
title 欢迎使用控制台！作者酷安：@刻晴_officiai
color 4
echo 欢迎使用Mtk_backup
echo 本工具用于备份和恢复部分MTK设备的关键分区
pause
cls
echo 使用本工具会涉及到底层操作，由此带来的风险不承担任何后果！
echo 如愿意承担责任请按回车进入控制台！否则请关闭程序并删除！
pause
:1
cls
title 首页：控制台
echo            -----------------------------首页-------------------------------
echo 
echo 1.自动备份关键分区  2.【Beta】完整备份（包括USERDATA）  3.恢复关键分区  4.解锁Bootloader
echo
echo 如有疑问，请查看README
set /p a=你的选择:
if /i "%a%"=="1" call Partitionbackup.bat
if /i "%a%"=="2" call PartitionBackupAll.bat
if /i "%a%"=="3" call PartitionRecover.bat
if /i "%a%"=="4" call UnlockBootloader.bat
echo 需要返回控制台吗？
echo 1.返回 2.退出
set /p a=你的选择:
if /i "%a%"=="1" goto :1
if /i "%a%"=="2" exit