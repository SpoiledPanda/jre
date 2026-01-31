@echo off
setlocal enabledelayedexpansion
REM CTB Recorder Launcher Script
REM Launches the CTB Recorder application with bundled JRE and required JavaFX modules

REM Set the directory where this script is located as the base directory
set SCRIPT_DIR=%~dp0
cd /d "%SCRIPT_DIR%"

REM Java executable from bundled JRE
set JAVA_EXE=bin\java.exe

REM JVM arguments
REM Default memory: 4GB (can be overridden with CTBREC_MEMORY environment variable)
if not defined CTBREC_MEMORY set CTBREC_MEMORY=4g
set JVM_ARGS=-Xmx%CTBREC_MEMORY% -Dctbrec.config.dir=./config -Dfile.encoding=utf-8

REM JavaFX module configuration
set JAVAFX_MODULES=--add-modules javafx.controls,javafx.media,javafx.swing
set JAVAFX_OPENS=--add-opens javafx.controls/com.sun.javafx.scene.control.behavior=ALL-UNNAMED

REM Try to find the JAR file - check for both versioned and snapshot builds
REM First check for specific versioned JARs in root directory
set JAR_FILE=
set JAR_COUNT=0

REM Check if any ctbrec-*.jar files exist in root
for %%f in (ctbrec-*.jar) do (
    set /a JAR_COUNT+=1
    set JAR_FILE=%%f
    set LAST_JAR=%%f
)

REM Warn if multiple JARs found (uses last one alphabetically)
if !JAR_COUNT! gtr 1 (
    echo WARNING: Multiple ctbrec JAR files found in root directory.
    echo Using last alphabetically: !LAST_JAR!
    echo To use a specific version, delete other JAR files or specify the JAR directly.
    echo.
)

REM If no JAR in root, check target directory for built artifacts
if not defined JAR_FILE (
    if exist "target\ctbrec-1.0-SNAPSHOT-shaded.jar" (
        set JAR_FILE=target\ctbrec-1.0-SNAPSHOT-shaded.jar
    ) else if exist "target\ctbrec-1.0-SNAPSHOT.jar" (
        set JAR_FILE=target\ctbrec-1.0-SNAPSHOT.jar
    )
)

REM Final check - exit with error if no JAR found
if not defined JAR_FILE (
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
