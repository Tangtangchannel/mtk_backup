@echo off
title Home-Root
echo #Root
echo Request Permission。。。
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
echo 获取权限成功！/Request Permission Finished！
pause
:1
cls
echo            -----------------------------Root面板-------------------------------
echo 1.None 2.为红米K40游戏增强版（MIUI12.5.8）获取Root权限 3.为您的设备获取Root权限（不限设备）
echo 
set /p a=你的选择:
if /i "%a%"=="1" (
    call K40G-Root12.bat
    pause
)
if /i "%a%"=="2" (
    call K40G-Root8.bat
    pause
)
if /i "%a%"=="3" (
    call localroot.bat
    pause
)