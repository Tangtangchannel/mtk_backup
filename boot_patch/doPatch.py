import argparse
import os
import shutil
import zipfile

from boot_patch import Patch

magisk = "Magisk-v25.2"
arch = "arm64"


def __parseApk():
    filename = "." + os.sep + "run" + os.sep + magisk + ".apk"

    def returnMagiskVersion(buf):
        v = "Unknow"
        l = buf.decode('utf_8').split("\n")
        for i in l:
            if not i.find("MAGISK_VER=") == -1:
                v = i.split("=")[1].strip("'")
                break
        return v

    def rename(n):
        if n.startswith("lib") and n.endswith(".so"):
            n = n.replace("lib", "").replace(".so", "")
        return n

    if not os.access(filename, os.F_OK):
        return False
    else:
        f = zipfile.ZipFile(filename, 'r')
        l = f.namelist()  # l equals list
        tl = []  # tl equals total get list
        for i in l:
            if i.startswith("assets/") or \
                    i.startswith("lib/"):
                tl.append(i)

        buf = f.read("assets/util_functions.sh")
        mVersion = returnMagiskVersion(buf)
        print("Parse Magisk Version : " + mVersion + "\n")
        for i in tl:
            if i.startswith("assets"):
                f.extract(i, "tmp")
            else:
                if arch == "arm64":
                    if i.startswith("lib/arm64-v8a/") and i.endswith(".so"):
                        f.extract(i, "tmp")
                elif arch == "arm":
                    if i.startswith("lib/armeabi-v7a/") and i.endswith(".so"):
                        f.extract(i, "tmp")
                elif arch == "x86_64":
                    if i.startswith("lib/x86_64/") and i.endswith(".so"):
                        f.extract(i, "tmp")
                elif arch == "x86":
                    if i.startswith("lib/x86/") and i.endswith(".so"):
                        f.extract(i, "tmp")
        for i in tl:
            if not i.startswith("assets"):
                if arch == "arm64" and not os.access("libmagisk32.so", os.F_OK):
                    if i == "lib/armeabi-v7a/libmagisk32.so":
                        f.extract("lib/armeabi-v7a/libmagisk32.so", "tmp")
                elif arch == "x86_64" and not os.access("libmagisk32.so", os.F_OK):
                    if i == "lib/x86/libmagisk32.so":
                        f.extract("lib/armeabi-v7a/libmagisk32.so", "tmp")
        f.close()
        print("yes")
        shutil.move("tmp/assets/", "assets/")
        for root, dirs, files in os.walk("tmp"):
            for file in files:
                if file.endswith(".so"):
                    shutil.move(root + os.sep + file, rename(os.path.basename(file)))
        if os.access("magiskpolicy", os.F_OK):
            shutil.move("magiskpolicy", "assets/magiskpolicy")
        shutil.rmtree("tmp")
        return True


def cleanup():
    def delete(p):
        if os.path.isfile(p):
            os.remove(p)
        elif os.path.isdir(p):
            shutil.rmtree(p)

    rmlist = [
        "magisk32",
        "magisk64",
        "magiskinit",
        "magiskboot",
        "busybox",
        "header",
        "kernel",
        "ramdisk.cpio",
        "extra",
        "kernel_dtb",
        "recovery_dtbo",
        "dtb",
        "magiskpolicy",
        "assets"
    ]
    print("- Clean Up ...")
    for i in rmlist: delete(i)


def patch(file):
    if not os.access(args.file, os.F_OK):
        print("boot 不存在\n")
        return False
    if os.access("." + os.sep + "new-boot.img", os.F_OK):  # Delete exist patched image before patch
        os.remove("." + os.sep + "new-boot.img")
    if not __parseApk():
        print("Error : Cannot parse apk file...\n")
        return False
    p = Patch()

    p.setmagiskboot("." + os.sep + "run" + os.sep + "magiskboot.exe")
    p.patchboot(file)
    cleanup()

    return True


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='description')
    parser.add_argument('--file', required=True, type=str)
    args = parser.parse_args()

    patch(args.file)
    # file = readFile(path=args.file)
