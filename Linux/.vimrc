"=========================================================
"        _                    
" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|
"                             
"=========================================================

" <CR>                               == Enter
" <LEADER>                           == switch to <space>
" <left>                             == <-
" <right>                            == ->
" <up>                               == ^
" <down>                             == v
" <C-t>                              == ctrl+t


" change leader to <space>
"let mapleader=" "
let mapleader="\<space>"


" for plugins
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on


" avoid different terminal causing exception
let &t_ut=''





" ================================= set option ================================
" show the number of each line
set number
set relativenumber


" show the current line through a cursor line
set cursorline


" complete the command through tab
set wildmenu


" highlight the keywords you searched
set hlsearch

" avoid to highlight the lastest keyword you searched in the next open file
" It seems to be unnecessary. I do not know
"exec "nohlsearch"

" highlight (and jump to) the keyword you searched
set incsearch

" jump to the next or the last
" +: the next one
" -: the last one
noremap + nzz
noremap - Nzz

" clear highlight
noremap <LEADER>c :nohlsearch<CR>


" enable your mouse
set mouse=a


" tab
set tabstop=4
set shiftwidth=4
set softtabstop=4


" turn on the syntax prompt
syntax on





" ================================= save && quit ================================
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





" ================================ split option ==============================
" split vertically, cursor in left
map <LEADER><left> :set nosplitright<CR>:vsplit<CR>

" split vertically, cursor in right
map <LEADER><right> :set splitright<CR>:vsplit<CR>

" loop jump in split, ctrl+w+w
" switch NERDTree to code window also through it
" NERDTree likes a split
map ll <C-w>w

" resize the split window
" ctrl+.   &   ctrl+,
map > :vertical resize-5<CR>
map < :vertical resize+5<CR>





" ================================ tab(new file) =============================
" create a new tab
map t<LEADER> :tabe<CR>

" jump to the left tab
map t<left> :-tabnext<CR>

" jump to the right tab
map t<right> :+tabnext<CR>


" !!!!!  using :w <path/tabname> to save the new tab  !!!!!
" !!!!!  avoid the conflict of NERDTree !!!!!


" ================================ vim plug  =================================
call plug#begin()

" usage: status line in the bottom
Plug 'vim-airline/vim-airline'

" usage: a nice scheme
Plug 'morhetz/gruvbox'

" usage: underline the same words
Plug 'itchyny/vim-cursorword'

" usage: a powerful file tree
Plug 'preservim/nerdtree'

" usage: show file status in git
Plug 'Xuyuanp/nerdtree-git-plugin'

" usage: a focus mode
Plug 'junegunn/goyo.vim'

" usage: complete code
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()





" ================================== scheme  =================================
colorscheme gruvbox
set bg=dark





" ==================================== NERDTree  ====================================
" close the NERDTree. make goyo convenient
nnoremap tt :NERDTreeClose<CR>

" open the NERDTree. open file will open NERDTree automatically
nnoremap to :NERDTree<CR>

" find current file in NERDTree
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





" ================================== coc extension ===================================
let g:coc_global_extensions = [
	\ 'coc-json',
	\ 'coc-clangd',
	\ 'coc-cmake',
	\ 'coc-highlight',
	\ 'coc-copilot',
	\ 'coc-vimlsp']

" improve user experience
set updatetime=100

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-o>(ctrl+o) to trigger completion
inoremap <silent><expr> <c-o> coc#refresh()


" Use `[[` and `]]` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [[ <Plug>(coc-diagnostic-prev)
nmap <silent> ]] <Plug>(coc-diagnostic-next)


" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


