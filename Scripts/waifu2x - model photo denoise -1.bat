@echo off
cd /d "%~dp0"
::-n  denoise level (-1/0/1/2/3, default=0) -1 = none
set denoise=-1
::fomat png/webp
set fomat=png
::set waifu2x exe path
set model_type=upconv_7_photo
::cunet
::upconv_7_anime_style_art_rgb
::upconv_7_photo

set model=..\models-%model_type%
set waifu2x=..\waifu2x-ncnn-vulkan.exe
if [%1]==[] (
	echo waifu2x - no input image - Drag image/s on to shortcut to upscale, supports jpg/png/webp
	pause
	goto :eof
)
echo waifu2x - model %model_type% - denoise level %denoise%
echo(
:loop
start /wait /B %waifu2x% -i %1 -o "%~dpn1 2x_%model_type%_n%denoise%.%fomat%" -n %denoise% -m %model%
shift
if not [%1]==[] goto loop
pause