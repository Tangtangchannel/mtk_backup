import sys
from PyQt5.QtWidgets import QApplication, QWidget, QMessageBox, QPushButton

class WarningWindow(QWidget):
    def __init__(self):
        super().__init__()
        self.initUI()

    def initUI(self):
        self.setGeometry(300, 300, 300, 200)
        self.setWindowTitle('警告窗口示例')

    def show_warning(self):
        QMessageBox.warning(self, '警告', '这是一个警告窗口！')

if __name__ == '__main__':
    app = QApplication(sys.argv)
    window = WarningWindow()
    warning_button = QPushButton('显示警告', window)
    warning_button.clicked.connect(window.show_warning)
    warning_button.move(100, 80)
    window.show()
    sys.exit(app.exec_())
