
@echo off
title Home-PartitionBackup
echo ���س�����ʼ/Press Enter Start??
echo #����/Backup
cd mtkclient
mkdir Backupfile
python mtk r nvcfg Backupfile\nvcfg.bin
python mtk r nvdata Backupfile\nvdata.bin
python mtk r nvram Backupfile\nvram.bin
cls
echo OK
pause