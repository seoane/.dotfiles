" Vim-plug loader
if empty(glob('~/.vim/autoload/plug.vim'))
silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/switch.vim'
Plug 'SirVer/ultisnips' " S+Tab
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'tommcdo/vim-exchange'

" Keyless Plugin
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'ervandew/supertab'
Plug 'cohama/lexima.vim'
Plug 'EinfachToll/DidYouMean'
Plug 'sheerun/vim-polyglot'
Plug 'honza/vim-snippets'
Plug 'wincent/terminus'
Plug 'ntpeters/vim-better-whitespace'
Plug 'hashivim/vim-terraform'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'gko/vim-coloresque'
Plug 'junegunn/vim-easy-align'
Plug 'luochen1990/rainbow'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-markdown'
Plug 'nanotech/jellybeans.vim'
Plug 'chrisbra/colorizer'
call plug#end()
la

" Switch

" Source https://github.com/Skardian/.dotfiles/
let g:switch_mapping = "-"
augroup my_switch_group
    autocmd!
    autocmd FileType terraform let b:switch_custom_definitions =
                \ [
                \   {
                \     '\(\s\+source\s\+=\)\s\+"git::ssh://\([^/]*\)/\([^/]*\)/\([^?]*\)\(?ref.*\)*"': '\1 "../../terraform-modules/\4" # \2/\3/\4\5',
                \     '\(\s\+source\s\+=\)\s\+".*/terraform-modules/[^ ]*\s*#\s\+\(.*\)': '\1 "git::ssh://\2"',
                \   },
                \ ]
augroup end


" Vim Commentary

" Disable comment on new line
augroup no_coments_oO
    autocmd!
    autocmd BufEnter * set formatoptions-=r
    autocmd BufEnter * set formatoptions-=o
augroup END


" Vim Ultisnips
let g:UltiSnipsExpandTrigger="<S-tab>"

" Vim Gitgutter


nmap <silent> gnh <Plug>GitGutterNextHunk
nmap <silent> gph <Plug>GitGutterPrevHunk
nmap <silent> gsh <Plug>GitGutterStageHunk
nmap <silent> guh <Plug>GitGutterUndoHunk


" Vim better-whitespace
let g:better_white_space_enabled=1
let g:strip_whitespace_on_save=1


" Vim indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 1


" Vim Colorschemes
colorscheme jellybeans " Dark

" Undo File
" Store undo info inside .vim/undo
if exists("+undofile")
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=~/.vim/undo//
  set undofile
endif


" Vim easy-align
nmap ga <Plug>(LiveEasyAlign)
xmap ga <Plug>(LiveEasyAlign)
xmap <Enter> <Plug>(LiveEasyAlign)

" Vim Settings

" General Settings
set encoding=utf-8
set number
set backspace=indent,eol,start
set listchars=eol:↲,tab:▶\ ,extends:>,precedes:<

" Tab Settings
set expandtab
set smartindent
set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
