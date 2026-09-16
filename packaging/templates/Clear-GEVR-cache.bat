@echo off
setlocal
set "CACHE_ROOT=%LOCALAPPDATA%\GEVR\cache"
echo.
echo Deletes prepared ROM image cache only:
echo   %CACHE_ROOT%
echo Saves under %%LOCALAPPDATA%%\GEVR are kept. Your .z64 ROM is not touched.
echo.
set /p CONFIRM=Type YES to continue: 
if /i not "%CONFIRM%"=="YES" (
  echo Cancelled.
  exit /b 0
)
if exist "%CACHE_ROOT%" (
  rmdir /s /q "%CACHE_ROOT%"
  echo Deleted %CACHE_ROOT%. Run Start-GEVR.bat or Play-on-monitor.bat to prepare again.
) else (
  echo Cache folder not found.
)
exit /b 0
