" Plugins {{
call plug#begin()
	Plug 'AlessandroYorba/Alduin'
	Plug 'mhinz/vim-startify'
	Plug 'justinmk/vim-sneak'
	Plug 'sheerun/vim-polyglot'
	Plug 'w0rp/ale'
	Plug 'airblade/vim-gitgutter'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'zchee/deoplete-jedi'
	Plug 'tmux-plugins/vim-tmux-focus-events'
	Plug 'wellle/tmux-complete.vim'
	Plug 'jiangmiao/auto-pairs'
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
" }}

" Wrapping {{
set wrap
set linebreak
set breakindent
set showbreak=>\
set cpoptions+=n
" }} or {{
" set nowrap
" set sidescroll=1
" set sidescrolloff=8
" }}

" Mappings {{
nmap <Leader>n :nohl<CR>
nmap <Leader>s :update<CR>
nmap <Leader>x :q<CR>
" }}

" Colors {{
set termguicolors
colorscheme alduin
" }}

" ALE {{
let g:ale_lint_on_text_changed = 'never'
let b:ale_linters = {'python': ['flake8']}
let b:ale_fixers = {'python': ['isort']}
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