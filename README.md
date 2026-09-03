# CTB Recorder Java Runtime Distribution

This repository packages a Windows Java 21 runtime with JavaFX and a small Maven-based JavaFX launcher stub. It is intended to provide a consistent runtime for CTB Recorder artifacts, not to contain the recorder application's source code.

## Contents

- `bin\` contains the bundled Java executable and required Windows native libraries.
- `lib\` contains the Java runtime module image and JavaFX runtime assets.
- `conf\` contains Java logging, networking, sound, and security configuration.
- `legal\` contains license and notice material for bundled modules.
- `ctbrec.bat` starts a CTB Recorder JAR with the required JVM and JavaFX options.
- `src\main\java\ui\CamrecApplication.java` is a placeholder JavaFX application used to verify the Maven build.

Do not modify the bundled runtime directories (`bin\`, `lib\`, `conf\`, or `legal\`) unless intentionally updating the distribution.

## Prerequisites

- A JDK 21 or later and Maven 3.6 or later to build the placeholder application.
- Windows to run the bundled runtime in this repository. The included executable and native libraries are Windows-specific.

## Use the bundled runtime

From the repository root, confirm the bundled runtime version:

```cmd
bin\java.exe -version
```

Run any compatible JAR:

```cmd
bin\java.exe -jar path\to\application.jar
```

## Build and run the placeholder application

Build both Maven artifacts:

```cmd
mvn clean package
```

This produces:

- `target\ctbrec-1.0-SNAPSHOT.jar`
- `target\ctbrec-1.0-SNAPSHOT-shaded.jar`

Run the shaded JAR with the bundled runtime:

```cmd
bin\java.exe -jar target\ctbrec-1.0-SNAPSHOT-shaded.jar
```

The Maven build selects JavaFX native dependencies for Windows, Linux, or macOS based on the build host. That selection does not make the bundled runtime itself cross-platform.

## Launch CTB Recorder

Place a CTB Recorder JAR named `ctbrec-*.jar` in the repository root, then run:

```cmd
ctbrec.bat
```

The launcher selects the last matching root-level JAR alphabetically. If none is present, it falls back to the Maven artifacts in `target\`, preferring the shaded JAR. It starts Java with:

- `-Xmx4g` by default; set `CTBREC_MEMORY` to override it, for example `set CTBREC_MEMORY=2g`
- `-Dctbrec.config.dir=./config`
- `-Dfile.encoding=utf-8`
- the `javafx.controls`, `javafx.media`, and `javafx.swing` modules
- the JavaFX control-behavior package opened to unnamed modules

Extra arguments passed to `ctbrec.bat` are forwarded to the application.

## Configuration and licensing

Runtime configuration is read from `conf\`. In particular, edit `conf\logging.properties` for Java logging and review `conf\security\java.security` and `conf\security\java.policy` before changing security behavior. License and notice information for the bundled runtime is in `legal\`.

## Diagnostics

`diagnose-doppiocdn.bat` checks the Windows hosts file, DNS resolution, connectivity, and WinHTTP proxy settings for `img.doppiocdn.net`. Use it when that CDN is unexpectedly redirected or inaccessible.
