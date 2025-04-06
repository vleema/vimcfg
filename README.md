# Minimal Vim Config for Competitive Programming in C++

Lighweight config for vim'ing AtCoder contests.

## Requirements

- Vim 8.0+ (recommended)
- clangd language server
- g++ compiler with C++20 support
- fzf (Fuzzy Finder)

## Plugins

This configuration uses Vundle for plugin management and includes the following plugins:

### Core & Utility

- **[VundleVim/Vundle.vim](https://github.com/VundleVim/Vundle.vim)**: Plugin manager for Vim
- **[vim-utils/vim-man](https://github.com/vim-utils/vim-man)**: View man pages in Vim
- **[junegunn/fzf](https://github.com/junegunn/fzf)** and **[junegunn/fzf.vim](https://github.com/junegunn/fzf.vim)**: Fuzzy finder for file navigation
- **[Raimondi/delimitMate](https://github.com/Raimondi/delimitMate)**: Auto-closes brackets, quotes, etc.

### Completion & Intelligence

- **[ycm-core/YouCompleteMe](https://github.com/ycm-core/YouCompleteMe)**: Code-completion engine
- **[ajh17/VimCompletesMe](https://github.com/ajh17/VimCompletesMe)**: Tab completion enhancement
- **[prabirshrestha/vim-lsp](https://github.com/prabirshrestha/vim-lsp)**: Language Server Protocol support
- **[prabirshrestha/async.vim](https://github.com/prabirshrestha/async.vim)**: Async functions for Vim
- **[prabirshrestha/asyncomplete.vim](https://github.com/prabirshrestha/asyncomplete.vim)**: Async completion in pure Vim script
- **[prabirshrestha/asyncomplete-lsp.vim](https://github.com/prabirshrestha/asyncomplete-lsp.vim)**: LSP source for asyncomplete.vim

### Appearance

- **[sainnhe/gruvbox-material](https://github.com/sainnhe/gruvbox-material)**: Improved Gruvbox theme with better contrast
- **[itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)**: Lightweight, configurable status line

## Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/vleema/vimcfg.git
   ```

2. **Install Vundle**

   ```bash
   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
   ```

3. **Copy the Configuration**

   ```bash
   cp vimcfg/vim/.vimrc ~/.vimrc
   ```

   - Or use `stow` from inside this project directory:

      ```bash
      stow */
      ```

4. **Install Plugins**:

   Launch vim and run:

   ```
   :PluginInstall
   ```

5. **Install YouCompleteMe**

   ```bash
   cd ~/.vim/bundle/YouCompleteMe
   python3 install.py
   ```

## Usage

### Vim

| Keybinding | Action |
| -------------- | --------------- |
| `;` | `:` |
| '<C-x>'| Exit terminal mode |

### Fuzzy Finder

| Keybinding   | Action    |
|--------------- | --------------- |
| `<space>/`   | Ripgrep (current directory)   |
| `<space>ff`   | Find files  (current directory) |
| `<space>,`   | Find open buffers   |
| `<space>uC`   | Change colorscheme   |
| `/`   | Lines in current buffer   |

### C++ Specific Commands

| Keybinding | Action |
|------------|--------|
| `<space>ac` | Compile current file |
| `<space>ar` | Compile and run |
| `<space>acri` | Compile and run with input from file 'i' |
| `<space>ard` | Launch GDB debugger |

### LSP Navigation

| Keybinding | Action |
|------------|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `gi` | Go to implementation |
| `K` | Show documentation hover |
| `<space>cr` | Rename symbol |
| `<space>ca` | Code action menu |
| `<space>cf` | Quick fix |
| `[g` / `]g` | Previous/next diagnostic |

## Customization

The configuration is thoroughly commented to make customization easy. Key areas you might want to modify:

- Compiler flags in the autocmd section
- Theme options (background intensity, color scheme)
- LSP settings for different languages
- Specific macros or snippets.

## Contributing

Feel free to submit issues or pull requests if you have suggestions for improvements or bug fixes.

## License

MIT
