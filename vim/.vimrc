" Quality of life options
syntax on
set clipboard+=unnamed
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set relativenumber
set smarttab
set autoindent
set nocompatible
set ruler
set smartindent
set splitbelow
set hidden
set showtabline=1
set foldmethod=syntax

let mapleader = " "

" Global Keymaps
"" Vim
nnoremap ; :
tnoremap <C-x> <C-\><C-n> 

"" Fuzzy finder
nnoremap <leader>/ :Rg<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>, :Buffers<CR>
nnoremap <leader>w :Windows<CR>
nnoremap <leader>uC :Colors<CR> 
nnoremap / :BLine<CR>

" Autocmds
"" Compile
autocmd filetype cpp nnoremap <leader>ac  :w <bar> !g++ -std=c++20 -g -Wall % -o %:r<CR>
"" Compile && Run with input
autocmd filetype cpp nnoremap <leader>acri :w <bar> !g++ -std=c++20 -Wall -O2 % -o %:r && ./%:r < i<CR>
"" Compile && Run
autocmd filetype cpp nnoremap <leader>ar  :w <bar> !g++ -std=c++20 -g -Wall % -o %:r && ./%:r<CR>
"" Compile && Run debugger
function! LaunchGDB()
    write
    execute "!g++ -g -std=c++20 % -o %:r"
    execute "below terminal gdb %:r"
endfunction
autocmd filetype cpp nnoremap <leader>ard  :call LaunchGDB()<CR>
filetype off

" Plugins
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Autocompletion
Plugin 'ycm-core/YouCompleteMe' 

" Tab completion feature
Plugin 'ajh17/VimCompletesMe'

" Man pages in vim
Plugin 'vim-utils/vim-man'

"u The BEST theme
Plugin 'sainnhe/gruvbox-material'

" Status line
Plugin 'itchyny/lightline.vim'

" Lsp server
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'

"" Autocompletion options for lsp
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

" Fuzzle find
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" Auto close pairs
Plugin 'Raimondi/delimitMate'

" Clipboard for Wayland
Plugin 'jasonccox/vim-wayland-clipboard'

call vundle#end()            " required
filetype plugin indent on    " required

" Theming
if has('termiguicolors')
	set termguicolors
endif

let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_foreground = 'material'
let g:gruvbox_material_better_performance = 1

colorscheme gruvbox-material
set background=dark

"" Light line
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox_material'
set laststatus=2

" Lsp configuration
"" LSP highlighting
let g:lsp_semantic_enabled = 1

"" Signs for diagnostics
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1

"" Signs for errors, warnings, etc.
let g:lsp_diagnostics_signs_error = {'text': '✗'}
let g:lsp_diagnostics_signs_warning = {'text': '⚠'}
let g:lsp_diagnostics_signs_hint = {'enabled': 0}
let g:lsp_diagnostics_signs_information = {'enabled': 0}

"" Clangd configuration
if executable('clangd')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'clangd',
      \ 'cmd': {server_info->['clangd']},
      \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp'],
      \ })
endif

"" LSP key mappings
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  
  nnoremap <buffer> gd :LspDefinition<CR>
  nnoremap <buffer> gr :LspReferences<CR>
  nnoremap <buffer> gi :LspImplementation<CR>
  nnoremap <buffer> gt :LspTypeDefinition<CR>
  nnoremap <buffer> <leader>cr :LspRename<CR>
	nnoremap <buffer> <leader>ca :LspCodeAction<CR>
	nnoremap <buffer> <leader>cf :LspCodeAction quickfix<CR>
  nnoremap <buffer> [g :LspPreviousDiagnostic<CR>
  nnoremap <buffer> ]g :LspNextDiagnostic<CR>
  nnoremap <buffer> K :LspHover<CR>
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Cursor shape in different modes
if &term =~ "xterm" || &term =~ "screen"
    " Insert mode - line cursor
    let &t_SI = "\<Esc>[5 q"
    " Normal mode - block cursor
    let &t_EI = "\<Esc>[1 q"
    " Replace mode - underline cursor
    let &t_SR = "\<Esc>[3 q"
endif
