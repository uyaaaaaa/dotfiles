# My Neovim Config

## Requirements
- Neovim >= 0.8.0
- Git
- A Nerd Font (for icons)

## Installation
1. Install Neovim (version 0.8.0 or later)
    ```bash
    # macOS
    brew install neovim

    # Ubuntu/Debian
    sudo apt install neovim

    # Arch Linux
    sudo pacman -S neovim
    ```

1. Clone this repository to `~/.config/nvim`
    ```bash
    git clone https://github.com/uyaaaaaa/dotfiles.git ~/.config/nvim
    ```

3. Install a NerdFont(optional)
    ```bash
    # macOS
    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font

    # Linux: Download and install manually from
    # https://www.nerdfonts.com/font-downloads
    ```

4. Start Neovim and wait for the plugins to be installed
    ```bash
    nvim .
    ```

## Keybindings

### General
| Keybind | Description |
|---------|-------------|
| `<Space>` | Leader key |
| `jk` | Exit insert mode |
| `<C-h>` | Move to left window |
| `<C-j>` | Move to window below |
| `<C-k>` | Move to window above |
| `<C-l>` | Move to right window |
| `ss` | Split window horizontally |
| `sv` | Split window vertically |

### File Navigation
| Keybind | Description |
|---------|-------------|
| `<leader>e` | Toggle file explorer |
| `<C-p>` | Find files |
| `ff` | Live grep |

### Code
| Keybind | Description |
|---------|-------------|
| `gd` | Go to definition |
| `gr` | Show references |
| `<leader><leader>` | Show hover documentation |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>f` | Format document |

### Git
| Keybind | Description |
|---------|-------------|
| `gs` | Git add |
| `g[` | Next git change |
| `g]` | Previous git change |

### Terminal
| Keybind | Description |
|---------|-------------|
| `<C-t>` | Toggle terminal |
| `<leader>q` | Exit terminal mode |

### Tabs/Buffers
| Keybind | Description |
|---------|-------------|
| `<leader>w` | Close current buffer |

Note:
- `<leader>` represents the Space key
- `<C-x>` represents Ctrl + x
- `<S-x>` represents Shift + x
- `<D-x>` represents Cmd + x`

## Abbreviations

The following abbreviations are configured in `/lua/abbreviations.lua`:

### Insert Mode Abbreviations

- `ymd` - Expands to current date in format YYYYMMDD
- `ymd-` - Expands to current date in format YYYY-MM-DD

### Command Mode Abbreviations

- `w]` - Smartly converts to `w` command when typed exactly as "w]"
- `w` - In visual mode, prevents the range prefix ('<,'>) from being added to the write command
- `s` - Automatically expands to `%s///g` with cursor positioned between the second and third slash, making global substitutions more convenient

