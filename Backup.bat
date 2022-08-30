@echo off
echo 请求权限......
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
cls
title Console
color 2
echo 选择语言（Change Language）
echo 1.简体中文 2.English
set /p a=Please Select:
if /i "%a%"=="2" call BackupEN.bat
if /i "%a%"=="1" call BackupCN.bat
pause