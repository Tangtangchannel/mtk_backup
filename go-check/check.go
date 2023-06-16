package main

import (
	"fmt"
	"os"
	"os/exec"
)

func main() {
	currentDir, err := os.Getwd()
	if err != nil {
		fmt.Println("无法获取当前工作目录：", err)
	} else {
		fmt.Println("当前工作目录：", currentDir)
	}

	pythonPath, err := exec.LookPath("python")
	if err != nil {
		fmt.Println("未找到 Python。")
	} else {
		fmt.Println("找到 Python 路径：", pythonPath)
	}

	pipPath, err := exec.LookPath("pip")
	if err != nil {
		pipPath, err = exec.LookPath("pip3")
		if err != nil {
			fmt.Println("未找到 pip/pip3。")
		} else {
			fmt.Println("找到 pip3 路径：", pipPath)
		}
	} else {
		fmt.Println("找到 pip 路径：", pipPath)
	}

	fmt.Println("按回车键退出程序。")
	fmt.Scanln()
}
