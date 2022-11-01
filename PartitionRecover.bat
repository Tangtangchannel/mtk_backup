@echo off
title Home-PartitionBackup
echo 按回车键开始/Press Enter Start！
echo #恢复/Recocver
cd mtkclient
mkdir Backupfile
python mtk w nvcfg Backupfile\nvcfg.bin
python mtk w nvdata Backupfile\nvdata.bin
python mtk w nvram Backupfile\nvram.bin
cls
echo OK
pause
