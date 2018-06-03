"*****************************************************************************
" appearance

" status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

" line numbering
set number

" colors
"colorscheme elflord
"colorscheme industry
"colorscheme koehler
colorscheme torte

" font
if has("gui_macvim")
    set guifont=Menlo\ Regular:h18
else
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
endif

" wrapping
set wrapmargin=0
" http://www.unuserfriendly.com/index.html
let g:leave_my_textwidth_alone = 1
set textwidth=0

" hide toolbar
set guioptions-=T
"*****************************************************************************

"*****************************************************************************
" syntax

syntax on

" spellcheck
set spelllang=en
set spellfile=$HOME/.vim/spell/en.utf-8.add
set spell
"*****************************************************************************

"*****************************************************************************
" keys behavior

set backspace=indent,eol,start
set whichwrap+=<,>,[,]

" indent and tab options
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" On pressing backspace, delete 4 spaces
set softtabstop=4
" smartindent
set smartindent
"*****************************************************************************

"*****************************************************************************
" search options

" highlight all matches of prior search
set hlsearch

" case insensitive
set ignorecase
"*****************************************************************************

"*****************************************************************************
" ctrlp

"helptags $HOME/.vim/pack/bundle/start/ctrlp/doc
"let g:ctrlp_extensions = ['sw_profiles']
"let g:ctrlp_show_hidden = 1

"*****************************************************************************
" vim-sql-workbench

"let g:sw_exe = '/usr/bin/sqlwbconsole.sh'
"let g:sw_config_dir = $HOME . '/.sqlworkbench'
"*****************************************************************************
