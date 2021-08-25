" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Soares/base16.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'sophacles/vim-processing'
Plug 'katusk/vim-qkdb-syntax'
Plug 'jubnzv/IEC.vim'
Plug 'vim-test/vim-test'

function! BuildMarkdownComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildMarkdownComposer') }


" Initialize plugin system
call plug#end()



" Enables filetype detection, loads ftplugin, and loads indent
" (Not necessary on nvim and may not be necessary on vim 8.2+)

let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1

" set termguicolors
set background=dark
set tabstop=4
set expandtab
set shiftwidth=4
set number "show line numbers
set cursorline  "underline active line
set ruler "shows row/column number in bottom
set textwidth=160
filetype indent on "load filetype specific indent files
filetype plugin on
syntax on
filetype on "not sure about this
set incsearch "searches as characters are entered
set hlsearch "highlights search matches

" Mappings
"

" move vertically by visual line, not technical line
nnoremap j gj
nnoremap k gk
inoremap jk <esc>

" fzf
noremap <C-P> :Files <CR>

" Enables persistent undo in sessions
set undofile
if !has('nvim')
 set undodir=~/.vim/undo
endif
augroup vimrc
  autocmd!
  autocmd! BufWritePre /tmp/* setlocal noundofile
augroup END
