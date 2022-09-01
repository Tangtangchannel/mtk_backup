@echo off
title Programs using the GPLV3 license open source, please comply with LICENSE! Author @keqing_officiai, see README for reference
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
echo First you need to configure the environment!
echo Press enter to start!
pause
echo Unzip Mtkclient, if there is an option, press y
7z x mtkclient.zip
if exist mtkclient  (
    echo Decompression is complete, start configuration
) else (
    echo Did you move something? Please don't modify it at will!
    pause
    echo Goodbye~
    exit
)
echo Poor code skills, have you installed Python and added it to your PATH?
echo preferably already installed.
echo To continue, press enter
pause
echo #Configure the operating environment of Mtkclient
title Configure the operating environment of Mtkclient
pip3 install -r mtkclient/requirements.txt
cd mtkclient
python setup.py install