" ┏━┓┏━╸┏━┓   ┏┳┓┏━┓┏━╸╻┏━╸╻┏ 
" ┣┻┓┣╸ ┃ ┃   ┃┃┃┣━┫┃╺┓┃┃  ┣┻┓
" ╹ ┗┗━╸┗━┛   ╹ ╹╹ ╹┗━┛╹┗━╸╹ ╹
" original blaque magick by xero harrison (http://blaquemagick.xero.nu)
" https://github.com/xero/blaquemagick.vim
" red magick version by mickey

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name="redmagick"


" execute hilight
function! ExecHi(att,fg,bg)
  execute 'hi ' . a:att 'ctermfg=' . a:fg 'ctermbg=' . a:bg
endfunction


" Color key
let DeepPink4     = 125
let Grey78        = 251
let Grey70        = 249
let Grey62        = 247
let Grey50        = 244
let Grey42        = 242
let Grey39        = 241
let Grey27        = 238
let Grey23        = 237
let DarkOrange3   = 166
let Grey0         = 16
let Red1          = 196
let Red3          = 160
let DarkRed       = 52
let Green1        = 46
let Black         = 0
let NONE          = "NONE"


call ExecHi("ColorColumn",NONE,Grey42)
call ExecHi("Comment",DeepPink4,NONE)
call ExecHi("Conditional",Grey39,NONE)
call ExecHi("Constant",Red1,NONE)
call ExecHi("Cursor",Grey42,NONE)
call ExecHi("CursorLine",NONE,NONE)
call ExecHi("DiffAdd",Grey27,NONE)
call ExecHi("DiffChange",NONE,Green1)
call ExecHi("DiffDelete",Grey78,Green1)
call ExecHi("DiffText",Grey78,Grey50)
call ExecHi("Directory",Grey50,Grey0)
call ExecHi("Error",Green1,Grey50)
call ExecHi("ErrorMsg",Green1,Grey0)
call ExecHi("FoldColumn",Grey27,NONE)
call ExecHi("Folded",Grey27,NONE)
call ExecHi("Function",Red3,NONE)
call ExecHi("Identifier",Red3,NONE)
call ExecHi("IncSearch",Black,NONE)
call ExecHi("NonText",Grey27,NONE)
call ExecHi("Normal",Grey70,NONE)
call ExecHi("Number",Red1,NONE)
call ExecHi("Operator",Grey39,NONE)
call ExecHi("PreProc",DarkRed,NONE)
call ExecHi("Repeat",Grey27,NONE)
call ExecHi("Search",DarkRed,Grey62)
call ExecHi("Special",DarkOrange3,NONE)
call ExecHi("SpecialKey",Grey27,NONE)
call ExecHi("Statement",Grey27,NONE)
call ExecHi("StatusLine",Grey27,NONE)
call ExecHi("String",Red3,NONE)
call ExecHi("TabLineSel",Grey78,NONE)
call ExecHi("Title",DarkRed,NONE)
call ExecHi("Todo",Grey78,Green1)
call ExecHi("Type",Grey78,NONE)
call ExecHi("VertSplit",Grey27,NONE)
call ExecHi("Visual",Grey27,NONE)
call ExecHi("WarningMsg",Grey42,NONE)
call ExecHi("LineNr",Grey23,NONE)
call ExecHi("CursorLineNr",Grey0,Grey23)

call ExecHi("Pmenu",Grey70,Grey78)
call ExecHi("PmenuSel",  Grey27,Green1)
call ExecHi("PmenuSbar", Grey27,Green1)
call ExecHi("PmenuThumb",Grey27,Green1)

hi Underlined   term=underline cterm=underline ctermfg=NONE   ctermbg=NONE

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
