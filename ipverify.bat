for /f "delims=: tokens=2" %%a in ('ipconfig ^| findstr /R /C:"IPv4 Address"') do set ip=%%a

set ip=%ip: =%

echo %ip%

@echo off
for /f "tokens=1-4 delims=. " %%a in ("%ip%") do (
set octetA=%%a
set octetB=%%b
set octetC=%%c
set octetD=%%d
)

echo %octetA%
echo %octetB%
echo %octetC%
echo %octetD%

set num=240

echo %num%

if %octetD% == %num% ( echo This Server is already migrated to Windows 2008 Server, Hence aborting the Job
pause
exit 1) else ( echo This Server is in Windows 2003 Server, hence proceeding with migration)
pause
