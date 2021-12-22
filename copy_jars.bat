@echo off
chcp 65001
echo 当前编码格式为UTF-8
echo=

title=拷贝jar包到指定目录

setlocal EnableDelayedExpansion

::配置jar文件所在目录和目标目录
set srcDir=C:\Workspaces\IdeaProjects\cloud
set trgDir=D:\MyDocuments\TempJars

if exist "%srcDir%" (
    echo 源目录为 %srcDir%
) else (
    echo 错误！源目录 %srcDir% 不存在！
    goto :ExitProgram
)
echo=
if exist "%trgDir%" (
    echo 目标目录为 %trgDir%
) else (
    echo 错误！目标目录 %trgDir% 不存在！
    goto :ExitProgram
)
echo=

::包含的模块目录
set includedDirs=cloud-agent cloud-cache cloud-dashboard cloud-iso9660-writer cloud-jpa cloud-openapi cloud-rest cloud-sabre
set subDir=build\libs
set ext=.jar
set excludedKeyword=-sources
set /a startPos=-12
set /a endPos=-4
set /a count=0

for %%d in (%includedDirs%) do (
    for %%f in ("%srcDir%\%%d\%subDir%\*%ext%") do (
        set filePath=%%f
        set keyword=!filePath:~%startPos%,%endPos%!
        if /i not "!keyword!"=="%excludedKeyword%" (
            set /p="拷贝 !filePath!"<nul
            copy "!filePath!" "%trgDir%"
            set /a count+=1
        )
    )
)

echo=
echo %count% 个文件已拷贝完成！

:ExitProgram
echo=
echo 请按任意键退出。
pause>nul
exit