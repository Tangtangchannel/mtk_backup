package main

import (
	"fmt"
	"os"
	"os/exec"
)

func main() {
	currentDir, err := os.Getwd()
	if err != nil {
		fmt.Println("\033[31m无法获取当前工作目录：", err, "\033[0m")
	} else {
		fmt.Printf("\033[32m当前工作目录：%s\033[0m\n", currentDir)
	}

	pythonPath, err := exec.LookPath("python")
	if err != nil {
		fmt.Println("\033[31m未找到 Python。\033[0m")
	} else {
		fmt.Printf("\033[32m找到 Python 路径：%s\033[0m\n", pythonPath)
	}

	pipPath, err := exec.LookPath("pip")
	if err != nil {
		pipPath, err = exec.LookPath("pip3")
		if err != nil {
			fmt.Println("\033[31m未找到 pip/pip3。\033[0m")
		} else {
			fmt.Printf("\033[32m找到 pip3 路径：%s\033[0m\n", pipPath)
		}
	} else {
		fmt.Printf("\033[32m找到 pip 路径：%s\033[0m\n", pipPath)
	}

	fmt.Println("按回车键退出程序。")
	fmt.Scanln()
}
