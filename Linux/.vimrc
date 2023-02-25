"=========================================================
"        _                    
" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|
"                             
"=========================================================






" change leader to <space>
let mapleader=" "


" for plugins
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on


" avoid different terminal causing exception
let &t_ut=''





" ================================= set property ================================
" show the number of each line
set number
set relativenumber


" show the current line by a cursor line
set cursorline


" complete the :command by tab
set wildmenu


" highlight your searching
set hlsearch

" avoid highlight the lastest searching in the next open file
exec "nohlsearch"

" highlight while you are searching
set incsearch

" jump to your searching
" +: the next one
" -: the last one
noremap + nzz
noremap - Nzz

" clear the highlight result
noremap <LEADER>c :nohlsearch<CR>


" enable the mouse
set mouse=a


" tab
set tabstop=4
set shiftwidth=4
set softtabstop=4


" turn on the syntax prompt
syntax on





" ================================= basic configuration ================================
" save and quit
map ww :wq<CR>

" quit without saving
map qq :q!<CR>

" save only
map W :w<CR>

" quit only
map Q :q<CR>

" refresh .vimrc ---> it does not work
"map R :source $MYVIMRC<CR>





" =================================== split option =================================
" vertically split, cursor in left
map <LEADER><left> :set nosplitright<CR>:vsplit<CR>

" vertically split, cursor in right
map <LEADER><right> :set splitright<CR>:vsplit<CR>

" loop jumps in split, ctrl+w+w
" switch NERDTree to code window by it also
map ll <C-w>w

" resize the split window
" ctrl+.   &   ctrl+,
map > :vertical resize-5<CR>
map < :vertical resize+5<CR>


" NERDTree likes a split


" =================================== tab(new file) =================================
" open a new tab
map <LEADER>t :tabe<CR>

" jump to the left tab
map t<left> :-tabnext<CR>

" jump to right left tab
map t<right> :+tabnext<CR>


" !!!!!  using :w <path/tabname> to save the new tab  !!!!!
" !!!!!  avoid the conflict of NERDTree !!!!!


" =================================== vim plug  ====================================
call plug#begin()

" status line
Plug 'vim-airline/vim-airline'

" a scheme
Plug 'morhetz/gruvbox'

" show an underline under each same words
Plug 'itchyny/vim-cursorword'

" file tree
Plug 'preservim/nerdtree'

" show git status
Plug 'Xuyuanp/nerdtree-git-plugin'

" goyo, a focus mode
Plug 'junegunn/goyo.vim'

call plug#end()





" ==================================== scheme  ====================================
colorscheme gruvbox
set bg=dark





" ==================================== NERDTree  ====================================
" jump by ll(ctrl+w+w)
"nnoremap <leader>n :NERDTreeFocus<CR>

" open the NERDTree
nnoremap tt :NERDTree<CR>

"nnoremap <C-t> :NERDTreeToggle<CR>

" open the path of current file in NERDTree
nnoremap tf :NERDTreeFind<CR>

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif





" ================================== NERDTree-git ===================================
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }





" ================================== goyo(focus) ===================================
" turn on the Goyo
map <LEADER>gy :Goyo<CR>

" turn off the Goyo
map <LEADER>gg :Goyo!<CR>

