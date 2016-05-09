" Vundle is used for installing vim plugins. I used this for go's syntax
" highligh installation.
" For Installation Deatils, see https://github.com/gmarik/Vundle.vim
" To launch add the Plugin to the Plugin section.

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" After adding a Plugin, go to vim and run
"   :PluginInstall
Plugin 'gmarik/Vundle.vim'       " Vim
Plugin 'derekwyatt/vim-scala'    " Scala
Plugin 'tmux-plugins/vim-tmux'   " tmux
Plugin 'JuliaLang/julia-vim'     " Julia
Plugin 'godlygeek/tabular'       " Auto Indent
Plugin 'plasticboy/vim-markdown' " Markdown
Plugin 'octol/vim-cpp-enhanced-highlight' " C++
Plugin 'fatih/vim-go'            " Go-lang

" For Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1

" Add this to the syntax file in ~/.vim/bundle/vim-cpp-enhanced-highlight
"" Arthur RcppArmadillo.
"syntax keyword cppSTLtype vec
"syntax keyword cppSTLtype uvec
"syntax keyword cppSTLtype mat
"syntax keyword cppSTLtype NumericVector
"syntax keyword cppSTLtype List
"syntax keyword cppSTLfunction ones
"syntax keyword cppSTLfunction zeros
"syntax keyword cppSTLnamespace arma
"syntax keyword cppSTLnamespace Rcpp


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"########End of Vundle STUFF###############################

" Basic stuff
syntax enable               " Syntax highlighting
set hlsearch                " Highlight search items
set incsearch               " Highlight search items as you type
set showmatch               " Show matches for parenthesis, etc.
set expandtab               " Use softtabs
set tabstop=2 shiftwidth=2  " Set tab width
set background=light        " Assume a light background (dark is the other option)
set autoindent
set clipboard=unnamed

" Return to last position
set viminfo='100,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif 

" Keep text in visual mode when indenting or unindenting.
" Every time I hit < automatically do <gv
vmap < <gv  
vmap > >gv
vmap <s-tab> <gv
vmap <tab> >gv

" Intelligent tab completion
function! InsertTabWrapper(direction)
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  elseif "backward" == a:direction
    return "\<c-p>"
  else
    return "\<c-n>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

" Line Feeder functionality
try
  source $MYVIMRC.line-feeder-3
catch
endtry

" Execute a command from a shell
function ExecuteShellCommand(...)
  let cmd = ''
  let i = 1
  while i <= a:0
    let cmd = cmd . a:{i} . ' '
    let i = i + 1
  endwhile
  silent execute '!' . cmd
  redraw!
endfunction
command -nargs=+ E :call ExecuteShellCommand(<f-args>)

" Keybinding for word wrap
nnoremap <C-x> gqap

" Move between tabs --- Does not work within tmux.
nnoremap <silent> <A-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :tabprevious<CR>

" Switch to hex-editor
noremap <F8> :%!xxd<CR>
" Switch back
noremap <F7> :%!xxd -r<CR>

" Copy and paste between sessions
" Dahl copy the current visual selection to ~/.vbuf
" vmap <C-S-y> :w! ~/.vbuf<CR>

vmap <C-S-u> :w! xsel<CR> " copy the current visual selection to X11 clipboard using "xsel"
vmap <C-S-y> "+y<CR>      " copy the current visual selection to ~/.vbuf
nmap <C-S-p> "+p<CR>      " paste the contents of the buffer file
noremap <F9> zR

set number
