@echo off
title DoughForge Dongle
cd /d "%~dp0"
echo.
echo   DoughForge -- The Great Withholding
echo   Starting local server...
echo.
python tools\serve_local.py
if errorlevel 1 (
  echo.
  echo Python not found. Trying python3...
  python3 tools\serve_local.py
)
pause
