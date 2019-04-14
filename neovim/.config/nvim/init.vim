" Plugins {{
call plug#begin()
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'airblade/vim-gitgutter'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'jiangmiao/auto-pairs'
	Plug 'junegunn/goyo.vim'
	Plug 'justinmk/vim-sneak'
	Plug 'mhinz/vim-startify'
	Plug 'sheerun/vim-polyglot'
	Plug 'tmux-plugins/vim-tmux-focus-events'
	Plug 'tpope/vim-commentary'
	Plug 'w0rp/ale'
	Plug 'wellle/tmux-complete.vim'
	Plug 'zchee/deoplete-jedi'
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
set ignorecase
set smartcase
set gdefault
set scrolloff=4
set textwidth=0
set list listchars=eol:$,tab:≻-,space:⋅,trail:~,extends:>,precedes:<,nbsp:+
set inccommand=split
set nomodeline
" }}

" Wrap {{
set wrap
set linebreak
set breakindent
set showbreak=>\
set cpoptions+=n
" }}

" Not Wrap {{
" set nowrap
" set sidescroll=1
" set sidescrolloff=8
" }}

" Mappings {{
nmap <Leader>n :noh<CR>:pc<CR>
nmap <Leader>s :update<CR>
nmap <Leader>x :q<CR>
nmap <Leader>= :ALEFix<CR>
nmap <Leader>g :Goyo<CR>
" }}

" Colors {{
set termguicolors
colorscheme alduin
" }}

" ALE {{
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {
\	'*': ['remove_trailing_lines', 'trim_whitespace'],
\	'python': ['isort', 'black'],
\}
let g:ale_python_isort_options = '-lai 2'
let g:ale_python_black_options = '-l 79'
" }}

" vim-gitgutter {{
set updatetime=100
" }}

" deoplete {{
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('camel_case', v:true)
" }}

" tmux-complete {{
let g:tmuxcomplete#trigger = ''
" }}
