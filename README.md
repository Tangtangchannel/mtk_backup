# mtk_backup

用于备份和恢复设备关键分区的程序（适用于使用MTK处理器的MIUI设备）


## ！本项目将在近日进行大规模更新，旧的源码即将下线！



### 致谢
[MoorCorPa](https://github.com/MoorCorPa)

### 引用的程序

[mtk-client](https://github.com/bkerler/mtkclient)

[Payload-dumper-go](https://github.com/ssut/payload-dumper-go)

[Magisk-patcher](https://github.com/affggh/Magisk_patcher)（修改）

### 需求：

Python3.9+（pip3）、Windows10及以上操作系统（x64），运行时没有任何杀毒软件运行（防止运行异常）

安装USBdk和MTK驱动在你的电脑（安装后重启）：

[USBdk](https://tangtangpan.lm379.cn/%E9%98%BF%E9%87%8C%E4%BA%91/%E8%AE%BE%E5%A4%87%E6%95%91%E6%8F%B4/UsbDk_1.0.22_x64.msi)

[MTK驱动（包含）](https://tangtangpan.lm379.cn/%E9%98%BF%E9%87%8C%E4%BA%91/%E8%AE%BE%E5%A4%87%E6%95%91%E6%8F%B4/%E6%B7%B1%E5%88%B7%E5%B7%A5%E5%85%B7%E5%92%8C%E9%A9%B1%E5%8A%A8.zip)

Python需要在系统的环境变量PATH内。

### 使用方法：

<u>首先需要配置Mtkclient运行环境，不配置Mtkclient时无法使用大部分功能。</u>

1.运行<u>RuntimeConfigCN.bat</u>,配置你的使用环境，按照脚本提示操作。

如配置正确为以下提示![](https://github.com/Tangtangchannel/mtk_backup/blob/main/example/runtimeconfig.png)

2.使用

打开Backup.bat，开始使用吧！

![](https://github.com/Tangtangchannel/mtk_backup/blob/main/example/backup.png)

3.有BUG可以提lssues给我
