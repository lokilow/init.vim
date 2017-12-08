set termguicolors

call plug#begin('~/.local/share/nvim/plugged')

Plug 'WolfgangMehner/lua-support'
Plug 'Soares/base16.nvim'
Plug 'neovimhaskell/haskell-vim'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'tpope/vim-commentary'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-compiler'
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'vim-erlang/vim-erlang-tags'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'eagletmt/ghcmod-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'tpope/vim-commentary'
Plug 'posva/vim-vue'
Plug 'Valloric/MatchTagAlways'
Plug 'ctrlpvim/ctrlp.vim'

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

call plug#end()

colorscheme embers
set background=dark
set tabstop=4
set expandtab
set shiftwidth=4
set number "show line numbers
set cursorline  "underline active line
set ruler "shows row/column number in bottom
filetype indent on "load filetype specific indent files
syntax on
set incsearch "searches as characters are entered
set hlsearch "highlights search matches

let g:airline#extensions#ale#enabled = 1

" move vertically by visual line, not technical line
nnoremap j gj
nnoremap k gk
inoremap jk <esc>
