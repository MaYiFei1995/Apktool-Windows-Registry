# Apktool-Windows-Registry

配置注册表为 APK 文件增加右键菜单组实现快捷安装与快捷反编译

***

## 效果
![效果图](./imgs/1.png)
---

## 功能
全部功能参照 [main.reg](./regs/main.reg)

已实现
- [adb install -r / -t](./regs/AdbHelper.reg)（*需要在环境变量中配置adb*）
- [使用 jarsigner 重签名](./regs/AdbHelper.reg)（*需要修改签名文件信息*）
- [使用 ApkSigner 进行v1&v2重签名](./regs/ApkSigner.reg)（*需要修改签名文件信息*）
- [导出 apk 的 AndroidManifest.xml](./regs/Manifest.reg)（*需要在环境变量中配置`ApkAnalyzer`，并为`ApkAnalyzer`配置[启动脚本](./regs/ApkAnalyzer.cmd)修改`APP_HOME`*）
- [apktool d / b](./regs/Apktool.reg)(*脚本中写的`apktool`是相对路径，根据需要修改*)
- [d2j 相关命令 & smali/baksmali](./regs/D2J.reg)(*脚本中的各个jar为绝对路径，根据需要修改*)

待实现
- dex 2 jarDex (*需要cd到路径操作文件，否则生成的jardex会包含完整目录*)

---

# Todo
1. 只为 apk 文件注册右键菜单组（**目前除了`apktool b`和`smali2dex`指定了`Floder`，其它都是`*`，配置`.apk`没有效果，还需要查资料**）
2. 配置命令执行 python 脚本对重签名的文件名进行优化（**目前生成的文件名都是原文件名后增加，通过 python 解析文件名输出更友好**）