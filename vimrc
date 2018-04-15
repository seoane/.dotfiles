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
call plug#end()


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
