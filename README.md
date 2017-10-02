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

- [x] Fix document path
- [ ] Add detail of revocation to notification
- [ ] Add Alfred support

## Usage

- `sudo make install` Inject the dylib to `QQ`
- `sudo make uninstall` Uninstall the injection

## Dependency

- [insert_dylib](https://github.com/Tyilo/insert_dylib)
- [fishhook](https://github.com/facebook/fishhook)

## Reference

- [WeChatTweak-macOS](https://github.com/Sunnyyoung/WeChatTweak-macOS)

## License

The [Apache-2.0 License](LICENSE).


