" Plugins
call plug#begin('~/.local/share/nvim/plugged')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'airblade/vim-gitgutter'
	Plug 'arcticicestudio/nord-vim'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'jiangmiao/auto-pairs'
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	Plug 'sheerun/vim-polyglot'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'w0rp/ale'
	Plug 'wellle/tmux-complete.vim'
	Plug 'zchee/deoplete-jedi'
call plug#end()

" Basics
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

" Wrapping
set linebreak
set breakindent
let &showbreak = '+++ '
set cpoptions+=n
set sidescrolloff=8

" Mappings
nmap - :Explore<CR>
nmap <Leader>= :ALEFix<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>r :Rg<CR>
nmap <Leader>s :update<CR>
nmap <Leader>x :q<CR>

" Colors
set termguicolors
colorscheme nord

" ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {
\	'*': ['remove_trailing_lines', 'trim_whitespace'],
\	'python': ['isort', 'black'],
\	'javascript': ['prettier'],
\	'html': ['prettier'],
\	'css': ['prettier'],
\}
let g:ale_python_isort_options = '-lai 2'
let g:ale_python_black_options = '-l 79'

" deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('camel_case', v:true)

" netrw
let g:netrw_banner = 0
let g:netrw_dirhistmax = 0
let g:netrw_liststyle = 3

" tmux-complete
let g:tmuxcomplete#trigger = ''

" vim-gitgutter
set updatetime=100
