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
title 下载刷机包到你的系统，下载服务由【刻晴_official】提供。。。
echo 创建临时文件夹，完成后会自动删除
mkdir downloadcache
echo 调用aria2c进行下载
aria2c.exe -o downloadcache\12.5.8G.zip https://tangtangpan.lm379.cn/d/阿里云（cn，主站点）/小米ROM/miui_ARES_V12.5.8.0.RKJCNXM_d866a4bd8b_11.0.zip?pw=ba87d4ed9e8da00d
timeout /t 5
cls
echo 解压ROM
7z.exe x -o downloadcache downloadcache\12.5.8G.zip