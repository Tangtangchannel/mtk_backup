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
aria2c -d cache -s 8 -o payload.bin "https://tangtangpan.lm379.cn/d/189/payload.bin" 
timeout /t 5    
cls
echo #����Payload
title #����Payload
payload-dumper-go.exe -p boot -o cache cache\payload.bin
if exist cache\boot.img (
    echo ��ȡ���
    echo ���������޲�Boot
) else (
    echo ���ڸ�ʲô��
)
echo �޲�Boot
title �޲�Boot
xcopy boot_patch cache /e
cd cache
python dopatch.py --file boot.img
pause
if exist cache\new-boot.img (
    echo �޲����
    echo ׼��ˢ�룡
) else (
    echo ���������˵����⣿
    pause
    exit
)
echo #Ȩ������
title #Ȩ������
echo �����USB���Ժ��ٰ��س�����
pause
echo ��ͬ��Ȩ������
adb reboot bootloader
echo ��δ����Bootloader�����ֶ����룡
title #ˢ��
echo #ˢ��
fastboot erase boot_ab
fastboot flash boot_ab new-boot.img
fastboot reboot
echo �������밲װMagisk������Ƿ�ɹ���
echo �����˳�...
timeout /t 5

