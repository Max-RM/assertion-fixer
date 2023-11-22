@echo off

@echo off
set "folder=%APPDATA%\MinecraftPE_Netease\minecraftpe\"
set "file=%folder%options.txt"
set "line1=dev_assertions_debug_break:1"
set "line2=dev_assertions_debug_break:0"
set "line3=dev_assertions_show_dialog:1"
set "line4=dev_assertions_show_dialog:0"

if not exist "%folder%" (
  mkdir "%folder%"
  echo dev_assertions_debug_break:0>>"%file%"
  echo dev_assertions_show_dialog:0>>"%file%"
) else (
  if not exist "%file%" (
    echo dev_assertions_debug_break:0>>"%file%"
    echo dev_assertions_show_dialog:0>>"%file%"
  ) else (
    findstr /c:"%line1%" "%file%" >nul
    if %errorlevel% equ 0 (
      type "%file%" | findstr /v "%line1%" >"%file%.tmp"
      echo %line2%>>"%file%.tmp"
      move /y "%file%.tmp" "%file%" >nul
    )

    findstr /c:"%line3%" "%file%" >nul
    if %errorlevel% equ 0 (
      type "%file%" | findstr /v "%line3%" >"%file%.tmp"
      echo %line4%>>"%file%.tmp"
      move /y "%file%.tmp" "%file%" >nul
    )

    findstr /c:"%line2%" "%file%" >nul
    if not %errorlevel% equ 0 (
      echo %line2%>>"%file%"
    )

    findstr /c:"%line4%" "%file%" >nul
    if not %errorlevel% equ 0 (
      echo %line4%>>"%file%"
    )
  )
)

rem Этот скрипт создал MaxRM с использованием ChatGPT 29.08.2023