@echo off
setlocal

set "SCRIPT_DIR=%~dp0"
set "JAVA_EXE=%SCRIPT_DIR%bin\java.exe"
set "APP_JAR=%SCRIPT_DIR%target\ctbrec-1.0-SNAPSHOT-shaded.jar"
set "CONFIG_DIR=%SCRIPT_DIR%config"

if not exist "%JAVA_EXE%" (
  echo Error: Java runtime not found at "%JAVA_EXE%"
  exit /b 1
)

if not exist "%APP_JAR%" (
  echo Error: Application jar not found at "%APP_JAR%"
  echo Build it first with: mvn clean package
  exit /b 1
)

"%JAVA_EXE%" ^
  -Xmx4g ^
  -Dctbrec.config.dir="%CONFIG_DIR%" ^
  -Dfile.encoding=UTF-8 ^
  --add-modules javafx.controls,javafx.media,javafx.swing ^
  --add-opens javafx.controls/com.sun.javafx.scene.control.behavior=ALL-UNNAMED ^
  -jar "%APP_JAR%"

endlocal
