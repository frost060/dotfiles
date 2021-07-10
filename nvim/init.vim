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

syntax on
set ma
set mouse=a
set cursorline
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoread
set nobackup
set nowritebackup
set noswapfile
set nu 
set rnu
set foldlevelstart=99
set scrolloff=7
"use y and p with the system clipboard
set clipboard=unnamedplus
set encoding=UTF-8

let g:coc_disable_startup_warning=1
inoremap jk <Esc>

call plug#begin('~/.neovim_data/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'tpope/vim-surround'

Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-fugitive'

Plug 'elixir-editors/vim-elixir'

Plug 'mhinz/vim-mix-format'

" Colorschems
Plug 'arzg/vim-colors-xcode'

Plug 'sheerun/vim-polyglot'

Plug 'phaazon/hop.nvim'

Plug 'rhysd/vim-grammarous'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'kyazdani42/nvim-web-devicons'

Plug 'tjdevries/colorbuddy.vim'
Plug 'tjdevries/gruvbuddy.nvim'
Plug 'tjdevries/cyclist.vim'

Plug 'folke/tokyonight.nvim'
Plug 'akinsho/nvim-bufferline.lua'

Plug 'TimUntersberger/neogit'

Plug 'hoob3rt/lualine.nvim'

call plug#end()

filetype indent on
filetype plugin on

set termguicolors
set background=dark
lua require('colorbuddy').colorscheme('gruvbuddy')
highlight Comment cterm=italic gui=italic

let mapleader = ","
set pastetoggle=<F2>
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>
noremap <Leader>e :quit<CR>
noremap <Leader>w :bw<CR>

map <C-c> "+y

let g:airline_powerline_fonts = 1
set rtp+=/usr/local/opt/fzf

let g:fzf_preview_window = 'right:60%'
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'down': '~30%' }

let g:ackprg = 'ag --nogroup --nocolor --column'


nnoremap <silent> <Leader>f :Ag<CR>
"nnoremap <silent> <Leader>l :Files<CR>
"nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>c :Colors<CR>
nnoremap <silent> <Leader>h :History<CR>

nnoremap <silent> <Leader>d :CocCommand<CR>

"NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
map <leader>fr :NERDTreeFind<cr>

"""COC VIM"""
" CoC extensions
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-pairs',
  \ 'coc-highlight',
  \ 'coc-java',
  \ 'coc-json',
  \ ]

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Show autocomplete when Tab is pressed
inoremap <silent><expr> <Tab> coc#refresh()

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

let g:airline#extensions#tabline#enabled = 1

"""TREESITTER"""
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

"""TELESCOPE"""
nnoremap <leader>l <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>
nnoremap <leader>t <cmd>Telescope<cr>
nnoremap <leader>gs <cmd>Telescope git_status<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>

lua << EOF
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {"target" ,"target/", "node_modules/**", ".git/**"},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}

require("bufferline").setup{}
require('neogit').setup{}

EOF


"call cyclist#add_listchar_option_set('limited', {
        "\ 'eol': '↲',
        "\ 'tab': '→ ',
        "\ 'trail': '·',
        "\ 'extends': '<',
        "\ 'precedes': '>',
        "\ 'conceal': '┊',
        "\ 'nbsp': '␣',
        "\ })

call cyclist#set_tab('default', '→ ')

set inccommand=split

nnoremap <leader>ng <cmd>Neogit<cr>
