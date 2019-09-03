# Clash for Magisk

A rule-based tunnel in Go. This module is wrapper for [clash](https://github.com/Dreamacro/clash) 

[中文说明](README_zh.md)

## Requirements

* arm64 ABI

## Feature

See also https://github.com/Dreamacro/clash  

## License

See also [NOTICE](NOTICE) and [LICENSE](LICENSE)

## Configure

Data Path  `{InternalStorage}/Android/data/com.github.kr328.clash`

In data directory

* Clash configure file `config.yaml`
* Clash GEOIP database `Country.mmdb`
* Clash starter configure file `starter.yaml`
* Clash status file `RUNNING` or `STOPPED`
* Custom proxy mode directory `mode.d`



## Control

Data Path  `{InternalStorage}/Android/data/com.github.kr328.clash`

Create the following file to control clash

* `START` - Start clash if stopped
* `STOP` - Stop clash if running
* `RESTART` - Restart clash 



## Read logs

* On PC

  Run command

  `adb logcat -s Clash`

* On Android

  Run command

  `logcat -s Clash`



## Source

See also https://github.com/Kr328/ClashForMagisk
