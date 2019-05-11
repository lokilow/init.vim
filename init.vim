"
" @lokilow's neovim config
"

" 
" Plugs
"
call plug#begin('~/.local/share/nvim/plugged')

" 
" Utilities
"
Plug 'Soares/base16.nvim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'kassio/neoterm'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Valloric/MatchTagAlways'
Plug 'w0rp/ale' "linter
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'} "autocomplete
Plug 'vim-airline/vim-airline' "status line
" git
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/gina.vim'

" 
" Languages
"
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" web
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'reasonml-editor/vim-reason-plus'
" erlang
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-compiler'
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'vim-erlang/vim-erlang-tags'
" elixir
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'mhinz/vim-mix-format'
" haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'eagletmt/ghcmod-vim'
" others
Plug 'WolfgangMehner/lua-support'
Plug 'derekwyatt/vim-scala'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'jpalardy/vim-slime'
Plug 'wlangstroth/vim-racket'
Plug 'wilsaj/chuck.vim'

"
" Plugs with build funtions
"
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

call plug#end()


"
" Config
"
set termguicolors
colorscheme embers
set background=dark
set tabstop=4
set expandtab
set shiftwidth=4
set number "show line numbers
set cursorline  "underline active line
set ruler "shows row/column number in bottom
set textwidth=89
filetype indent on "load filetype specific indent files
syntax on
set incsearch "searches as characters are entered
set hlsearch "highlights search matches

let g:airline#extensions#ale#enabled = 1
let g:deoplete#enable_at_startup = 1

" format elixir code on save
let g:mix_format_on_save = 1

" langugae server settings
let g:LanguageClient_serverCommands = {
    \ 'reason': ['/usr/local/opt/reason-language-server/bin/reason-language-server.exe'],
    \ }

"
" Mappings
"

" move vertically by visual line, not technical line
nnoremap j gj
nnoremap k gk
inoremap jk <esc>

" fzf
noremap <C-P> :Files <CR>
