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
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'ervandew/supertab'
Plugin 'kchmck/vim-coffee-script'
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'

" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'bufexplorer.zip'

call vundle#end()
filetype plugin indent on " required!
syntax on

if has('gui_running')
	set guioptions-=T "no toolbar
	"set guioptions-=m
	set guifont=Consolas:h9:cANSI
	set mouseshape=n:beam
endif

set ff=unix
set ffs=unix,dos
set nocompatible
set backspace=indent,eol,start
set hidden

set number
set smartindent

set titlestring=%t
if &term =~ "screen"
	set t_ts=k
	set t_fs=\
endif
set title
set background=dark
set modeline
set t_Co=256
" search ignore case and smartcase when uppercase letter is used
set ic
set scs

colorscheme desert256

" omni completion
set ofu=syntaxcomplete#Complete

let g:SuperTabDefaultCompletionType = "context"

augroup myfiletypes
	" clear old autocmds in group
	autocmd!
	" autoindent with two spaces, always expand tabs
	autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
	"
	au FileType python setlocal tabstop=8 et sw=4 sts=4
	au FileType c set cindent cinoptions=:0
augroup END

"

map <F5> :!ctags -R --fields=+S .<CR>

nmap <F6> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.cc' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
  \:!cscope -q -b -i cscope.files -f cscope.out<CR>
  \:cs reset<CR>

" Nerdtree
nmap <F8> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows = 0

let c_space_errors = 1
let ruby_space_errors = 1

" easytag
"set tags=./tags;
"let g:easytags_dynamic_files = 1
"let g:easytags_file = './tags'
"let g:easytags_updatetime_warn = 0
"let g:easytags_event = ['BufRead']
"let g:easytags_auto_highlight = 0

" supertab config to lose preview/scratch window that pops up on tab selection
let g:SuperTabClosePreviewOnPopupClose = 1
