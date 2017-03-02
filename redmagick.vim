" ┏━┓┏━╸┏━┓   ┏┳┓┏━┓┏━╸╻┏━╸╻┏ 
" ┣┻┓┣╸ ┃ ┃   ┃┃┃┣━┫┃╺┓┃┃  ┣┻┓
" ╹ ┗┗━╸┗━┛   ╹ ╹╹ ╹┗━┛╹┗━╸╹ ╹
" original blaque magick by xero harrison (http://blaquemagick.xero.nu)
" https://github.com/xero/blaquemagick.vim
" red magick version by Arthur Lui

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name="redmagick"


" execute hilight
function! ExecHi(...) " att, ctermfg, ctermbg, term, cterm
  let numArgs = a:0
  let att = a:1
  let fg = "NONE"
  let bg = "NONE"
  let term = "NONE"
  let cterm = "NONE"

  if numArgs > 2
    let fg = a:2
  endif

  if numArgs > 3
    let bg = a:3
  endif

  if numArgs > 4
    let term = a:4
  endif

  if numArgs > 5
    let cterm = a:5
  endif

  execute 'hi ' . att 'ctermfg=' . fg 'ctermbg=' . bg 'term=' . term 'cterm=' . cterm
endfunction


" Color key
let DeepPink4     = 125
let LightGrey     = 249
let Grey          = 245
let DarkGrey      = 238
let DarkDarkGrey  = 236
let DarkOrange3   = 166
let Red1          = 196 "bright
let Red3          = 160 "brown
let DarkRed       = 88 "52
let Green         = 2 "46
let Black         = 0
let White         = 194
let NONE          = "NONE"
let bold          = "bold"


call ExecHi("ColorColumn",NONE,DarkGrey)
call ExecHi("Comment",DeepPink4,NONE)
call ExecHi("Conditional",DarkGrey,NONE)
call ExecHi("Constant",Red1,NONE)
call ExecHi("Cursor",DarkGrey,NONE)
call ExecHi("CursorLine",NONE,NONE)
call ExecHi("DiffAdd",DarkGrey,NONE)
call ExecHi("DiffChange",NONE,DeepPink4)
call ExecHi("DiffDelete",LightGrey,Green)
call ExecHi("DiffText",LightGrey,Grey)
call ExecHi("Directory",Grey,Black)
call ExecHi("Error",Green,Grey)
call ExecHi("ErrorMsg",Green,Black)
call ExecHi("FoldColumn",DarkGrey,NONE)
call ExecHi("Folded",DarkGrey,NONE)
call ExecHi("Function",Red3,NONE)
call ExecHi("Identifier",Red3,NONE)
call ExecHi("IncSearch",Grey,NONE)
call ExecHi("NonText",DarkGrey,NONE)
call ExecHi("Normal",LightGrey,NONE)
call ExecHi("Number",Red1,NONE)
call ExecHi("Operator",DarkGrey,NONE)
call ExecHi("PreProc",DarkOrange3,NONE,NONE,bold)
call ExecHi("Repeat",DarkGrey,NONE)
call ExecHi("Search",DarkRed,LightGrey,NONE,bold)
call ExecHi("Special",DarkRed,NONE)
call ExecHi("SpecialKey",DarkGrey,NONE)
call ExecHi("Statement",DarkGrey,NONE,NONE,bold)
call ExecHi("StatusLine",DarkGrey,NONE)
call ExecHi("String",Red3,NONE)
call ExecHi("TabLineSel",LightGrey,NONE)
call ExecHi("Title",DarkOrange3,NONE)
call ExecHi("Todo",LightGrey,Green)
call ExecHi("Type",White,NONE,bold,bold)
call ExecHi("VertSplit",DarkGrey,NONE)
call ExecHi("Visual",DarkGrey,LightGrey)
call ExecHi("WarningMsg",DarkGrey,NONE)
call ExecHi("LineNr",DarkDarkGrey,NONE)
call ExecHi("CursorLineNr",Black,DarkDarkGrey)

call ExecHi("Pmenu",LightGrey,DarkDarkGrey)
call ExecHi("PmenuSel",  DarkGrey,Green)
call ExecHi("PmenuSbar", DarkGrey,Green)
call ExecHi("PmenuThumb",DarkGrey,Green)

hi Underlined term=underline cterm=underline ctermfg=NONE ctermbg=NONE

hi! link diffAdded       DiffAdd
hi! link diffRemoved     DiffDelete
hi! link diffChanged     DiffChange
hi! link StatusLineNC    StatusLine
" hi! link Title           Normal
hi! link MoreMsg         Normal
hi! link Question        DiffChange
hi! link TabLine         StatusLineNC
hi! link TabLineFill     StatusLineNC
hi! link VimHiGroup      VimGroup
