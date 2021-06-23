set path+=**

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

let g:coc_disable_startup_warning=1
inoremap jk <Esc>

call plug#begin('~/.neovim_data/plugged')

Plug 'lifepillar/vim-gruvbox8'

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'sickill/vim-monokai'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'altercation/vim-colors-solarized'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-surround'

Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'

Plug 'joshdick/onedark.vim'

Plug 'jiangmiao/auto-pairs'

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'

Plug 'liuchengxu/vim-which-key'

call plug#end()

set incsearch
set ignorecase
set smartcase
set nohlsearch
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4
set nobackup
set noswapfile
set nowrap
set mouse=a
set bs=2
set nu

set background=dark
colorscheme gruvbox-material


let mapleader = ","
set pastetoggle=<F2>
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>
noremap <Leader>e :quit<CR>
noremap <Leader>w :bw<CR>

map <C-c> "+y

set listchars=tab:\|\ 
set list

let g:airline_powerline_fonts = 1
set rtp+=/usr/local/opt/fzf


let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_layout = { 'down': '~30%' }

let g:ackprg = 'ag --nogroup --nocolor --column'

" CoC extensions
let g:coc_global_extensions = ['coc-solargraph', 'coc-tsserver', 'coc-json', 'coc-java', 'coc-vetur', 'coc-deno']

nnoremap <silent> <Leader>f :Ag<CR>
nnoremap <silent> <Leader>l :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>c :Colors<CR>
nnoremap <silent> <Leader>h :History<CR>

nnoremap <silent> <Leader>d :CocCommand<CR>

lua <<EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = {"java", "javascript", "typescript", "elixir"},
	highlight = {
		enable = true,              -- false will disable the whole extension
	},
}

require'nvim-treesitter.configs'.setup {
	playground = {
		enable = true,
		disable = {},
		updateTime = 25,
		persist_queries = false
	}
}
EOF

" toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
map <leader>fr :NERDTreeFind<cr>


" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Show autocomplete when Tab is pressed
inoremap <silent><expr> <Tab> coc#refresh()

" Source Vim configuration file and install plugins
nnoremap <silent> <leader>1 :source ~/.vimrc \| :PlugInstall<CR>

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

nnoremap <silent> <leader> :<c-u> WhichKey ','<CR>

set updatetime=300

let g:airline#extensions#tabline#enabled = 1

augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

nnoremap <leader>gs :Gstatus<CR>


