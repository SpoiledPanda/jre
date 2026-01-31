# GitHub Copilot Instructions for JRE Distribution Repository

## Project Overview

This repository contains a packaged Java Runtime Environment (JRE) distribution for running JavaFX applications, specifically the CTB Recorder application. It includes:
- Java 21 runtime
- JavaFX libraries (bundled in the JRE)
- Configuration files for runtime
- A minimal Maven project structure with a JavaFX stub application

## Repository Structure

```
jre/
├── .github/              # GitHub configuration including Copilot instructions
├── src/main/java/        # Java source files
│   └── ui/              # JavaFX UI components
├── conf/                # Runtime configuration (logging, security, networking)
├── lib/                 # Core Java modules and JavaFX libraries
├── legal/               # License files for modules
├── bin/                 # Java executables and launcher scripts
├── target/              # Maven build output
├── pom.xml              # Maven project configuration
└── README.md            # Project documentation
```

## Build and Test Instructions

### Prerequisites
- Java Development Kit (JDK) 21 or higher
- Maven 3.6 or higher

### Building the Project

```bash
# Clean and build the project
mvn clean package

# This produces:
# - target/ctbrec-1.0-SNAPSHOT.jar (standard JAR)
# - target/ctbrec-1.0-SNAPSHOT-shaded.jar (shaded JAR with dependencies)
```

### Running the Application

**Using the bundled JRE (recommended):**
```cmd
bin\java -Xmx4g -Dctbrec.config.dir=./config -Dfile.encoding=utf-8 --add-modules javafx.controls,javafx.media,javafx.swing --add-opens javafx.controls/com.sun.javafx.scene.control.behavior=ALL-UNNAMED -jar ctbrec-25.11.2.jar
```

**Using the shaded JAR:**
```bash
java --module-path "lib/javafx-sdk/lib" --add-modules=javafx.controls,javafx.fxml -jar target/ctbrec-1.0-SNAPSHOT-shaded.jar
```

### Testing

Currently, there is no test infrastructure in place. When adding tests:
- Place unit tests in `src/test/java/`
- Use JUnit 5 as the testing framework
- Run tests with: `mvn test`
- Maintain test coverage for critical functionality

## Coding Standards and Conventions

### Java Code Style
- **Java Version**: Target Java 21 features and syntax
- **Encoding**: Use UTF-8 for all source files
- **Naming Conventions**:
  - Classes: PascalCase (e.g., `CamrecApplication`)
  - Methods and variables: camelCase (e.g., `startApplication`)
  - Constants: UPPER_SNAKE_CASE (e.g., `MAX_BUFFER_SIZE`)
  - Packages: lowercase (e.g., `ui`, `util`)

### JavaFX Specific Guidelines
- All JavaFX UI classes should be in the `ui` package or subpackages
- Main application class should extend `javafx.application.Application`
- Use JavaFX properties for data binding where appropriate
- Follow JavaFX threading rules (UI updates on JavaFX Application Thread)
- Required JavaFX modules: `javafx.controls`, `javafx.media`, `javafx.swing`

### Maven Configuration
- Main class is defined via the `main.class` property in `pom.xml`
- JavaFX dependencies use platform-specific classifiers (win, linux, mac)
- Maven Shade plugin is used to create executable shaded JARs
- Exclude `module-info.class` and signature files when shading

### Documentation
- Add JavaDoc comments for public classes and methods
- Keep README.md updated with significant changes
- Document any new configuration requirements in README.md
- Include examples for complex command-line invocations

## Important Notes for Copilot

### What NOT to Change
- Do not modify the bundled JRE in `bin/`, `lib/`, `conf/`, or `legal/` directories
- Do not change the JavaFX module requirements without testing thoroughly
- Do not modify `.gitignore` to include build artifacts or dependencies

### When Adding Dependencies
- Update `pom.xml` dependencies section
- Ensure compatibility with Java 21
- For JavaFX dependencies, use appropriate platform classifiers
- Run `mvn clean package` to verify the build works
- Check for security vulnerabilities in new dependencies

### When Adding New Features
- Consider if the feature requires additional JavaFX modules
- Update the launch command examples in README.md if JVM args change
- Test with the bundled JRE to ensure compatibility
- Document any new system properties or configuration requirements

### Platform Considerations
- This distribution is cross-platform (Windows, Linux, macOS)
- Use platform-agnostic file paths in code (use `File.separator` or `Path` API)
- Test command-line examples work on different shells (cmd, PowerShell, bash)
- Consider platform-specific JavaFX classifiers when adding dependencies

## Error Handling and Troubleshooting

### Common Issues
- **JavaFX not found**: Ensure `--add-modules` includes required JavaFX modules
- **Config path errors**: Application expects config directory at `./config` relative to execution directory
- **Module access errors**: Use `--add-opens` for accessing internal JavaFX APIs

### When Debugging
- Enable verbose GC logging if investigating memory issues (`-Xlog:gc`)
- JavaFX provides `javafx.verbose` system property for debugging
- Check `conf/logging.properties` for Java logging configuration

## Security Considerations

- Never commit credentials or secrets to the repository
- The `.gitignore` already excludes AWS credentials (`.aws/credentials`)
- Review dependencies for known vulnerabilities before adding them
- Use the bundled JRE for consistent security updates
- Be cautious with `--add-opens` directives (they bypass module encapsulation)

## Additional Resources

- [JavaFX Documentation](https://openjfx.io/)
- [Maven Shade Plugin](https://maven.apache.org/plugins/maven-shade-plugin/)
- [Java 21 Documentation](https://docs.oracle.com/en/java/javase/21/)

---

**Last Updated**: 2026-01-31
**Java Version**: 21
**JavaFX Version**: 21.0.2
**Maven Compiler**: Source and Target 21
