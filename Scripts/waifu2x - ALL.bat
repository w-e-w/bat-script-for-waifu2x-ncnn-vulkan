@echo off
cd /d "%~dp0"
::-n  denoise level (-1/0/1/2/3, default=0) -1 = none
::set denoise=-1
::fomat png/webp
set fomat=png
::set waifu2x exe path
::set model_type=cunet
::cunet
::upconv_7_anime_style_art_rgb
::upconv_7_photo

::set model=..\models-%model_type%
set waifu2x=..\waifu2x-ncnn-vulkan.exe
if [%1]==[] (
	echo waifu2x - no input image - Drag image/s on to shortcut to upscale, supports jpg/png/webp
	pause
	goto :eof
)
echo waifu2x - model All - denoise level All
echo(
:loop
start /wait /B %waifu2x% -i %1 -o "%~dpn1 2x_cunet_n-1 .%fomat%" -n -1 -m ..\models-cunet
start /wait /B %waifu2x% -i %1 -o "%~dpn1 2x_cunet_n0.%fomat%" -n 0 -m ..\models-cunet
start /wait /B %waifu2x% -i %1 -o "%~dpn1 2x_cunet_n1.%fomat%" -n 1 -m ..\models-cunet
start /wait /B %waifu2x% -i %1 -o "%~dpn1 2x_cunet_n2.%fomat%" -n 2 -m ..\models-cunet
start /wait /B %waifu2x% -i %1 -o "%~dpn1 2x_cunet_n3.%fomat%" -n 3 -m ..\models-cunet
start /wait /B %waifu2x% -i %1 -o "%~dpn1 2x_upconv_7_anime_style_art_rgb_n-1 .%fomat%" -n -1 -m ..\models-upconv_7_anime_style_art_rgb
start /wait /B %waifu2x% -i %1 -o "%~dpn1 2x_upconv_7_anime_style_art_rgb_n0.%fomat%" -n 0 -m ..\models-upconv_7_anime_style_art_rgb
start /wait /B %waifu2x% -i %1 -o "%~dpn1 2x_upconv_7_anime_style_art_rgb_n1.%fomat%" -n 1 -m ..\models-upconv_7_anime_style_art_rgb
start /wait /B %waifu2x% -i %1 -o "%~dpn1 2x_upconv_7_anime_style_art_rgb_n2.%fomat%" -n 2 -m ..\models-upconv_7_anime_style_art_rgb
start /wait /B %waifu2x% -i %1 -o "%~dpn1 2x_upconv_7_anime_style_art_rgb3.%fomat%" -n 3 -m ..\models-upconv_7_anime_style_art_rgb
start /wait /B %waifu2x% -i %1 -o "%~dpn1 2x_upconv_7_photo_n-1.%fomat%" -n -1 -m ..\models-upconv_7_photo
start /wait /B %waifu2x% -i %1 -o "%~dpn1 2x_upconv_7_photo_n0.%fomat%" -n 0 -m ..\models-upconv_7_photo
start /wait /B %waifu2x% -i %1 -o "%~dpn1 2x_upconv_7_photo_n1.%fomat%" -n 1 -m ..\models-upconv_7_photo
start /wait /B %waifu2x% -i %1 -o "%~dpn1 2x_upconv_7_photo_n2.%fomat%" -n 2 -m ..\models-upconv_7_photo
start /wait /B %waifu2x% -i %1 -o "%~dpn1 2x_upconv_7_photo_n3.%fomat%" -n 3 -m ..\models-upconv_7_photo
shift
if not [%1]==[] goto loop
pause