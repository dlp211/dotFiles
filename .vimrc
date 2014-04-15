" David Patrzeba's vimrc

" Enable pathogen and inject my plugins
execute pathogen#infect()


" use a nice colorscheme
colorscheme vividchalk
set guifont=Source\ Code\ Pro:h11

"turns on line numbers
set number

"sets tabs and auto-indent
filetype indent on
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set cindent

set spell

"highlights trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Highlight row
set cursorline

" Display a verbose status line
set laststatus=2
set statusline=\ %F\ %=%([%H%W%R%M]%)\ [%Y:%{&ff}]\ [ASCII=\%03.3b]\ [%03v,\ %03l/%L=%02p%%]

" Ensure that there is no eol character
set noeol

" Always show the cursor position
set ruler

" Toggling paste mode should make copy/pasting easier too
function! TogglePaste()
    if &paste || !&nu
        set nopaste
        set nu
        set foldcolumn=2
        set colorcolumn=81
    else
        set paste
        set nonu
        set foldcolumn=0
        set colorcolumn=0
    endif
endfunction

" A toggle button for pasting
nnoremap <silent> <F2> :call TogglePaste()<CR>
inoremap <silent> <F2> <Esc>:call TogglePaste()<CR>i
set pastetoggle=<F2>
set showmode

" Maintain the selection after shifting a visual block
vmap > >gv
vmap < <gv

" Remap the cursors to behave as expected on wrapped lines
imap <silent> <up> <C-O>gk
imap <silent> <down> <C-O>gj
nmap <silent> <up> gk
nmap <silent> <down> gj
vmap <silent> <up> gk
vmap <silent> <down> gj

" Insert blank lines without going into insert mode
nmap t o<ESC>k
nmap T O<ESC>j

" Allow Control-V to be hit while in insert mode
imap <C-v> <Esc><C-v>

" Save everything (even if I hold down shift accidentally)
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))

" Searching forward and backwards in visual mode should 'do the right thing'
vnoremap * y/<C-r>"<CR>//e<CR>v??<CR>o
vnoremap # y?<C-r>"<CR>//e<CR>v??<CR>o

" viminfo options
" read/write a .viminfo file, don't store more than
" 50 lines of registers
set viminfo='20,\"50

" LargeFile.vim settings
" don't run syntax and other expensive things on files larger than NUM megs
let g:LargeFile = 100

" Turn on filetype plugins to automagically
" Grab commands for particular filetypes.
" Grabbed from $VIM/ftplugin
filetype plugin on
filetype indent on

" Turn on syntax highlighting
syntax on

" Suffixes that get lower priority when doing tab completion for filenames
" These are files I am not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.class

" one color scheme for vimdiff
highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black

" Always show the tabs at the top
set showtabline=2

" Map Leader d and f to move the tabs
nnoremap <silent> <Leader>d :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <Leader>f :execute 'silent! tabmove ' . tabpagenr()<CR>

" Mappings to move tabs
nmap <silent> <Leader>q :tabprevious<CR>
nmap <silent> <Leader>w :tabnext<CR>

" Create a new tab with ctrl t
nmap <silent> <C-t> :tabnew<CR>
vmap <silent> <C-t> <ESC>:tabnew<CR>
imap <silent> <C-t> <ESC>:tabnew<CR>

" Allow backspacing over everything in insert mode
set backspace=2

" Folding options
set foldcolumn=2
set foldlevel=0
set foldmethod=indent
set nofen

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Remove the menu and toolbar from the toolbar
set guioptions-=m
set guioptions-=T

" Keep 50 lines of command line history
set history=50

" Search options
set ignorecase
set incsearch

" This displays long lines as wrapped at word boundries
set linebreak

" Don't worry about VI compatibility
set nocompatible

" Timeout extensions
set notimeout
set ttimeout
set ttimeoutlen=100

" Use TAB to complete when typing words, else inserts TABs as usual.
function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-P>"
    else
        return "\<Tab>"
    endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
set dictionary="/usr/dict/words"

" Enable indent guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
set ts=2 sw=2 et
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgray ctermbg=red
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=lightgray ctermbg=blue

" Set the indent for some specific file types
" just in case I want to override the default
autocmd FileType java setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType vim setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType unix setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType git setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType scala setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType sh setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType css setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType cpp setlocal shiftwidth=4 tabstop=4 softtabstop=4

" When editing a file, make screen display the name of
" the file you are editing
function! SetTitle()
    if $TERM =~ "^screen"
        let l:title = 'vi: ' . expand('%:t')

        if (l:title != 'vi: __Tag_List__')
        let l:truncTitle = strpart(l:title, 0, 15)
        silent exe '!echo -e -n "\033k' . l:truncTitle . '\033\\"'
        endif
    endif
endfunction
autocmd BufEnter,BufFilePost * call SetTitle()

" Update file matching to behave more like bash
set wildmode=list:longest,full
set wildmenu

" Highlight the 81st column to keep us within reasonable line lengths
if exists("+colorcolumn")
  set colorcolumn=81
  highlight ColorColumn ctermbg=yellow guibg=yellow
endif

" Show tabs
set list listchars=tab:»~,trail:·

" Highlight trailing whitespace this isn't working for some reason
highlight ExtraWhitespace ctermbg=red guibg=red ctermfg=white guifg=white
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
