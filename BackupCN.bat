@echo off
echo ����Ȩ��......
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
cls
title ��ӭʹ�ÿ���̨�����߿ᰲ��@����_officiai
color 4
echo ��ӭʹ��Mtk_backup
echo ���������ڱ��ݺͻָ�����MTK�豸�Ĺؼ�����
pause
cls
echo ʹ�ñ����߻��漰���ײ�������ɴ˴����ķ��ղ��е��κκ����
echo ��Ը��е������밴�س��������̨��������رճ���ɾ����
pause
:1
cls
title ��ҳ������̨
echo            -----------------------------��ҳ-------------------------------
echo 
echo 1.�Զ����ݹؼ�����  2.��Beta���������ݣ�����USERDATA��  3.�ָ��ؼ�����  4.����Bootloader 5.һ��Root 6.����ADB 7.��ͼ�ν����Mtkclient
echo
echo �������ʣ���鿴README
set /p a=���ѡ��:
if /i "%a%"=="1" call Partitionbackup.bat
if /i "%a%"=="2" call PartitionBackupAll.bat
if /i "%a%"=="3" call PartitionRecover.bat
if /i "%a%"=="4" call UnlockBootloader.bat
if /i "%a%"=="5" call Root.bat
if /i "%a%"=="6" call adb.bat
echo ��Ҫ���ؿ���̨��
echo 1.���� 2.�˳�
set /p a=���ѡ��:
if /i "%a%"=="1" goto :1
if /i "%a%"=="2" exit