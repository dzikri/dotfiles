set mouse=""
set encoding=utf-8

set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set autochdir

map ; :
set number
imap jj <Esc>
cmap jj <c-c>
vmap v <Esc>
let g:mapleader=','

" Better search
set hlsearch
set incsearch
set ignorecase
set smartcase
map <CR> :nohl<cr>

" Cursors
set cursorline
set cursorcolumn


set title

filetype plugin on
call plug#begin('~/.config/nvim/plugged')

Plug 'dracula/vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  set runtimepath+=~/.config/nvim/plugged/deoplete.nvim/
  let g:deoplete#enable_at_startup = 1
  set runtimepath+=~/.config/nvim/snippets/
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
  if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
Plug 'pbogut/deoplete-elm'


Plug 'sheerun/vim-polyglot'
" Plug 'mxw/vim-jsx'
  " let g:jsx_ext_required = 0 " Allow JSX in normal JS files
" Plug 'pangloss/vim-javascript'
" Plug 'othree/javascript-libraries-syntax.vim'

" Plug 'skywind3000/asyncrun.vim'
"   augroup localneomake
"     autocmd bufwritepost *.js AsyncRun -post=checktime silent !prettier-standard-formatter % > /dev/null
"     autocmd bufwritepost *.jsx AsyncRun -post=checktime silent !prettier-standard-formatter % > /dev/null
"   augroup END

Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  set laststatus=2
  let g:airline_powerline_fonts = 1
  set noshowmode
  set statusline=%=&P\ %f\ %m
  set fillchars=vert:\ ,stl:\ ,stlnc:\ 
  let g:airline_theme='tomorrow'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  map <leader>f :Files<cr>
  map <C-P> :GFiles<cr>
  map <C-B> :Buffer<cr>
Plug 'luochen1990/rainbow'
  let g:rainbow_active = 1

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
  let g:neosnippet#enable_snipmate_compatibility = 1
  let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

  " Plugin key-mappings.
  imap <C-j>     <Plug>(neosnippet_expand_or_jump)
  smap <C-j>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-j>     <Plug>(neosnippet_expand_target)

  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

Plug 'aaren/arrowkeyrepurpose'
Plug 'tpope/vim-unimpaired'
  " Bubble single line
  nmap <A-k> [e
  nmap <A-j> ]e

  " Bubble multiple line
  vmap <A-k> [egv
  vmap <A-j> ]egv

Plug 'elmcast/elm-vim'
  let g:polyglot_disabled = ['elm']
  let g:elm_detailed_complete = 1
  let g:elm_format_autosave = 1
  let g:elm_syntastic_show_warnings = 1
  autocmd Filetype elm setlocal ts=4 sw=4 sts=0 expandtab

" Plug 'morhetz/gruvbox'
"   let g:gruvbox_italic = 1
"   let g:gruvbox_contrast_light = 'hard'
" Plug 'ryanoasis/vim-devicons'
"   set guifont=FuraCode\ Nerd\ Font:h22
"   let g:airline_powerline_fonts = 1
Plug 'EinfachToll/DidYouMean'

Plug 'noahfrederick/vim-hemisu'
Plug 'tpope/vim-eunuch'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'lifepillar/vim-solarized8'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
Plug 'reedes/vim-colors-pencil'
Plug 'reedes/vim-pencil'
Plug 'ap/vim-css-color'
" Plug 'minodisk/nvim-finder', { 'do': ':FinderInstallBinary' }
Plug 'trevordmiller/nova-vim'
Plug 'w0rp/ale'
  let g:ale_sign_error = '●'
  let g:ale_sign_warning = '.'
  let g:ale_lint_on_enter = 0
  let g:ale_fixers = {'javascript': ['prettier_standard'], 'elixir': []}
  let g:ale_linters = {'javascript': ['standard'], 'elixir': ['dogma']}
  let g:ale_fix_on_save = 1
  let g:ale_history_log_output=1
  autocmd! BufWritePost * ALELint
  set autoread
  autocmd BufWritePost *.exs silent :!mix format %
  autocmd BufWritePost *.ex silent :!mix format %
Plug 'NLKNguyen/papercolor-theme'
Plug 'slashmili/alchemist.vim'
Plug 'easymotion/vim-easymotion'
  map <Leader>' <Plug>(easymotion-prefix)
call plug#end()


" Persistence undo
set undodir=~/.config/nvim/undodir
set undofile

" Theming
set background=dark
syntax enable
" colorscheme dracula
" colorscheme gruvbox
" colorscheme solarized8_light_high
colorscheme PaperColor
" colorscheme Tomorrow
" colorscheme nova

hi vertsplit ctermfg=238 ctermbg=235
hi LineNr ctermfg=237
hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=235
" hi EndOfBuffer ctermfg=237 ctermbg=235


set completeopt=longest,menuone,preview

" Automatic reloading .vimrc
autocmd! bufwritepost *.vim source %

" Automatic fixing indentation
" autocmd! bufwritepost *.js :normal ma gg=G 'a

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Switch between the last two files
nnoremap <leader><leader> <c-^>
set autowrite

set pastetoggle=<F2>
set clipboard=unnamed
"
" This turns off Vim’s crazy default regex characters and makes searches use normal regexes.
nnoremap / /\v
vnoremap / /\v

" Every unnecessary keystroke that can be saved is good for your health :)
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-k>
nnoremap <C-L> <C-W><C-L>

" Italic
highlight Comment gui=italic
highlight Comment cterm=italic
highlight htmlArg gui=italic
highlight htmlArg cterm=italic

" Show highlighting group for current word
nmap <C-A-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

