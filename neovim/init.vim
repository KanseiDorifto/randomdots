" NeoVim configuration file for programming (mainly C++)
" 80% of this config has been done by Joe L. Wroten
" Link to his awesome tutorial: https://wrotenwrites.com/a_modern_terminal_workflow_1/

" Set standard file encoding

set encoding=utf8

" No special per file vim override configs

set nomodeline

" Stop word wrapping

set nowrap

" Except... on Markdown. That's good stuff.

autocmd FileType markdown setlocal wrap

" Adjust system undo levels

set undolevels=100

" Use system clipboard

set clipboard=unnamed

" Set tab width and convert tabs to spaces

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Don't let Vim hide characters or make loud dings

set conceallevel=1
set noerrorbells

" Number gutter

set number

" Space above/beside cursor from screen edges

set scrolloff=1
set sidescrolloff=5

" Minimal number of screen lines to keep above and below the cursor.

set scrolloff=999

let mapleader="\<SPACE>"

nmap <Leader><Leader> <c-^>

nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR><Paste>

call plug#begin('~/.local/share/nvim/plugged')

" SuperTab for popup lists

Plug 'ervandew/supertab'

" Shows tags in current file

Plug 'majutsushi/tagbar'

" Gruvbox colorsheme

Plug 'morhetz/gruvbox'

" Resource for plugins to open panels and other temporary interfaces onscreen

Plug 'Shougo/unite.vim'

" Plug-in to show information about files in a git repository

Plug 'airblade/vim-gitgutter'

" This plugin and config will show current mode, current file path, % scrolled
" through file, tabs for current buffers, and more

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Uses Ag’s speed combined with NeoVim’s async abilities to provide a fast way
" to find code anywhere in your project or buffers

Plug 'mhinz/vim-grepper'

" File tree explorer 

Plug 'Shougo/vimfiler.vim', { 'on': 'VimFiler' }

" Autocomplete

Plug 'valloric/youcompleteme'

" Snippet Management

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Code linting

Plug 'w0rp/ale'

" Code jumping and sneaking

Plug 'justinmk/vim-sneak'

call plug#end()

filetype plugin indent on 

" Turn on GruvBox theme

colors gruvbox
set background=dark  

nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

" Airline config

let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
set laststatus=2
let g:indentLine_enabled = 1
let g:indentLine_char = "⟩"

nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>t :CtrlP<CR>

" Toggle Tagbar with Space+F12
" Close it with F12

nnoremap <leader><F12> :TagbarOpenAutoClose<cr>
nnoremap <F12> :TagbarClose<cr>

" Grepper keymaps

nnoremap <Leader>fp :Grepper<Space>-query<Space>
nnoremap <Leader>fb :Grepper<Space>-buffers<Space>-query<Space>-<Space>

" Opening filetree with VimFiler by ` or ~

map ~ :VimFiler -explorer<CR>
map ` :VimFilerCurrentDir -explorer -find<CR>

"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Vim-sneak key mapping

let g:sneak#s_next = 1
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

" To save, press ctrl-s.

nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" Turn off Ale highlighting

highlight ALEWarning ctermbg=DarkGray

" YCM and UltiSnips keybinds

let g:ycm_global_ycm_extra_conf = '${HOME}/.local/share/nvim/plugged/youcompleteme/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" build using makeprg with <F7>

map <F7> :make<CR>

" compile using makeprg with <F8>

map <F8> :make run<CR>

" clean make with <F9>

map <F9> :make clean<CR>

