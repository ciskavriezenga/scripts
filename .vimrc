

execute pathogen#infect()
syntax on
"filetype plugin indent on
"filetype plugin on 
let g:pydiction_location = '/home/user/.vim/bundle/pydiction/complete-dict' 
let g:pydiction_menu_height = 3 

colorscheme darkSimple
set number
set tabstop=2 
set shiftwidth=2
"set expandtab
set colorcolumn=80
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
