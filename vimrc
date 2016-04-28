" set shell=/bin/sh
"
"
let g:EclimCompletionMethod = 'omnifunc'
" pathogen
"execute pathogen#infect()
syntax on
"filetype plugin indent on

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'rust-lang/rust.vim'

" Plugin 'scrooloose/syntastic'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'rking/ag.vim'

Plugin 'vim-airline/vim-airline'

Plugin 'tpope/vim-fugitive'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'jeffkreeftmeijer/vim-numbertoggle'

Plugin 'derekwyatt/vim-scala'

Plugin 'altercation/vim-colors-solarized'

Plugin 'nanotech/jellybeans.vim'

Plugin 'blueshirts/darcula'

Plugin 'floobits/floobits-neovim'

" Plugin 'ensime/ensime-vim'

Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required

let EnErrorStyle='Underlined'

" ctags
set tags=tags;/

" line numbers
set number
:highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" http://stackoverflow.com/questions/1551231/highlight-variable-under-cursor-in-vim-like-in-netbeans
:autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

"--------------------
"" Function: Open tag under cursor in new tab
" Source:   http://stackoverflow.com/questions/563616/vimctags-tips-and-tricks
" "--------------------
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" highlight unwanted(trailing) whitespace
" + have this highlighting not appear whilst you are typing in insert mode
" + have the highlighting of whitespace apply when you open new buffers
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Colors
syntax on
set background=dark
let g:solarized_termcolors = 256
" colorscheme solarized
"colorscheme base16-atelierlakeside
" colorscheme github
" colorscheme base16-ateliersulphurpool
" colorscheme ir_black
"colorscheme jellybeans
colorscheme darcula
" colorscheme sandydune

" leader key
let mapleader = ','

" searching
set ignorecase smartcase incsearch hlsearch

" don't display welcome
set shortmess+=I

" Sets how many lines of history VIM has to remember
set history=700

"Always show current position
set ruler

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Turn backup off
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Remap VIM 0 to first non-blank character
map 0 ^

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Format scala code

set autoindent
filetype plugin indent on

let g:scala_sort_across_groups=1
map ,st :%!java -jar /Users/caente/.vim/scalariform.jar -f -q +spaceInsideParentheses +alignArguments +alignParameters +alignSingleLineCaseStatements +preserveDanglingCloseParenthesis +multilineScaladocCommentsStartOnFirstLine +spaceInsideParentheses +spacesWithinPatternBinders +spacesAroundMultiImports -alignSingleLineCaseStatements.maxArrowIndent=40 -indentSpaces=2 --stdin<CR> 

" Tagbar (http://blog.stwrt.ca/2012/10/31/vim-ctags)
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" nnoremap <leader>. :CtrlPTag<cr>
nnoremap <silent> <Leader>ct :CtrlPTag<CR>

" NerdTree
map <leader>n :NERDTreeToggle<cr>
map <leader>r :NERDTreeFind<cr>
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" open a NERDTree automatically when vim starts up if no files were specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Buffers - explore/next/previous: leader-u, Alt-F12, leader-p.
nnoremap <silent> <leader>u :BufExplorer<CR>
nnoremap <silent> <M-F12> :bn<CR>
nnoremap <silent> <leader>p :bp<CR>

" Replace word under cursor globally
nnoremap <Leader>a :%s/\<<C-r><C-w>\>/

" Replace word under cursor in line
nnoremap <Leader>s :s/\<<C-r><C-w>\>/

" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" pastetoggle http://stackoverflow.com/questions/2861627/paste-in-insert-mode
" set paste
set pastetoggle=<F2>

" Wildmenu completion: use for file exclusions"
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
set wildignore+=migrations "Django migrations"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig "Merge resolution files"
set wildignore+=*.class "java/scala class files"
set wildignore+=*/target/* "sbt target directory"
set wildignore+=*/cache/* "maven cache directory"
set wildignore+=*/classes/* "maven classes directory"

" Command-T Cache
let g:CommandTMaxCachedDirectories=0

" Rainbow parantheses
let g:rbpt_colorpairs = [
      \ ['brown',       'RoyalBlue3'],
      \ ['Darkblue',    'SeaGreen3'],
      \ ['darkgray',    'DarkOrchid3'],
      \ ['darkgreen',   'firebrick3'],
      \ ['darkcyan',    'RoyalBlue3'],
      \ ['darkred',     'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['brown',       'firebrick3'],
      \ ['gray',        'RoyalBlue3'],
      \ ['black',       'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['Darkblue',    'firebrick3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['darkcyan',    'SeaGreen3'],
      \ ['darkred',     'DarkOrchid3'],
      \ ['red',         'firebrick3'],
      \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

function! Comment()
  let ext = tolower(expand('%:e'))
  if ext == 'php' || ext == 'rb' || ext == 'sh' || ext == 'py'
    silent s/^/\#/
  elseif ext == 'js' || ext == 'scala'
    silent s:^:\/\/:g
  elseif ext == 'vim'
    silent s:^:\":g
  endif
endfunction

function! Uncomment()
  let ext = tolower(expand('%:e'))
  if ext == 'php' || ext == 'rb' || ext == 'sh' || ext == 'py'
    silent s/^\#//
  elseif ext == 'js' || ext == 'scala'
    silent s:^\/\/::g
  elseif ext == 'vim'
    silent s:^\"::g
  endif
endfunction

map <C-a> :call Comment()<CR>
map <C-b> :call Uncomment()<CR>

" colorcolumn / print margin
:set colorcolumn=120

" http://robots.thoughtbot.com/faster-grepping-in-vim/
" The Silver Searcher
" 'ra'
let g:ctrlp_working_path_mode = ''

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'


  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" bind K to grep word under cursor
nnoremap K :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" http://stackoverflow.com/questions/16743112/open-item-from-quickfix-window-in-vertical-split
autocmd! FileType qf nnoremap <buffer> <leader><Enter> <C-w><Enter><C-w>L

" When the page starts to scroll, keep the cursor 8 lines from the top and 8 lines from the bottom
set scrolloff=8

" ZoomWin
nmap <leader>o <c-w>o

" font size
" set guifont=Monaco:h13
" set guifont=Ubuntu\ Mono:h16
" set guifont=inconsolata:h16
set guifont=Inconsolata\ for\ Powerline:h16
" set guifont=hack:h12

" By pressing ctrl + r in the visual mode you will be prompted to enter text
" to replace with. Press enter and then confirm each change you agree with 'y'
" or decline with 'n'.
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" creates a new line without enter in insert mode, by pressing enter,
" shift-enter to create the line before the current line
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

set laststatus=2

let g:bufferline_echo = 0

set colorcolumn=160

let g:airline_powerline_fonts = 1

" check file change every 4 seconds ('CursorHold') and reload the buffer upon
" detecting change
set autoread                                                                                                                                                                                    
au CursorHold * checktime

" scrooloose/syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0 


