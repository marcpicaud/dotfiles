" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

colorscheme solarized


set t_Co=256                    " 256 colors is better than 8
set colorcolumn=80              " Display a vertical line at the 80th column
set laststatus=2                " Force powerline to be always shown
set backspace=indent,eol,start  " allow backspacing over everything in insert
                                " mode
set autoindent                  " autoindent...
set smartindent                 " ...but smart
set wrap                        " Wrap lines
set backupdir=~/.vim/tmp,.      " save backup files into .vim folder
set directory=~/.vim/tmp,.      " save swap files into .vim folder
set history=700                 " keep 50 lines of command line history
set autoread                    " If the file has been changed outside of vim,
                                " read it again
set showcmd                     " display incomplete commands
set incsearch                   " do incremental searching
set showmode                    " show current mode
set number                      " show line number
set ruler                       " show cursor position
set smartcase                   " ignore case if search pattern is all
                                " lowercase,case-sensitive otherwise
set showmatch                   " Show matching brackets when cursor is on them
set nowrapscan                  " stops the search at the end of the file
set hidden                      " buffer becomes hidden when abandoned
set tabstop=4                   " The width of a TAB is set to 4. Still it is
                                " a \t. It is just that Vim will interpret it
                                " to be having a width of 4
set shiftwidth=4                " Indents will have a width of 4
set softtabstop=4               " Sets the number of columns for a TAB
set expandtab                   " Expand TABs to spaces
set clipboard=unnamed           " Share clipboard with Mac OSX
set listchars+=trail:␣,tab:>-
set nobomb                      " Remove UTF8 BOM
set encoding=utf-8              " vim buffer charset set to UTF-8
set fileencoding=utf-8          " default file encoding set to UTF-8

if &t_Co > 2 || has("gui_running")
    syntax on                   " Switch syntax highlighting on
    set hlsearch                " Highlights the last used search pattern
endif
if has('mouse')
    set mouse=a                 " Enable mouse
endif
if has("vms")
    set nobackup                " do not keep a backup file, use versions
    instead
else
    set backup                  " keep a backup file
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!
        autocmd VimEnter,BufNewFile,BufReadPost * silent!
        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78
        " :set list for PHP files
        autocmd FileType php setlocal list
        " Autoformat (with gq) with par
        autocmd FileType php setlocal formatprg=par\ -w80\ -T4
        autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
        autocmd FileType html,xhtml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
        autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
        "consider tpl files as html
        au BufNewFile,BufRead *.tpl set ft=html
        " When editing a file, always jump to the last known cursor position.
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif
        " auto-source .vimrc when it is saved
        autocmd! bufwritepost .vimrc source ~/.vimrc
    augroup END
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

" **** PLUGINS ***
filetype off                        " required
set rtp+=~/.vim/bundle/Vundle.vim   " set the runtime path to include Vundle
                                    " and initialize
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'       " let Vundle manage Vundle, required
Plugin 'vim-scripts/L9'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'pangloss/vim-javascript'    " Vastly improved Javascript indentation
                                    " and syntax support
Plugin 'tpope/vim-fugitive'         " Awesome Git plugin
Plugin 'rstacruz/sparkup'           " HTML generator
Plugin 'ctrlpvim/ctrlp.vim'         " Fuzzy file, buffer, mru, tag, etc finder
Plugin 'scrooloose/syntastic'       " Syntax checker
Plugin 'tpope/vim-commentary'       " Comment stuff in, comment stuff out
Plugin 'tpope/vim-surround'         " Quoting/Parenthesizing made simple
Plugin 'vim-scripts/ZoomWin'        " Zoom inside split with <C-o>
Plugin 'majutsushi/tagbar'          " Display tag in a window by scope
Plugin 'spf13/vim-autoclose'        " Autoclose quotes, brackets, etc.
Plugin 'mattn/webapi-vim'           " Vim interface to web APIs
Plugin 'mattn/gist-vim'             " Handle GitHub gists directly within vim
Plugin 'ervandew/supertab'          " <Tab> autocompletion
Plugin 'powerline/powerline'        " Fancy statusline
call vundle#end()

"enable powerline-status
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

set background=dark
hi IndentGuidesOdd  guibg=red   ctermbg=0
hi IndentGuidesEven guibg=green ctermbg=236

filetype plugin indent on

" Let vim-gist open browser after posting a Gist
let g:gist_open_browser_after_post = 1

" Let vim-gist show private Gist when using ':Gist -l'
let g:gist_show_privates = 1

" Fancy powerline symbols
let g:Powerline_symbols = "fancy"

" Do not sort tags by their name
let g:tagbar_sort = 0

" <Leader> key is ';'
let mapleader=";"
let g:mapleader=";"


" **** MAPPINGS ****

" Ctrl+n to call TagBar
map <C-n> :TagbarOpenAutoClose<CR>

"disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" move by visual line, not by wrapped line
nnoremap j gj
nnoremap k gk
nnoremap Q <nop>
