" Plugins {{
call plug#begin('~/.local/share/nvim/plugged')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'airblade/vim-gitgutter'
	Plug 'jiangmiao/auto-pairs'
	Plug 'preservim/nerdtree'
	Plug 'sheerun/vim-polyglot'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'w0rp/ale'
	Plug 'zchee/deoplete-jedi'
	" Tmux {{
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'wellle/tmux-complete.vim'
	" }}
	" Colorscheme {{
	Plug 'AlessandroYorba/Alduin'
	" }}
call plug#end()
" }}

" Options {{
set ruler
set number relativenumber
set cursorline
set colorcolumn=80
set noexpandtab
set tabstop=8
set shiftwidth=8
set nohlsearch
set ignorecase
set smartcase
set gdefault
set scrolloff=4
set textwidth=0
set inccommand=split
set nomodeline
set splitbelow splitright
" set list listchars=eol:$,tab:≻-,space:⋅,trail:~,extends:>,precedes:<,nbsp:+
" }}

" Wrap {{
set wrap
set linebreak
set breakindent
set showbreak=>\
set cpoptions+=n
" }}

" No Wrap {{
" set nowrap
" set sidescroll=1
" set sidescrolloff=8
" }}

" Mappings {{
nmap <Leader>= :ALEFix<CR>
nmap <Leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <Leader>s :update<CR>
nmap <Leader>x :q<CR>
" }}

" Colors {{
set termguicolors
colorscheme alduin
" }}

" ale {{
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
" }}

" deoplete {{
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('camel_case', v:true)
" }}

" tmux-complete {{
let g:tmuxcomplete#trigger = ''
" }}

" vim-gitgutter {{
set updatetime=100
" }}
