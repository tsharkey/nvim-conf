## OpenCode Conventions for nvim-conf

This document outlines conventions for working with this Neovim configuration.

### Project Overview
- Language: Lua
- Plugin Manager: `lazy.nvim`
- Configuration root: `init.lua`
- Custom modules: `lua/tsharkey/`
- Plugin configurations: `lua/tsharkey/lazy/`

### Commands
- **Run/Test**: Open Neovim (`nvim`) to load and test the configuration.
- **Lint**: No dedicated lint command found. Consider using `luacheck` if desired.
- **Format**: No dedicated format command found. Consider using `stylua` with 2-space indentation if desired.

### Code Style
- **Formatting**:
    - Indentation: 2 spaces.
    - Prefer keeping lines concise.
- **Naming**:
    - Local modules & variables: `snake_case` (e.g., `lazy_init.lua`, `my_variable`).
    - Plugin configuration files (under `lua/tsharkey/lazy/`): `kebab-case.lua` or `snake_case.lua` (e.g., `autopairs.lua`, `mini-files.lua`).
- **Imports**: Use `require("module_name")`. Custom modules are under the `tsharkey` namespace (e.g., `require("tsharkey.set")`).
- **Types**: Lua is dynamically typed. No specific type annotation system is in use.
- **Error Handling**: Use standard Lua practices (e.g., `pcall`).
- **Comments**: Use `--` for single-line comments. Add comments to explain non-obvious logic.
- **Modularity**: Keep functionalities in separate files, organized under `lua/tsharkey/`.
