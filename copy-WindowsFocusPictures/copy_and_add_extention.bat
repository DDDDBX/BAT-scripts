@echo off
chcp 65001
echo 当前编码格式为UTF-8
echo=

title=拷贝Windows聚焦壁纸到指定目录

setlocal EnableDelayedExpansion

set srcDir=C:\Users\DuBao\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets
set trgDir=C:\Users\DuBao\Pictures\DesktopBackground\Assets

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

set /a count=0
for %%f in ("%srcDir%\*") do (
	set filePath=%%f
	set /p="拷贝 !filePath!"<nul
	copy "!filePath!" "%trgDir%\*.jpg"
	set /a count+=1
)

echo=
echo %count% 个文件已拷贝完成！

:ExitProgram
echo=
echo 请按任意键退出。
pause>nul
exit
