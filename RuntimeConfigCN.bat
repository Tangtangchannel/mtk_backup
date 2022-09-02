@echo off
title 使用GPLV3许可开源的程序，请遵守LICENSE！作者@刻晴_officiai，引用见README
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
echo 首先需要配置环境！
echo 按回车键开始
pause
echo 解压Mtkclient 如出现选项请按y
7z x mtkclient.zip
if exist mtkclient  (
    echo 解压完成，开始配置
) else (
    echo 你是不是动了什么？
    pause
    echo 再见
    exit
)
echo 代码技术过烂，您是否已经安装Python并添加其到PATH了？
echo 你最好已经安装了
echo 继续执行请按回车
pause
echo #配置Mtkclient的运行环境
title 配置Mtkclient的运行环境
pip3 install -r mtkclient\requirements.txt
cd mtkclient
python setup.py install
pause
cls
echo Finished