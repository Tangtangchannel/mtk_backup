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