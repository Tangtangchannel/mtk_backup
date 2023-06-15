import platform
import sys
import distro
import pkg_resources

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

def get_system_info():
    print("hello!")

    print("在第一次运行此程序时，我们需要进行一些pip包的安装！并且检查您的系统依赖")
    # 判断操作系统类型
    system = platform.system()
    if system == "Windows":
        # 获取Windows版本
        windows_version = platform.win32_ver()[0]
        print("当前Windows版本：", windows_version)
    elif system == "Linux":
        # 获取发行版信息
        current_distribution = get_linux_distribution()
        print("当前发行版：", current_distribution)
        # 获取内核版本
        kernel_version = get_kernel_version()
        print("当前内核版本：", kernel_version)
    else:
        print("未知操作系统")

    # 获取Python版本
    python_version = get_python_version()
    print("当前Python版本：", python_version)
    print("已经安装的pip软件包：", get_installed_packages_count())

# 调用函数获取系统信息
get_system_info()
