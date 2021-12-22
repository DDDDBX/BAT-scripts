# copy-jars

一键批量拷贝由`Gradle`创建的项目`jar`包到指定文件夹，便于个人调试。

`DOS`批处理脚本，仅适用于Windows系统。

#### 适用的Java项目结构举例

```
cloud
|  .gradle
|  build
|  cloud-agent                     // 包含的模块目录
|  |  build
|  |  |  classes
|  |  |  generated
|  |  |  libs
|  |  |  |  xxx.jar                // 拷贝该文件
|  |  |  |  xxx-sources.jar        // 排除该文件
|  |     ...
|  |  src
|  |  |  main
|  |  |  test
|  |  ...
|  cloud-cache                     // 其他模块目录同样处理
   ...
```

项目模块较多，手动拷贝过于繁琐，因此使用Windows批处理脚本实现，一键将项目中所有模块的`jar`包拷贝到指定目录。

---

### 使用说明

修改`copy_jars.bat`中的源目录`srcDir`、目标目录`trgDir`和包含的模块目录`includedDirs`，保存后双击运行即可。

---

### 参考资料

[Windows 批处理脚本学习教程](http://docs.30c.org/dosbat/)
