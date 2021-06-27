@echo off
for /r %%a in (*.LUA) do (
	lua4.exe "%%a"
)
echo --------FINISEHD--------
pause