# JRE Distribution

This directory contains a packaged Java Runtime Environment (JRE) for running Java applications. It includes the Java runtime, JavaFX libraries, and required configuration files.

## Quick Start

### Check Java Version

**Windows (CMD):**

```cmd
release\bin\java -version
```

**Windows (Git Bash):**

```bash
release/bin/java -version
```

**Linux/macOS:**

```bash
release/bin/java -version
```

### Run a JAR File

**Windows (CMD):**

```cmd
release\bin\java -jar path\to\your-application.jar
```

**Windows (Git Bash):**

```bash
release/bin/java -jar path/to/your-application.jar
```

Minimal invocation is sufficient to start most applications. For CTB Recorder the distribution includes recommended JVM flags and module options; use the bundled launcher (`ctbrec.bat`) or run the example below from the product root so `./config` resolves correctly:

**Windows (CMD):**

```cmd
rem Minimal (starts the app)
release\bin\java -jar path\to\your-application.jar

rem Shaded artifact (built by Maven Shade plugin)
"release\bin\java.exe" -jar "target\ctbrec-1.0-SNAPSHOT-shaded.jar"

rem Shaded artifact with explicit JavaFX modules (if runtime lacks JavaFX)
"release\bin\java.exe" --module-path "lib\javafx-sdk\lib" --add-modules=javafx.controls,javafx.fxml -jar "target\ctbrec-1.0-SNAPSHOT-shaded.jar"

rem Recommended (CTB Recorder example with JVM args and JavaFX modules)
jre\bin\java -Xmx4g -Dctbrec.config.dir=./config -Dfile.encoding=utf-8 ^
  --add-modules javafx.controls,javafx.media,javafx.swing ^
  --add-opens javafx.controls/com.sun.javafx.scene.control.behavior=ALL-UNNAMED ^
  -jar ctbrec-25.11.2.jar
```

**Windows (Git Bash):**

```bash
# Minimal (starts the app)
release/bin/java -jar path/to/your-application.jar

# Shaded artifact (built by Maven Shade plugin)
release/bin/java.exe -jar target/ctbrec-1.0-SNAPSHOT-shaded.jar

# Shaded artifact with explicit JavaFX modules (if runtime lacks JavaFX)
release/bin/java.exe --module-path "lib/javafx-sdk/lib" --add-modules=javafx.controls,javafx.fxml -jar target/ctbrec-1.0-SNAPSHOT-shaded.jar

# Recommended (CTB Recorder example with JVM args and JavaFX modules)
jre/bin/java -Xmx4g -Dctbrec.config.dir=./config -Dfile.encoding=utf-8 \
  --add-modules javafx.controls,javafx.media,javafx.swing \
  --add-opens javafx.controls/com.sun.javafx.scene.control.behavior=ALL-UNNAMED \
  -jar ctbrec-25.11.2.jar
```

### Run a Java Class

**Windows (CMD):**

```cmd
release\bin\java -cp lib\your-app.jar com.example.MainClass
```

**Windows (Git Bash):**

```bash
release/bin/java -cp lib/your-app.jar com.example.MainClass
```

**Linux/macOS:**

```bash
release/bin/java -cp lib/your-app.jar com.example.MainClass
```

## Directory Structure

- **`release/bin/`** — Java executables and launcher scripts
- **`lib/`** — Core Java modules, JavaFX properties, and runtime libraries
  - `lib/modules` — Combined module image (core Java + JavaFX modules)
- **`conf/`** — Runtime configuration files
  - `logging.properties` — Java logging configuration
  - `security/` — Security policies and settings
- **`legal/`** — License files for each module (Java, JavaFX, third-party components)

## Configuration

### Logging

Edit `conf/logging.properties` to customize Java logging behavior.

### Security

Security policies are defined in `conf/security/java.policy` and `conf/security/java.security`.

### System Properties

Additional runtime properties can be found in:

- `lib/javafx.properties` — JavaFX-specific settings
- `conf/net.properties` — Networking configuration
- `conf/sound.properties` — Audio system settings

## Notes

- This is a **runtime distribution** — it does not include source code or build tools.
- Module licensing information is available in the `legal/` directory for each module.

## Troubleshooting

- Missing JavaFX / application fails to start: use the bundled `release/bin/java` or `jre/bin/java` from this distribution. If you run a system JDK, ensure JavaFX modules are available or add `--add-modules` as shown in the CTB Recorder example.
- Config not found / wrong `config` path: run from the product root or set `-Dctbrec.config.dir=absolute\path\to\config`.
- FFmpeg errors during merging/post-processing: verify `lib/ffmpeg/` contains an executable and that the binary is compatible with your OS/arch. Logs for FFmpeg are written to the recording segments directory (look for `merge.log`).
- Electron/minimal browser login failures: the minimal browser listens on TCP port `3202`; ensure nothing else blocks that port and cookies are persisted in `config/<version>/cookies-<site>.json`.
- Cloudflare / protected pages: optional `flaresolverr` service can help; configure `flaresolverr.apiUrl` in `settings.json`.

## CTB Recorder Command Examples

**Windows CMD** (multi-line with `^` line continuation):

```cmd
jre\bin\java -Xmx4g -Dctbrec.config.dir=./config -Dfile.encoding=utf-8 ^
  --add-modules javafx.controls,javafx.media,javafx.swing ^
  --add-opens javafx.controls/com.sun.javafx.scene.control.behavior=ALL-UNNAMED ^
  -jar ctbrec-25.11.2.jar
```

**Windows CMD** (single-line):

```cmd
jre\bin\java -Xmx4g -Dctbrec.config.dir=./config -Dfile.encoding=utf-8 --add-modules javafx.controls,javafx.media,javafx.swing --add-opens javafx.controls/com.sun.javafx.scene.control.behavior=ALL-UNNAMED -jar ctbrec-25.11.2.jar
```

**Windows PowerShell** (use backtick ` as line-continuation):

```powershell
jre\bin\java -Xmx4g -Dctbrec.config.dir=./config -Dfile.encoding=utf-8 `
  --add-modules javafx.controls,javafx.media,javafx.swing `
  --add-opens javafx.controls/com.sun.javafx.scene.control.behavior=ALL-UNNAMED `
  -jar ctbrec-25.11.2.jar
```

**Windows Git Bash / Linux / macOS** (use backslash `\` as line-continuation):

```bash
jre/bin/java -Xmx4g -Dctbrec.config.dir=./config -Dfile.encoding=utf-8 \
  --add-modules javafx.controls,javafx.media,javafx.swing \
  --add-opens javafx.controls/com.sun.javafx.scene.control.behavior=ALL-UNNAMED \
  -jar ctbrec-25.11.2.jar
```

## Platform Support

This JRE distribution is pre-built for the target platform. Ensure you're using the correct distribution for your operating system and architecture.
