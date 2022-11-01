@echo off
title Home-Root-K40G1258
echo #Root
echo Request Permission。。。
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
echo 获取权限成功！/Request Permission Finished！
pause
cls
echo 目前仍在测试阶段，如变砖不承担责任
pause
cls
echo 按回车键开始
pause
cls
title 下载刷机包到你的系统，下载服务由TANGSPACE提供。。。
echo #创建临时文件夹，完成后会自动删除
mkdir cache
echo #调用aria2c进行下载
aria2c -d cache -s 8 -o payload.bin "https://tangtangpan.lm379.cn/d/%E9%98%BF%E9%87%8C%E4%BA%91/%E5%B0%8F%E7%B1%B3ROM/Payload12.5.8.bin" 
timeout /t 5    
cls
echo #解析Payload
title #解析Payload
payload-dumper-go.exe -p boot -o cache payload.bin
if exist cache\boot.img (
    echo 提取完成
    echo 接下来将修补Boot
) else (
    echo 你在干什么？
)
echo 修补Boot
title 修补Boot
xcopy boot_patch cache
cd cache
python dopatch.py --file boot.img
if exist cache\new_boot.img (
    echo 修补完成
    echo 准备刷入！
) else (
    echo 看起来出了点问题？
)
echo #权限请求
title #权限请求
echo 打开你的USB调试后，按回车键。
pause
echo 请同意权限请求！
adb reboot bootloader
echo 如未进入Bootloader，请手动进入！
title #刷入
echo #刷入
fastboot erase boot_ab
fastboot flash boot_ab new_boot.img
fastboot reboot
echo 开机后，请安装Magisk并检查是否成功！
echo 即将退出...