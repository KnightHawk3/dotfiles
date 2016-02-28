set nocompatible " Actually not needed in neovim :)

""" Plugins
call plug#begin("~/.vim/plugged")

"" IDE LIKE STUFF "
" Workspaces
Plug 'tpope/vim-obsession'
Plug 'szw/vim-ctrlspace'

if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

nnoremap <silent><C-p> :CtrlSpace O<CR>
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1

" File Management
"Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Completion
"Plug 'Valloric/YouCompleteMe', { 'do': 'python2 ./install.py --clang-completer --gocode-completer' }
Plug 'mattn/emmet-vim'

" Snippets
Plug 'honza/vim-snippets' | Plug 'SirVer/ultisnips'
" Set complete keys
let g:UltiSnipsExpandTrigger="<tab>"
" TODO: Work out better ones
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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

" Git stuff
Plug 'airblade/vim-gitgutter'

"" COLORS!
Plug 'tomasr/molokai'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'jelera/vim-javascript-syntax'
Plug 'slava/vim-spacebars'
Plug 'dag/vim-fish'

" Airline
Plug 'vim-airline/vim-airline-themes' | Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'

" Clojure
Plug 'guns/vim-clojure-static' | Plug 'guns/vim-clojure-highlight'
Plug 'kien/rainbow_parentheses.vim'
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

Plug 'tpope/vim-fireplace'


call plug#end()


""" For CTRL-Space
set hidden
"set showtabline=0

""" Because we are in the future now
set encoding=utf-8

""" Indenting
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

""" Filetypes
au BufRead,BufNewFile *.page set filetype=pandoc

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

" Leader Key
let mapleader = ","


" For when your literally an idiot
cnoreabbrev W w

" Colors
color dracula
syntax on
