@echo off
title Home-Root
echo #Root
echo Request Permission������
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
echo ��ȡȨ�޳ɹ���/Request Permission Finished��
pause
:1
cls
echo            -----------------------------Root���-------------------------------
echo 1.None 2.Ϊ����K40��Ϸ��ǿ�棨MIUI12.5.8����ȡRootȨ�� 3.Ϊ�����豸��ȡRootȨ�ޣ������豸��
echo 
set /p a=���ѡ��:
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