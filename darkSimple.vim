
set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "darkSimple"

" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine guibg=#2d2d2d
	hi ColorColumn guibg=#093C4D
  hi CursorColumn guibg=#2d2d2d
  hi MatchParen guifg=#f6f3e8 guibg=#857b6f gui=bold
  hi Pmenu 		guifg=#f6f3e8 guibg=#444444
  hi PmenuSel 	guifg=#000000 guibg=#cae682
endif

" General colors
hi Cursor 		guifg=NONE    guibg=#656565 gui=none
hi Normal 		guifg=#f6f6f6 guibg=#333333 gui=none
hi NonText 		guifg=#808080 guibg=#303030 gui=none
hi LineNr 		guifg=#555555 guibg=#303030 gui=none
hi StatusLine 	guifg=#444444 guibg=#DDDDDD gui=italic
hi StatusLineNC guifg=#444444 guibg=#DDDDDD gui=none
hi VertSplit 	guifg=#444444 guibg=#DDDDDD gui=none
hi Folded 		guibg=#384048 guifg=#a0a8b0 gui=none
hi Title		guifg=#f6f3e8 guibg=NONE	gui=bold
hi Visual		guifg=#f6f3e8 guibg=#444444 gui=none
hi SpecialKey	guifg=#808080 guibg=#343434 gui=none

" Syntax highlighting
hi Comment 		guifg=#AAAAAA gui=italic
hi Todo 		guifg=#FFFF4D gui=bold
hi Constant 	guifg=#f6f6f6 gui=none
hi String 		guifg=#D1EDF6 gui=italic
hi Identifier 	guifg=#FFFFFF gui=none
hi Function 	guifg=#F6FAB1 gui=none
hi Type 		guifg=#FFFFFF gui=none
hi Statement 	guifg=#FF9147 gui=none
hi Keyword		guifg=#FFFFFF gui=none
hi PreProc 		guifg=#7EBCD1 gui=none
hi Number		guifg=#19A3D1 gui=none
hi Special		guifg=#CCCCCC gui=none


