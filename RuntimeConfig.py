@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d %~dp0%
:1
echo ѡ�����ԣ�Change Language��
echo 1.�������� 2.English
set /p a=Please Select:
if /i "%a%"=="2" call RuntimeConfigEN.bat
if /i "%a%"=="1" call RuntimeConfigCN.bat
pause