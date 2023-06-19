import sys
from PyQt5.QtWidgets import QApplication, QWidget, QMessageBox

def show_warning_window(title, message):
    app = QApplication(sys.argv)
    window = QWidget()
    window.setWindowTitle(title)
    window.setGeometry(300, 300, 300, 200)

    reply = QMessageBox.warning(window, title, message,
                                QMessageBox.Yes | QMessageBox.No, QMessageBox.No)
    if reply == QMessageBox.Yes:
        print('用户选择了继续操作。')
    else:
        QMessageBox.information(window, '取消操作', '您已经取消安装，程序即将退出。')
        exit(1)

    return app

# 调用示例
show_warning_window('咋回事呢？', '你确定你要安装吗？请准备好科学上网连接，否则有可能无法安装依赖项。\n是否继续操作？')
# 执行其他操作...
