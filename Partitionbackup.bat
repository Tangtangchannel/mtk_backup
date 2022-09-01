@echo off
title Home-PartitionBackup
echo 按回车键开始/Press Enter Start！
echo #备份/Backup
cd mtkclient
mkdir Backupfile
python mtk r nvcfg Backupfile\nvcfg.bin
python mtk r nvdata Backupfile\nvdata.bin
python mtk r nvram Backupfile\nvram.bin
cls
echo OK
pause