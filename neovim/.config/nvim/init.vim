" plugins
call plug#begin('~/.local/share/nvim/plugged')
	Plug 'airblade/vim-gitgutter'
	Plug 'ap/vim-css-color'
	Plug 'arcticicestudio/nord-vim'
	Plug 'dense-analysis/ale'
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-surround'
	Plug 'wellle/tmux-complete.vim'
call plug#end()

" basics
set number relativenumber
set cursorline
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

" russian keyboard
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" wrapping
set linebreak
set breakindent
let &showbreak = '+++ '
set cpoptions+=n
set sidescrolloff=8

" mappings
nmap - :Explore<CR>
nmap <Leader>s :Sexplore<CR>
nmap <Leader>v :Vexplore!<CR>
nmap <Leader>t :Texplore<CR>
nmap <Leader>= <Plug>(ale_fix)
nmap <Leader>g <Plug>(ale_go_to_definition)
nmap <Leader>b :Buffers<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>r :Rg<CR>
nmap <Leader>c :setlocal spell spelllang=en,ru<CR>

" indentation
autocmd FileType html setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType css setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType markdown setlocal expandtab shiftwidth=4 softtabstop=4

" colors
set termguicolors
colorscheme nord

" plugin: ale
let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 0
let g:ale_fixers = {
\	'*': ['remove_trailing_lines', 'trim_whitespace'],
\	'go': ['gofmt', 'goimports'],
\	'c': ['clang-format'],
\	'cpp': ['clang-format'],
\	'python': ['isort', 'black'],
\	'javascript': ['prettier'],
\	'html': ['prettier'],
\	'css': ['prettier'],
\}
let g:ale_c_clangformat_options = '-style="{BasedOnStyle: LLVM, IndentWidth: 8, UseTab: Always, BreakBeforeBraces: Linux, AllowShortIfStatementsOnASingleLine: false, IndentCaseLabels: false}"'

" plugin: vim-gitgutter
set updatetime=100
