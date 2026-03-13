# AstroNvim Cheatsheet for Java Development

Leader key: `Space`  
Local leader: `,`

## First Launch

On first launch, AstroNvim will auto-install all plugins and LSP servers.
Run `:Lazy sync` if anything gets stuck. Run `:Mason` to verify tools installed.

**Prerequisite**: JDK 17+ must be installed (`java --version`).

---

## General Navigation

| Key            | Action                        |
|----------------|-------------------------------|
| `Space`        | Leader key (opens which-key)  |
| `Space f f`    | Find files (Telescope)        |
| `Space f w`    | Find word (live grep)         |
| `Space f b`    | Find buffers                  |
| `Space f h`    | Find help tags                |
| `Space f o`    | Find recent files             |
| `Space f n`    | Find notifications            |

## File Explorer (Neo-tree)

| Key            | Action                        |
|----------------|-------------------------------|
| `Space e`      | Toggle file explorer          |
| `Space o`      | Focus file explorer           |
| `a`            | Create file/directory         |
| `d`            | Delete file                   |
| `r`            | Rename file                   |
| `y`            | Copy file                     |
| `x`            | Cut file                      |
| `p`            | Paste file                    |

## Buffers & Tabs

| Key            | Action                        |
|----------------|-------------------------------|
| `]b`           | Next buffer                   |
| `[b`           | Previous buffer               |
| `Space b d`    | Pick buffer to close          |
| `Space b c`    | Close all buffers except current |
| `Space b b`    | Pick buffer from tabline      |

## Windows

| Key            | Action                        |
|----------------|-------------------------------|
| `Ctrl-h/j/k/l`| Navigate between windows      |
| `Space \|`     | Vertical split                |
| `Space -`      | Horizontal split              |

## LSP (Language Server) - Java

| Key            | Action                        |
|----------------|-------------------------------|
| `K`            | Hover documentation           |
| `gd`           | Go to definition              |
| `gD`           | Go to declaration             |
| `gr`           | Go to references              |
| `gi`           | Go to implementation          |
| `gy`           | Go to type definition         |
| `Space l a`    | Code actions                  |
| `Space l r`    | Rename symbol                 |
| `Space l f`    | Format file                   |
| `Space l d`    | Hover diagnostics             |
| `Space l D`    | Search diagnostics            |
| `Space l s`    | Document symbols              |
| `Space l S`    | Workspace symbols             |
| `]d`           | Next diagnostic               |
| `[d`           | Previous diagnostic           |

## Java-Specific (nvim-jdtls)

| Key            | Action                        |
|----------------|-------------------------------|
| `Space l a`    | Code actions (organize imports, generate methods, etc.) |
| `:JdtCompile`  | Compile Java project          |
| `:JdtUpdateConfig` | Update project config     |
| `:JdtBytecode` | View bytecode                 |
| `:JdtJol`      | View object layout            |
| `:JdtJshell`   | Open JShell                   |

## Debugging (DAP)

| Key            | Action                        |
|----------------|-------------------------------|
| `Space d b`    | Toggle breakpoint             |
| `Space d B`    | Set conditional breakpoint    |
| `Space d c`    | Start/continue debugging      |
| `Space d i`    | Step into                     |
| `Space d o`    | Step over                     |
| `Space d O`    | Step out                      |
| `Space d q`    | Close debugger                |
| `Space d Q`    | Terminate debugger            |
| `Space d r`    | Restart debugger              |
| `Space d p`    | Pause debugger                |
| `Space d E`    | Evaluate expression           |
| `Space d u`    | Toggle debugger UI            |
| `Space d h`    | Debugger hover (in visual mode too) |

## Git

| Key            | Action                        |
|----------------|-------------------------------|
| `Space g g`    | Open lazygit                  |
| `Space g b`    | Git blame line                |
| `Space g B`    | Git browse (open in browser)  |
| `Space g d`    | View git diff                 |
| `]g`           | Next git hunk                 |
| `[g`           | Previous git hunk             |
| `Space g s`    | Stage git hunk                |
| `Space g r`    | Reset git hunk                |

## Terminal

| Key            | Action                        |
|----------------|-------------------------------|
| `Space t f`    | Toggle floating terminal      |
| `Space t h`    | Toggle horizontal terminal    |
| `Space t v`    | Toggle vertical terminal      |
| `F7`           | Toggle terminal               |

## Editing

| Key            | Action                        |
|----------------|-------------------------------|
| `gcc`          | Toggle line comment           |
| `gc` (visual)  | Toggle comment on selection   |
| `Ctrl-Space`   | Trigger completion            |
| `Tab / S-Tab`  | Navigate completion items     |
| `Enter`        | Confirm completion            |
| `Space u w`    | Toggle word wrap              |
| `Space u n`    | Toggle line numbers           |
| `Space u r`    | Toggle relative numbers       |
| `Space u d`    | Toggle diagnostics            |

## Session & Package Management

| Key            | Action                        |
|----------------|-------------------------------|
| `Space p a`    | AstroNvim package updates     |
| `Space p i`    | Lazy plugin install           |
| `Space p m`    | Mason package manager         |
| `Space p s`    | Lazy sync                     |
| `Space p u`    | Lazy update                   |
| `Space S l`    | Load last session             |
| `Space S s`    | Save session                  |
| `Space S d`    | Delete session                |
| `Space S f`    | Find sessions                 |

## Quick Reference: Vim Essentials

| Key            | Action                        |
|----------------|-------------------------------|
| `i / a`        | Insert mode (before/after)    |
| `o / O`        | New line below/above          |
| `v / V`        | Visual mode (char/line)       |
| `Esc`          | Normal mode                   |
| `dd`           | Delete line                   |
| `yy`           | Yank (copy) line              |
| `p / P`        | Paste after/before            |
| `u`            | Undo                          |
| `Ctrl-r`       | Redo                          |
| `/pattern`     | Search forward                |
| `n / N`        | Next/previous search result   |
| `:%s/old/new/g`| Find and replace in file      |
| `gg / G`       | Go to top/bottom of file      |
| `Ctrl-d / Ctrl-u` | Half-page down/up          |
| `:w`           | Save                          |
| `:q`           | Quit                          |
| `:wq`          | Save and quit                 |
| `ZZ`           | Save and quit (shortcut)      |

---

## Java Workflow Tips

1. **Open a project**: `nvim .` from your project root (must have `pom.xml`, `build.gradle`, or `.git`)
2. **Wait for JDTLS**: The Java language server takes a moment to initialize on first open
3. **Organize imports**: Use `Space l a` and select "Organize imports"
4. **Generate code**: Use `Space l a` for getters/setters, constructors, toString, etc.
5. **Run tests**: Set a breakpoint with `Space d b`, then debug with `Space d c`
6. **Build**: Use the terminal (`Space t f`) to run `mvn` or `gradle` commands
