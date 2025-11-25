<!-- Auto-generated: review and edit as needed -->

# Copilot / AI Agent Instructions

Purpose: concise, actionable guidance so an AI coding agent can be immediately productive in this repository.

- **Scope awareness:** This workspace currently contains a `.snapshots` area that stores AI snapshots and a `config.json` used to control inclusion/exclusion rules. Do not modify files under `.snapshots` unless explicitly asked — they are snapshots of project context used for AI interactions.

- **Key files to inspect first:**

  - `config.json` — controls included/excluded file patterns; use it to determine which files are relevant for change and which to ignore.
  - `readme.md` (project root or in subfolders) — primary human-facing project overview; extract high-level goals from here.
  - Any `*.cs`, `pom.xml`, `build.gradle`, `package.json`, or `Makefile` you find — `config.json` lists these as important included patterns.

- **Repository shape & big-picture hints (from discovered files):**

  - There is a `.snapshots` folder containing AI snapshots and a `config.json` that explicitly excludes `.snapshots`. Treat `.snapshots` as readonly context for decisions.
  - The `config.json` lists classical build manifests to look for (Maven/Gradle/.NET/npm/Python). If one of these manifests exists, prefer following the commands implied by that manifest (e.g., `dotnet`, `mvn`, `gradle`, `npm`, `pip`).

- **Agent workflow (how to be productive here):**
  1. Read `config.json` at repository root to learn what to include/exclude before searching or editing.

2.  Open top-level `readme.md` for the "why" and any explicit run/build instructions. If it has run/build commands, prefer those.
3.  Search for common build manifests (`*.csproj`, `pom.xml`, `build.gradle`, `package.json`). Use those files to infer the exact build/test commands.
4.  Do not edit `.snapshots` files. If asked to update documentation or tests, operate on source folders only.

- **Build & test guidance (discovered/derivable patterns):**

  - If you find `*.csproj` or C# test files (e.g., `NewMSTest.cs`), assume the project uses .NET tooling — run `dotnet build` and `dotnet test` from the solution or project directory.
  - Example found in snapshots: `NewMSTest.cs` (MSTest style):
    ```csharp
    using Microsoft.VisualStudio.TestTools.UnitTesting;
    [TestClass]
    public class NewMSTest { [TestMethod] public void TestMethod1() { Assert.IsTrue(true); } }
    ```
    - Guidance: If tests use MSTest (as above), prefer running `dotnet test`. If you cannot find a `.sln` or `.csproj` in the repository root, search the workspace for `*.csproj` before running tests. If none exists, ask the user where the project file lives or whether you should create one for quick verification.
  - If you find `pom.xml` / `build.gradle`, use `mvn -q -DskipTests=false test` or `./gradlew test` as appropriate.
  - If you find `package.json`, prefer `npm test` or `npm run <script>` defined in that file.
  - If you are uncertain which to run, report a short summary of detected manifests and ask before running commands that change state.

- **Project-specific conventions (from `config.json`):**

  - A wide exclusion list exists (node_modules, build artifacts, images, binaries). When gathering context, prefer textual source files and manifest files listed under `included_patterns` in `config.json`.
  - Snapshots exist to capture AI-visible context; those are not canonical source and should not be used as targets for code edits.

- **Editing / PR guidance:**

  - Preserve any existing author instructions in README or top-level docs.
  - When creating or changing code, include a short summary in PR body specifying which manifests and tests you ran locally and what changed.

- **Examples (how to ask for tasks):**

  - Good: "Add a unit test that covers X in the C# project. I found `NewMSTest.cs` and no `.csproj` — please locate the `.csproj` and add the test, then run `dotnet test` and report failures."
  - Concrete: `NewMSTest.cs` is located at `.snapshots/NewMSTest.cs`. Because it's in `.snapshots`, treat it as context only — do not directly modify the file in `.snapshots`. Instead, locate the real source file in the project tree and apply changes there.
  - Good: "There is a `pom.xml` — update the maven dependency X to version Y and run `mvn -q test` to ensure no regressions."

- **When you can't find expected files:**
  - Report exactly which manifests were found and where (paths). Ask the user whether to continue (e.g., create a new project file, or operate on a subfolder).

If any part of this guidance is unclear or you'd like the file to include specific repository conventions (naming, branch policy, CI job names), tell me what to add and I'll iterate.
