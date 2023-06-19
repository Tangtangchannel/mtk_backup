import sys
from PyQt5.QtWidgets import QApplication, QWidget, QMessageBox
import platform
import sys
import distro
import pkg_resources
import os
import urllib.request
from pyfiglet import Figlet
import subprocess

f = Figlet(font='slant')
tangtang = f.renderText('New-Mtkclient')

# 借助shell清理屏幕。
def clear_screen():
    system = platform.system()
    if system == 'Windows':
        subprocess.call('cls', shell=True)
    else:
        subprocess.call('clear', shell=True)


# 按任意键继续的函数
def press_any_key_to_continue():
    print("请按下任意键继续...")
    if platform.system() == "Windows":
        os.system("pause > nul")
    else:
        os.system("read -n 1 -s -r -p ''")

def get_linux_distribution():
    distribution_name = distro.name()
    return distribution_name if distribution_name else "Unknown"


def get_kernel_version():
    return platform.uname().release


def get_python_version():
    return sys.version.split()[0]


def get_installed_packages_count():
    installed_packages = [pkg.key for pkg in pkg_resources.working_set]
    return len(installed_packages)


def clone_repository(repo_url):
    repo_name = repo_url.split("/")[-1].replace(".git", "")
    clone_directory = os.path.join(script_directory, repo_name)
    try:
        os.system(f"git clone {repo_url} {clone_directory}")
        print("Git仓库克隆完成！")
        return True
    except Exception:
        print("error:Git仓库克隆失败！")
        return False


def download_file(url, save_directory):
    file_name = url.split("/")[-1]
    save_path = os.path.join(save_directory, file_name)
    try:
        urllib.request.urlretrieve(url, save_path)
        print("文件下载完成！")
        # 创建 dwfinish 文件
        dwfinish_file = os.path.join(script_directory, "dwfinish")
        with open(dwfinish_file, 'w') as f:
            f.write("文件下载完成")
        return True
    except urllib.error.URLError:
        print("文件下载失败！")
        return False


def suki_satouchan_tux():
    press_any_key_to_continue()
    clear_screen()
    print("您的OS为" + platform.system() + ",您需要补全依赖项。")
    print(tangtang)
    print("")
    print("您可以准备部署了！")
    print("请选择安装选项：")
    print("1.正常安装 \t 2.卸载 \t 3.musicroom")

    while True:
        choice = input("请输入您的选择：")
        if choice == '1':
            show_warning_window('咋回事呢？', '你确定你要安装吗？请准备好科学上网连接，否则有可能无法安装依赖项。\n是否继续操作？')
            # 执行正常安装的代码
            break
        elif choice == '2':
            show_warning_window('咋回事呢？', '卸载ですか？真的要卸载吗？\n是否狠心操作？')
            # 执行卸载的代码
            break
        elif choice == '3':
            # 执行musicroom相关代码
            break
        elif choice.lower() == 'q':
            print('程序已退出。')
            exit(0)
        else:
            print('输入错误，请重新输入。')


def fuc_windows_conf():
    press_any_key_to_continue()
    clear_screen()
    print("您的OS为" + platform.system() + ",您需要补全依赖项。")
    print(tangtang)


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


print("hello!")

print("在第一次运行此程序时，我们需要进行一些软件包的安装！并且检查您的系统依赖")

# 判断操作系统类型
system = platform.system()

# 获取脚本所在目录
script_directory = os.path.dirname(os.path.abspath(__file__))

if system == "Windows":
    windows_version = platform.win32_ver()[0]
    print("当前Windows版本：", windows_version)
    # 创建 env_win 文件
    env_file = os.path.join(script_directory, "env_win")
    with open(env_file, 'w') as f:
        f.write("Windows环境")
elif system == "Linux":
    current_distribution = get_linux_distribution()
    print("当前发行版：", current_distribution)
    kernel_version = get_kernel_version()
    print("当前内核版本：", kernel_version)
    # 创建 env_tux 文件
    env_file = os.path.join(script_directory, "env_tux")
    with open(env_file, 'w') as f:
        f.write("Linux环境")
else:
    print("error:未知操作系统")

python_version = get_python_version()
print("当前Python版本：", python_version)
print("已经安装的pip软件包：", get_installed_packages_count())

dwfinish_file = os.path.join(script_directory, "dwfinish")

# 判断是否存在 dwfinish 文件
if os.path.exists(dwfinish_file):
    print("info:检测到 dwfinish 文件，跳过下载步骤")
else:
    while True:
        user_choice = input("请输入您的选择（1. git拉取最新代码，2. 使用国内下载服务，q. 退出）：")

        if user_choice == "1":
            git_url = 'https://github.com/Tangtangchannel/mtk_backup.git'
            if clone_repository(git_url):
                # 创建 dwfinish 文件
                dwfinish_file = os.path.join(script_directory, "dwfinish")
                with open(dwfinish_file, 'w') as f:
                    f.write("Git仓库克隆完成")
                break
        elif user_choice == "2":
            file_url = 'https://www.tangspace.cn/tracker/trackercn.txt'
            save_directory = os.path.join(script_directory, "tmp")
            os.makedirs(save_directory, exist_ok=True)  # 创建tmp文件夹
            if download_file(file_url, save_directory):
                break
        elif user_choice.lower() == "q":
            break

# 判断 script_directory 所在目录是否存在 env_win/env_tux 文件
env_win_file = os.path.join(script_directory, "env_win")
env_tux_file = os.path.join(script_directory, "env_tux")

if os.path.exists(env_win_file):
    # 执行函数 fuc_windows_conf
    fuc_windows_conf()
elif os.path.exists(env_tux_file):
    # 执行函数 suki_satouchan_tux
    suki_satouchan_tux()
else:
    print("error:未知的环境")
