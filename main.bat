@ECHO OFF
set font_zip=https://github.com/subframe7536/Maple-font/releases/download/v6.0/MapleMono-SC-NF.zip
set template_zip=https://github.com/lxgw/advanced-cjk-font-magisk-module-template/releases/download/v3.3.220605/FontTemplateA-Magisk204.zip
::checking
ECHO Time:%date%
ECHO Checking the required folder...
if not exist output\ ( mkdir output\ ) else ( del /F /S /Q output\ & rmdir /S /Q output\ & mkdir output\ )
if exist Maple-font-Magisk-Module.zip del /F /S /Q Maple-font-Magisk-Module.zip
if exist fonts\ del /F /S /Q fonts\ & rmdir /S /Q fonts\
::integrating files
ECHO.
wget.exe -O "font.zip" %font_zip%
wget.exe -O "Template.zip" %template_zip%
7z.exe e font.zip SC-NF\*.ttf -r -o.\fonts
7z.exe x Template.zip -r -o.\output
xcopy fonts\*.ttf output\system\fonts /E /Q /C /Y

ren output\system\fonts\MapleMono-SC-NF-Light.ttf fontchw3.ttf
ren output\system\fonts\MapleMono-SC-NF-Regular.ttf fontchw4.ttf
ren output\system\fonts\MapleMono-SC-NF-Bold.ttf fontchw5.ttf

del output\system\fonts\MapleMono-SC-NF-LightItalic.ttf
del output\system\fonts\MapleMono-SC-NF-Italic.ttf
del output\system\fonts\MapleMono-SC-NF-BoldItalic.ttf

del /F /S /Q output\module.prop
xcopy module.prop output\
ECHO.
ECHO Compressing the generated files...
7z.exe a Maple-font-Magisk-Module.zip .\output\*
::done
ECHO.
ECHO End of script running.
