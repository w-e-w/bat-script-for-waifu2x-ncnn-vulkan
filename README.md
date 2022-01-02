# bat-script-for-waifu2x-ncnn-vulkan
windows bat script for using waifu2x-ncnn-vulkan project https://github.com/nihui/waifu2x-ncnn-vulkan

setup:
place "Script" folder in the same directory as waifu2x-ncnn-vulkan.exe
usage:
drag image or images on the the bat script, the script will execute waifu2x-ncnn-vulkan.exe with the appropriate settings
output of image will be in the same directory as the input source image

the "waifu2x - ALL.bat" script runs all 3 models with all -1~3 denose leves.
this should output 15 images, useful for testing which model has best results.
