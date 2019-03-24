setlocal enabledelayedexpansion
cd
for /R %%A IN (*.mp4,*.wmv,*.avi;*.mpeg;*.mpg;*.mkv;*.mov;*.m4v) DO (
	ffmpeg.exe -i "%%A" -f ffmetadata "%%Ameta.txt"
	ffmpeg.exe -i "%%A" -f ffmetadata -i "%%Ameta.txt" -c:v libx265 -preset medium -x265-params crf=28 -c:a aac -strict experimental -b:a 128k "%%A.h265.mp4"
	del "%%Ameta.txt"
)
pause