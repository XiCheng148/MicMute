# MicMute

MicMute 是一个轻量级的 Windows 系统托盘工具，用于快速切换麦克风状态（静音/取消静音）。

## 背景
开黑的时候有时候不得不外放，但又不希望影响到其他人，所以就想到了这么一个工具。

## ✨ 特性

- 🎯 系统托盘图标直观显示麦克风状态
- ⌨️ 全局快捷键支持（默认 Ctrl+Alt+M）
- 🖱️ 双击托盘图标快速切换
- 🔔 切换时播放系统提示音
- ⚙️ 支持自定义麦克风设备

## 🚀 使用方法
### 方法一

1. 请先安装 [AutoHotKeyV2](http://www.autohotkey.com/)。
2. 下载 `MicMute.ahk` 文件和icons文件夹，并放入到你的程序目录下。
3. 运行 `MicMute.ahk` 。
4. 使用 `Ctrl + Alt + M` 切换麦克风状态。

### 方法二

1. 前往 [Release](https://github.com/XiCheng148/MicMute/releases) 下载最新版本的 `MicMute.exe`。

### 切换方式
- 使用快捷键 `Ctrl + Alt + M`
- 双击系统托盘图标

## 📁 目录结构
期望工作目录结构如下：不然可能会有图标丢失的情况，当然也使用了系统图标兜底（报看👁️）。
```
MicMute/                             # 程序目录
├── icons/                            # 图标文件夹
│   └── unMuted.ico                   # 麦克风关闭时的图标
│   └── isMuted.ico                   # 麦克风开启时的图标
├── config.ini                        # 配置文件
└── MicMute.exe or MicMute.ahk      # 脚本文件
```

## ⚙️ 配置

配置文件 `config.ini` 将自动在程序目录下创建，包含以下设置：
- 麦克风设备名称

## 🛠️ 开发环境

- AutoHotkey v2
- Windows 10/11

## 📥 下载

从 [Releases](https://github.com/XiCheng148/MicMute/releases) 页面下载最新版本。

## 🤝 贡献

欢迎提交 Issues 和 Pull Requests！

## 📄 许可证

[MIT License](LICENSE)

