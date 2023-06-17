package main

import (
	"bufio"
	"embed"
	"fmt"
	"io/ioutil"
	"os"
	"os/exec"
	"strings"
)

//go:embed kami.mp4
var embeddedFile embed.FS

func main() {
	currentDir, err := os.Getwd()
	if err != nil {
		fmt.Printf("\033[31m无法获取当前工作目录：%v\033[0m\n", err)
	} else {
		fmt.Printf("\033[32m当前工作目录：%s\033[0m\n", currentDir)
	}

	pythonPath, err := exec.LookPath("python")
	if err != nil {
		fmt.Println("\033[31m未找到 Python。\033[0m")
	} else {
		fmt.Printf("\033[32m找到 Python 路径：%s\033[0m\n", pythonPath)

		pythonVersionCmd := exec.Command(pythonPath, "--version")
		pythonOutput, err := pythonVersionCmd.Output()
		if err != nil {
			fmt.Printf("\033[31m无法获取 Python 版本：%v\033[0m\n", err)
		} else {
			pythonVersion := strings.TrimSpace(string(pythonOutput))
			fmt.Printf("\033[32mPython 版本：%s\033[0m\n", pythonVersion)
		}
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

		pipVersionCmd := exec.Command(pipPath, "--version")
		pipOutput, err := pipVersionCmd.Output()
		if err != nil {
			fmt.Printf("\033[31m无法获取 pip 版本：%v\033[0m\n", err)
		} else {
			pipVersion := strings.TrimSpace(string(pipOutput))
			fmt.Printf("\033[32mPip 版本：%s\033[0m\n", pipVersion)
		}
	}

	fmt.Println("按回车键退出程序，或输入'kami'执行命令。")
	reader := bufio.NewReader(os.Stdin)
	input, _ := reader.ReadString('\n')
	input = strings.TrimSpace(input)

	if input == "kami" {
		destPath := "/tmp/kami.mp4"

		err := writeFileFromEmbeddedFile("kami.mp4", destPath)
		if err != nil {
			fmt.Printf("\033[31m无法写入文件：%v\033[0m\n", err)
			return
		}

        cmd := exec.Command("konsole", "-e", "termplay", destPath)
		cmd.Stdout = os.Stdout
		cmd.Stderr = os.Stderr

		fmt.Println("执行命令：konsole -e termplay", destPath)
		err = cmd.Run()
		if err != nil {
			fmt.Printf("\033[31m执行命令失败：%v\033[0m\n", err)
		} else {
			fmt.Println("命令执行成功。")
		}
	}

	fmt.Println("程序已退出。")
}

func writeFileFromEmbeddedFile(resourceName, destPath string) error {
	fileData, err := embeddedFile.ReadFile(resourceName)
	if err != nil {
		return err
	}

	err = ioutil.WriteFile(destPath, fileData, 0644)
	if err != nil {
		return err
	}

	return nil
}
