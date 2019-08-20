# Clash for Magisk

A rule-based tunnel in Go. This module is wrapper for [clash](https://github.com/Dreamacro/clash) 

[English](README.md)

## 需求

* arm64 指令集



## 功能

参见 https://github.com/Dreamacro/clash



## 配置

数据目录 `{内置存储根目录}/Android/data/com.github.kr328.clash`

数据目录包含以下文件

* Clash 配置文件 `config.yaml`
* Clash GEOIP 数据库 `Country.mmdb`
* Clash 启动器 配置文件  `starter.yaml`
* Clash 状态文件 `RUNNING` 或者 `STOPPED`



## 控制

数据目录  `{内置存储根目录}/Android/data/com.github.kr328.clash`

在数据目录创建以下文件以控制

* `START` - 启动 Clash
* `STOP` - 停止 Clash
* `RESTART` - 重新启动 clash 



## 读取日志

* 在 PC 上

  运行命令

  `adb logcat -s Clash`

* 在 Android 上

  运行命令

  `logcat -s Clash`
  



## 源码

参见 https://github.com/Kr328/ClashForMagisk



## 反馈

Telegram 群组 [Kr328 Magisk Modules](https://t.me/kr328_magisk_modules)

