" Vim-plug loader 
if empty(glob('~/.vim/autoload/plug.vim'))
silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'ervandew/supertab'
Plug 'AndrewRadev/switch.vim'
Plug 'EinfachToll/DidYouMean'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'hashivim/vim-terraform'
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

" Disable comment on new line Not really working.... 
augroup no_coments_oO
    autocmd!
    autocmd BufEnter * set formatoptions-=r
    autocmd BufEnter * set formatoptions-=o
augroup END


" Vim Ultisnips
let g:UltiSnipsExpandTrigger="<S-tab>"


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
