@echo off
title Home-PartitionBackup
echo 按回车键开始/Press Enter Start！
echo #解锁Bootloader/UnlockBootloader
cd mtkclient-1.52
python mtk da seccfg unlock
echo 可能已经解锁完成，请查看最终状态/May have been unlocked, please check the final status.
echo 如无限重启，可能是需要执行fastboot oem cdms（自行下载fast boot执行）/If restarting infinitely, it may be necessary to execute fastboot oem cdms (download fastboot by yourself and execute)
pause
cls
echo OK
pause