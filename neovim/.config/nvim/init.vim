" plugins
call plug#begin('~/.local/share/nvim/plugged')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'SidOfc/mkdx'
	Plug 'airblade/vim-gitgutter'
	Plug 'ap/vim-css-color'
	Plug 'arcticicestudio/nord-vim'
	Plug 'carlitux/deoplete-ternjs'
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	Plug 'sheerun/vim-polyglot'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-surround'
	Plug 'w0rp/ale'
	Plug 'wellle/tmux-complete.vim'
	Plug 'zchee/deoplete-jedi'
call plug#end()

" basics
set number relativenumber
set cursorline
set colorcolumn=80
set nohlsearch
set ignorecase
set smartcase
set gdefault
set scrolloff=4
set inccommand=split
set nomodeline
set splitbelow splitright
set hidden
set list listchars=tab:>-,trail:~,extends:>,precedes:<,nbsp:+
set clipboard+=unnamedplus

" wrapping
set linebreak
set breakindent
let &showbreak = '+++ '
set cpoptions+=n
set sidescrolloff=8

" mappings
nmap - :Explore<CR>
nmap <Leader>= :ALEFix<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>r :Rg<CR>
nmap <Leader>s :update<CR>
nmap <Leader>x :q<CR>

" indentation
autocmd FileType html setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType css setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType markdown setlocal expandtab shiftwidth=4 softtabstop=4

" colors
set termguicolors
colorscheme nord

" plugin: ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {
\	'*': ['remove_trailing_lines', 'trim_whitespace'],
\	'python': ['isort', 'black'],
\	'javascript': ['prettier'],
\	'html': ['prettier'],
\	'css': ['prettier'],
\}

" plugin: deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('camel_case', v:true)

" plugin: mkdx
let g:mkdx#settings = {
\	'highlight': {'enable': 1},
\	'enter': {'shift': 1},
\	'links': {'external': {'enable': 1}},
\	'toc': {'text': 'Table of Contents', 'update_on_write': 1},
\	'fold': {'enable': 1},
\	'map': {'prefix': '<leader><leader>'}
\}
let g:polyglot_disabled = ['markdown']

" plugin: netrw
let g:netrw_banner = 0
let g:netrw_dirhistmax = 0
let g:netrw_liststyle = 3

" plugin: tmux-complete
let g:tmuxcomplete#trigger = ''

" plugin: vim-gitgutter
set updatetime=100
