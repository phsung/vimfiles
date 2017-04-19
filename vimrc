" vim: foldmethod=marker:foldlevel=0

" <<< Vundle and Plugins {{{
filetype off " required!

set rtp+=~/.vim/bundle/vundle/
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
Plugin 'fholgado/minibufexpl.vim'
Plugin 'ervandew/supertab'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-ruby/vim-ruby'
Plugin 'rstacruz/sparkup'
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'
Plugin 'mileszs/ack.vim'
Plugin 'altercation/vim-colors-solarized'

" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'bufexplorer.zip'

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
	set t_ts=k
	set t_fs=\
endif
set title
set modeline
set wildmenu
set lazyredraw
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

" omni completion
set ofu=syntaxcomplete#Complete

let g:SuperTabDefaultCompletionType = "context"
" supertab config to lose preview/scratch window that pops up on tab selection
let g:SuperTabClosePreviewOnPopupClose = 1


" }}}
" <<< GUI options {{{

if has('gui_running')
	set guioptions-=T "no toolbar
	"set guioptions-=m
	set guifont=Consolas:h9:cANSI
	set mouseshape=n:beam
endif

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
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'
" }}}
" <<< Silver searcher {{{

" use ack.vim for ag(the silver searcher)
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
" }}}
" <<< My Key Mapping {{{

" affects any key map using <leader> after this
let mapleader = ","

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>s :mksession!<CR>

" map <F5> :!ctags -R --fields=+S .<CR>

" <F2> to open/close fold
nnoremap <F2> za

" reload cscope on F6
nnoremap <F6> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.cc' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
  \:!cscope -q -b -i cscope.files -f cscope.out<CR>
  \:cs reset<CR>

" }}}
