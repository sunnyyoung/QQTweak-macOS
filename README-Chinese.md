# QQTweak-macOS

[![license](https://img.shields.io/github/license/mashape/apistatus.svg)](LICENSE)
[![README](https://img.shields.io/badge/README-English-blue.svg)](README.md)
[![README](https://img.shields.io/badge/README-中文-blue.svg)](README-Chinese.md)

QQ macOS 客户端 Tweak 动态库。

## 截图

![](Screenshot/0x01.png)

## 功能

- 阻止消息撤回
- 去除自动上报

## Todo

- [ ] 增加撤回通知详细信息
- [ ] 修复数据文件储存路径

## 使用

- `sudo make install`   安装动态库
- `sudo make uninstall` 卸载动态库

## 开发调试

**Requirement: Command Line Tools**

运行命令：`xcode-select --install` 安装 Command Line Tools

- `make build` 编译 dylib 动态库到当前目录下
- `make debug` 编译 dylib 动态库并临时注入QQ macOS 客户端
- `make clean` 清除生成文件

## 依赖

- [insert_dylib](https://github.com/Tyilo/insert_dylib)

## 参考

- [WeChatTweak-macOS](https://github.com/Sunnyyoung/WeChatTweak-macOS)

## License

The [MIT License](LICENSE).
