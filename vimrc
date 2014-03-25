" Comment if not spanish
"set spell
"set spelllang=es

let g:JSLintHighlightErrorLine = 0

let mapleader="º"
set nocompatible    " We're running Vim, not Vi!

set number          "add line numbers
set encoding=utf8   "use UTF8 encoding
set nopaste         "paste mode on disable supertab plugin
set ruler

set incsearch       "find the next match as we type the search
set hlsearch        "highlight searches by default

" Whitespace stuff
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set showbreak=...
set wrap linebreak nolist

" Highlight extra whitespace
set list listchars=tab:..,trail:·

" Some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

" Tab completion options
set wildmode=list:longest,list:full  "make cmdline tab completion similar to bash
set complete=.,w,t
set wildmenu                         "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,test/fixtures/*,vendor/gems/*,*~

" Statusline setup
let encoding = '[' . (&fenc==''?&enc:&fenc) . ((exists('+bomb') && &bomb) ? ',B' : '') . ']'
set statusline=%f                         "tail of the filename
set statusline+=%y                        "filetype
set statusline+=%{encoding}               "encoding
set statusline+=%{fugitive#statusline()}  "git branch
set statusline+=%m                        "modified flag
set statusline+=%{rvm#statusline()}       "rvm
set statusline+=%=                        "left/right separator
set statusline+=%c,                       "cursor column
set statusline+=%l/%L                     "cursor line/total lines
set statusline+=\ %P                      "percent through file
set laststatus=2

" Key mappings

" Toggle NERDTree
silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>

" Clean out all trailing whitespace or tabs
nnoremap <silent> <Leader>c :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" Tab navigation
nnoremap <c-n> :tabnew<CR>
nmap <Tab> gt
nmap <S-Tab> gT

" Pathogen plugin
filetype off              " Needed so pathogen also loads ftdetect plugins.
call pathogen#infect()
call pathogen#helptags()
syntax on                 " Enable syntax highlighting
filetype on               " Enable filetype detection
filetype indent on        " Enable filetype-specific indenting
filetype plugin on        " Enable filetype-specific plugins

" Load colorscheme
"set t_Co=256
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
"colorscheme blue

" Include user's local vim config
if filereadable(expand(".vimrc.local"))
  source .vimrc.local
endif

"Coffee config
let coffee_compile_vert = 1
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
au BufNewFile,BufRead *.treetop setlocal ft=treetop

set runtimepath^=~/.vim/bundle/ctrlp.vim

"
" Kevin: columna 80 para marcar el final de donde escribir
" if exists('+colorcolumn')
"   set colorcolumn=80
" else
"   au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
" endif

"jsbeautify
" https://github.com/maksimr/vim-jsbeautify
map <c-k> :call JsBeautify()<cr>

" associate *.jison with yacc filetype
au BufRead,BufNewFile *.jison setfiletype yacc
