" vim: foldmethod=marker:foldlevel=0:ts=4:et:sw=4

" <<< Vundle and Plugins {{{
filetype off " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required!
Plugin 'VundleVim/Vundle.vim'

" First time install: you need to:
" make sure directory .vim/bundle exists
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" run :PluginUpdate to update

" my bundles here:
"
" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-bundler'
Plugin 'scrooloose/nerdtree'
"Plugin 'fholgado/minibufexpl.vim'
Plugin 'ervandew/supertab'
"Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-ruby/vim-ruby'
Plugin 'rstacruz/sparkup'
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'
Plugin 'mileszs/ack.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'rust-lang/rust.vim'

" vim-scripts repos
"Plugin 'L9'
"Plugin 'FuzzyFinder'

call vundle#end()
filetype plugin indent on " required!

" }}}
" <<< Colors {{{

syntax on
set background=dark
" 256 color
set t_Co=256
colorscheme solarized
"colorscheme desert256

" }}}
" <<< UI config {{{
set number
set titlestring=%t
if &term =~ "screen"
    " ESC k is gnu screen title
    "set t_ts=k
    " set title to xterm icon name and window title
    " see http://tldp.org/HOWTO/Xterm-Title-3.html
    set t_ts=]0
    set t_fs=\
    set mouse=a
    map <LeftMouse> <nop>
    map <A-LeftMouse> <nop>
    map <C-LeftMouse> <nop>
    map <S-LeftMouse> <nop>
    map <LeftDrag> <nop>
    map <LeftRelease> <nop>
    map <MiddleMouse> <nop>
    map <RightMouse> <nop>
    map <A-RightMouse> <nop>
    map <C-RightMouse> <nop>
    map <S-RightMouse> <nop>
    map <RightDrag> <nop>
    map <RightRelease> <nop>
    imap <LeftMouse> <nop>
endif
set title
set modeline
set wildmenu
set lazyredraw
" always show the status line instead of only during split
set laststatus=2
" }}}
" <<< Misc {{{

set fileformat=unix
set fileformats=unix,dos
" no vi compatible (should be set anyway since vimrc exist
set nocompatible
set backspace=indent,eol,start
" hide buffer on quit unless explicitely delete the buffer
set hidden
set smartindent

" search ignore case and smartcase when uppercase char is used
set ignorecase
set smartcase

set foldlevelstart=10

" make sure Gdiff use vertical split
set diffopt+=vertical

" enable omni completion
set ofu=syntaxcomplete#Complete

let g:SuperTabDefaultCompletionType = "context"
" supertab config to lose preview/scratch window that pops up on tab selection
let g:SuperTabClosePreviewOnPopupClose = 1

" buffer explorer option
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1


" }}}
" <<< GUI options {{{

if has('gui_running')
    set guioptions-=T "no toolbar
    "set guioptions-=m
    set guifont=Consolas:h9:cANSI
    set mouseshape=n:beam
endif

" }}}
" <<< Airline {{{
let g:airline_powerline_fonts = 1
let g:airline_theme = "solarized"
let g:airline_extensions = [ 'branch', 'quickfix']
let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ '' : 'V',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '' : 'S',
            \ }

let g:airline#extensions#default#layout = [
            \ [ 'a', 'b', 'c' ],
            \ [ 'z' ]
            \ ]

" define airline_symbols if not exist
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" The airline plugin seems to swap the origina maxlinenr symbol to linenr, and
" I want "space" for maxlinenr symbol
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
" }}}
" <<< Autogroups {{{
augroup myfiletypes
    " clear old autocmds in group
    autocmd!
    " autoindent with two spaces, always expand tabs
    autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
    "
    au FileType python setlocal tabstop=8 et sw=4 sts=4
    " 'cindent' and no indent for case statement in switch
    au FileType c set cindent cinoptions=:0
augroup END

let c_space_errors = 1
let ruby_space_errors = 1

" }}}
" <<< Nerdtree {{{
nmap <F8> :NERDTreeToggle<CR>
"let g:NERDTreeDirArrowExpandable = '>'
"let g:NERDTreeDirArrowCollapsible = 'v'
" }}}
" <<< My Key Mapping {{{

" affects any key map using <leader> after this
let mapleader = ","

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>s :mksession!<CR>

" <F2> to open/close fold
nnoremap <F2> za
nnoremap <F5> :!ctags -R --fields=+S .<CR>
" reload cscope on F6
nnoremap <F6> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.cc' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
            \:!cscope -q -b -i cscope.files -f cscope.out<CR>
            \:cs reset<CR>

" moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v

" quickfix on bottom
nnoremap <leader>c :botright copen<CR>

" }}}
" <<< Silver searcher (via Ack.vim) {{{

let g:ack_autoclose = 1

" do not jumt to first result automatically
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<space>

" use ack.vim for ag(the silver searcher)
if executable('ag')
    let g:ackprg = 'ag --vimgrep --smart-case'
    cnoreabbrev ag Ack!
endif

" }}}
