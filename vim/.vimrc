set nocompatible " Actually not needed in neovim :)

""" Plugins
call plug#begin("~/.vim/plugged")

"" IDE LIKE STUFF "
" Workspaces
Plug 'tpope/vim-obsession'
Plug 'szw/vim-ctrlspace'

" File Management
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Completion
Plug 'Valloric/YouCompleteMe', { 'do': 'python2 ./install.py --clang-completer --gocode-completer' }
Plug 'mattn/emmet-vim'

" Indentation lines
Plug 'Yggdroot/indentLine'

"" Note taking stuff "
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
    UpdateRemotePlugins
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'vim-pandoc/vim-pandoc' | Plug 'vim-pandoc/vim-pandoc-syntax'

"" COLORS!
Plug 'tomasr/molokai'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
call plug#end()


""" For CTRL-Space
set hidden
set showtabline=0

""" Because we are in the future now
set encoding=utf-8

""" Indenting
filetype on
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

""" Movement
"" Numberings
set relativenumber 
set number          

"" Scrolloff (makes it so i cant get to the edge of the window and need to go
" down and back up
set scrolloff=5

""" Keymappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ycm_key_invoke_completion = '<C-CR>'
map <C-n> :NERDTreeToggle<CR>

" Quick escape
imap jj <Esc>

" For when your literally an idiot
cnoreabbrev W w

" Colors
colorscheme molokai
syntax on
