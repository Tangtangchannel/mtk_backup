import platform
import sys
import distro
import pkg_resources
import os
import urllib.request


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
        print("Git仓库克隆失败！")
        return False


def download_file(url, save_directory):
    file_name = url.split("/")[-1]
    save_path = os.path.join(save_directory, file_name)
    try:
        urllib.request.urlretrieve(url, save_path)
        print("文件下载完成！")
        return True
    except urllib.error.URLError:
        print("文件下载失败！")
        return False


print("hello!")

print("在第一次运行此程序时，我们需要进行一些软件-包的安装！并且检查您的系统依赖")

# 判断操作系统类型
system = platform.system()

# 获取脚本所在目录
script_directory = os.path.dirname(os.path.abspath(__file__))

if system == "Windows":
    windows_version = platform.win32_ver()[0]
    print("当前Windows版本：", windows_version)
elif system == "Linux":
    current_distribution = get_linux_distribution()
    print("当前发行版：", current_distribution)
    kernel_version = get_kernel_version()
    print("当前内核版本：", kernel_version)
else:
    print("未知操作系统")

python_version = get_python_version()
print("当前Python版本：", python_version)
print("已经安装的pip软件包：", get_installed_packages_count())

while True:
    user_choice = input("请输入您的选择（1. git拉取最新代码，2. 使用国内下载服务，q. 退出）：")

    if user_choice == "1":
        git_url = 'https://github.com/Tangtangchannel/mtk_backup.git'
        if clone_repository(git_url):
            break
    elif user_choice == "2":
        file_url = 'https://www.tangspace.cn/tracker/trackercn.txt'
        save_directory = os.path.join(script_directory, "tmp")
        os.makedirs(save_directory, exist_ok=True)  # 创建tmp文件夹
        if download_file(file_url, save_directory):
            break
    elif user_choice.lower() == "q":
        break

print("程序已退出！")
exit(0)