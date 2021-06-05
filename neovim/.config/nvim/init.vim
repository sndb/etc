" plugins
call plug#begin(stdpath('data') . '/plugged')
	Plug 'airblade/vim-gitgutter'
	Plug 'ap/vim-css-color'
	Plug 'arcticicestudio/nord-vim'
	Plug 'dense-analysis/ale'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
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
set updatetime=50

" russian keyboard
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" wrapping
set linebreak
set breakindent
let &showbreak = '+++ '
set cpoptions+=n
set sidescrolloff=8

" mappings
nmap <Leader>= <Plug>(ale_fix)
" explore
nmap - :Explore<CR>
nmap <Leader>s :Sexplore<CR>
nmap <Leader>v :Vexplore!<CR>
nmap <Leader>t :Texplore<CR>
" fzf
nmap <Leader>b :Buffers<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>r :Rg<CR>
" quickfix
nmap <C-n> :cnext<CR>
nmap <C-p> :cprevious<CR>
nmap <Leader>c :cclose<CR>
" go
" use CTRL-T and CTRL-] for :GoDef
" use K for :GoDoc
autocmd FileType go nmap <Leader><Leader>b <Plug>(go-build)
autocmd FileType go nmap <Leader><Leader>r <Plug>(go-run)
autocmd FileType go nmap <Leader><Leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader><Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader><Leader>a <Plug>(go-alternate-edit)
autocmd FileType go nmap <Leader><Leader>d :GoDeclsDir<CR>

" indentation
autocmd FileType html setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType css setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType markdown setlocal expandtab shiftwidth=4 softtabstop=4

" colors
set termguicolors
colorscheme nord

" plugin: ale
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

" plugin: vim-go
let g:go_list_type = "quickfix"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
