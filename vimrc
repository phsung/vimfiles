set nocompatible
filetype off " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" my bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'

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

nmap <F6> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
  \:!cscope -q -b -i cscope.files -f cscope.out<CR>
  \:cs reset<CR>

nmap <F8> :NERDTreeToggle<CR>

