" Basic stuff
syntax enable               " Syntax highlighting
set hlsearch                " Highlight search items
set incsearch               " Highlight search items as you type
set showmatch               " Show matches for parenthesis, etc.
set expandtab               " Use softtabs
set tabstop=2 shiftwidth=2  " Set tab width
set background=light        " Assume a light background (dark is the other option)
set autoindent

" Return to last position
set viminfo='100,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif 

" Keep text in visual mode when indenting or unindenting.
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

" LaTeX Helpder functionality
try
  source $MYVIMRC.latex-helper
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
"vmap <C-S-y> :w! ~/.vbuf<CR>      " copy the current visual selection to ~/.vbuf
"nmap <C-S-p> :r ~/.vbuf<CR>       " paste the contents of the buffer file

"Copy onto and paste from clipboard
vmap <C-S-u> :w ! xsel<CR>       " copy the current visual selection to X11 clipboard using "xsel"
map <C-S-y> "+y<CR>
nmap <C-S-p> "+p<CR>


" Lilypond Syntax Highlighting
filetype off
set runtimepath+=~/lilypond/usr/share/lilypond/current/vim
filetype on

au BufRead,BufNewFile *.scala set filetype=scala
au! Syntax scala source ~/vim/.vim/syntax/scala.vim

