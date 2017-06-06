# QQTweak-macOS

[![license](https://img.shields.io/github/license/mashape/apistatus.svg)](LICENSE)
[![README](https://img.shields.io/badge/README-English-blue.svg)](README.md)
[![README](https://img.shields.io/badge/README-中文-blue.svg)](README-Chinese.md)

A dynamic library tweak for QQ macOS.

## Screenshot

![](Screenshot/0x01.png)

## Feature

- Prevent message revoked

## Todo

- [ ] Add detail of revocation to notification
- [ ] Fix document path

## Usage

- `sudo make install` Inject the dylib to `QQ`
- `sudo make uninstall` Uninstall the injection

## Development

**Requirement: Command Line Tools**

Run `xcode-select --install` to install Command Line Tools

- `make build` Build the dylib file to the same dicrectory
- `make debug` Build the dylib file and run `QQ` with dynamic injection
- `make clean` Clean output files

## Dependency

- [insert_dylib](https://github.com/Tyilo/insert_dylib)

## Reference

- [WeChatTweak-macOS](https://github.com/Sunnyyoung/WeChatTweak-macOS)

## License

The [MIT License](LICENSE).
