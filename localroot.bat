@echo off
title Home-Root-General
echo #Root
echo Request Permission。。。
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
echo 获取权限成功！/Request Permission Finished！
pause
cls
pause
cls
echo 本程序可以为您的设备（不止K40G）获取Root权限，此操作适配绝大多数MTK机型，部分机型（如K30U正在寻找解决方案中）
echo 程序会从你的系统本地提取文件并修改，无需下载任何依赖。
echo 请确认是否正确安装Mtk-Backup；如Mtk-Backup安装不完整则运行会出现错误！
echo 按回车开始，否则关闭窗口
pause
cls