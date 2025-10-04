@echo off
REM Minimal gradlew.bat placeholder
SET DIR=%~dp0
IF EXIST "%DIR%gradle\wrapper\gradle-wrapper.jar" (
  java -jar "%DIR%gradle\wrapper\gradle-wrapper.jar" %*
) ELSE (
  echo gradle-wrapper.jar not found. Trying system gradle...
  gradle %*
)
