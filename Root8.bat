@echo off
title Home-Root-K40G1258
echo #Root
echo Request Permission������
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
echo ��ȡȨ�޳ɹ���/Request Permission Finished��
pause
cls
echo Ŀǰ���ڲ��Խ׶Σ����ש���е�����
pause
cls
echo ���س�����ʼ
pause
cls
title ����ˢ���������ϵͳ�����ط�����TANGSPACE�ṩ������
echo #������ʱ�ļ��У���ɺ���Զ�ɾ��
mkdir cache
echo #����aria2c��������
aria2c -d cache -s 8 -o payload.bin "https://tangtangpan.lm379.cn/d/%E9%98%BF%E9%87%8C%E4%BA%91/%E5%B0%8F%E7%B1%B3ROM/Payload12.5.8.bin" 
timeout /t 5    
cls
echo #����Payload
title #����Payload
payload-dumper-go.exe -p boot -o cache payload.bin
if exist cache\boot.img (
    echo ��ȡ���
    echo ���������޲�Boot
) else (
    echo ���ڸ�ʲô��
)
echo �޲�Boot
title �޲�Boot
xcopy boot_patch cache
cd cache
python dopatch.py --file boot.img
if exist cache\new_boot.img (
    echo �޲����
    echo ׼��ˢ�룡
) else (
    echo ���������˵����⣿
)
echo #Ȩ������
title #Ȩ������
echo �����USB���Ժ󣬰��س�����
pause
echo ��ͬ��Ȩ������
adb reboot bootloader
echo ��δ����Bootloader�����ֶ����룡
title #ˢ��
echo #ˢ��
fastboot erase boot_ab
fastboot flash boot_ab new_boot.img
fastboot reboot
echo �������밲װMagisk������Ƿ�ɹ���
echo �����˳�...