".vimrc
"David Patrzeba
"06/12/12


"sets color scheme to koehler
:colorscheme koehler

"turns on line numbers
:set number

"sets auto-indent
filetype indent on
set expandtab
set tabstop=3
set shiftwidth=3
set autoindent
set smartindent

"highlights trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/