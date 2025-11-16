## Purpose

This file gives focused, actionable guidance for AI coding agents working in this workspace (a packaged JRE/runtime tree). It highlights the "big picture", key files and directories, useful quick checks, and project-specific patterns discovered from the code layout.

## Big picture

- This repository is a packaged Java Runtime Environment (JRE) layout rather than an application source tree. Top-level layout includes `release/`, many `java.*` and `javafx.*` module directories, and `lib/` containing `modules` and configuration/properties.
- Primary runtime entrypoints live under `release/bin/` (platform-specific java executables). Configuration lives under `conf/` and `security/`.

## Key directories & files (what to read first)

- `release/bin/` — platform launch scripts/executables (use to run the runtime for quick checks).
- `lib/modules` — combined module image used by the runtime.
- `conf/` — runtime configuration: `logging.properties`, `jaxp.properties`, `net.properties`, `sound.properties`.
- `<module>/` directories (e.g. `java.base/`, `java.desktop/`, `java.xml/`) — each module includes license/ASSEMBLY files; they explain shipped components.
- `security/` and `policy/` — default security policy files (e.g. `java.policy`, `java.security`) — important when embedding or hardening the JRE.

## What this means for an AI agent

- Treat this workspace as a binary/runtime artifact tree. Most modifications are configuration or small binary/packaging changes rather than traditional source edits.
- Do not search for `pom.xml` / `build.gradle` / `Makefile` — none are present here; there is no build system to run inside this folder.

## Common developer tasks & example commands (Windows `cmd.exe`)

- Quick runtime check (print java version from this tree):

```
release\bin\java -version
```

- Run a simple class (if adding small test jars into `lib/`):

```
release\bin\java -cp lib\mytest.jar com.example.Main
```

Note: use backslashes on Windows and run these from the workspace root or use absolute paths.

## Project-specific conventions and patterns

- Module-per-directory: JDK modules are stored in one directory per module and include licensing files (`LICENSE`, `ASSEMBLY_EXCEPTION`, `ADDITIONAL_LICENSE_INFO`). Preserve these files when updating modules.
- Per-module documentation is authoritative for shipped behavior (look at `java.xml/` and `java.base/` for core behavior notes).
- Configuration-first edits: Many runtime changes are configuration-only (edit `conf/` or `security/` rather than changing binaries).

## Integration points & cross-component notes

- Consumers embed this JRE by copying the entire tree. Any automated patch should preserve relative paths and executable bit semantics (on non-Windows hosts).
- `conf/logging.properties` and `security/*` are common integration touchpoints; updates here affect all JVMs started from this tree.

## What to avoid or verify

- Avoid attempting to "build" the JRE here — there are no build scripts. If a rebuild is required, consult upstream build artifacts or maintainers.
- When editing configuration, validate by running `release\bin\java -jar` against a small test harness.

## Useful files to reference in code suggestions

- `release/bin/` — how the runtime is launched.
- `conf/logging.properties` — logging defaults to respect.
- `lib/modules` — what modules are included.
- `security/java.policy` and `policy/` — default security grant surfaces.

## If you need more context

- There are many license/README-like files inside `java.*` module folders. If a suggested change affects a module, include a note referencing the module folder and any `LICENSE`/`ASSEMBLY_EXCEPTION` files.

---

If any of these points are incomplete or you'd like me to add short examples for editing `conf/` or patching a module directory, tell me which area to expand and I'll update this file.
