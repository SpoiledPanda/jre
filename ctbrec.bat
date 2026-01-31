@echo off
REM CTB Recorder Launcher Script
REM Launches the CTB Recorder application with bundled JRE and required JavaFX modules

REM Set the directory where this script is located as the base directory
set SCRIPT_DIR=%~dp0
cd /d "%SCRIPT_DIR%"

REM Java executable from bundled JRE
set JAVA_EXE=bin\java.exe

REM JVM arguments
set JVM_ARGS=-Xmx4g -Dctbrec.config.dir=./config -Dfile.encoding=utf-8

REM JavaFX module configuration
set JAVAFX_MODULES=--add-modules javafx.controls,javafx.media,javafx.swing
set JAVAFX_OPENS=--add-opens javafx.controls/com.sun.javafx.scene.control.behavior=ALL-UNNAMED

REM Try to find the JAR file - check for both versioned and snapshot builds
if exist "ctbrec-*.jar" (
    for %%f in (ctbrec-*.jar) do set JAR_FILE=%%f
) else if exist "target\ctbrec-1.0-SNAPSHOT-shaded.jar" (
    set JAR_FILE=target\ctbrec-1.0-SNAPSHOT-shaded.jar
) else if exist "target\ctbrec-1.0-SNAPSHOT.jar" (
    set JAR_FILE=target\ctbrec-1.0-SNAPSHOT.jar
) else (
    echo ERROR: Could not find ctbrec JAR file
    echo Please ensure the application has been built or the JAR file is present
    pause
    exit /b 1
)

REM Launch the application
echo Starting CTB Recorder...
echo Using JAR: %JAR_FILE%
echo.

"%JAVA_EXE%" %JVM_ARGS% %JAVAFX_MODULES% %JAVAFX_OPENS% -jar "%JAR_FILE%" %*

REM Capture exit code
set EXIT_CODE=%ERRORLEVEL%

REM If there was an error, pause to show the message
if %EXIT_CODE% neq 0 (
    echo.
    echo Application exited with error code: %EXIT_CODE%
    pause
)

exit /b %EXIT_CODE%
