syntax enable

set background=dark
colorscheme solarized
set guifont=Monaco:h12

set number
set smartindent
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'

filetype on
filetype plugin on
filetype plugin indent on

autocmd FileType ruby set tabstop=2|set shiftwidth=2
autocmd FileType make setlocal noexpandtab

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:FuzzyFinderOptions = { 'Base':{}, 'Buffer':{}, 'File':{}, 'Dir':{}, 'MruFile':{}, 'MruCmd':{}, 'Tag':{}, 'TaggedFile':{}}
let g:FuzzyFinderOptions.File.excluded_path = '\v\~$|\.o$|\.DS_Store$|\.jpg$|\.gif$|\.png$|\.bak$|\.swp$|\.git$|\.svn$|gen|\.git|\.gradle|build/'

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

map ,f :CtrlPMixed<CR>

map ,bi :Bundle install<CR>
map ,dbm :Rake db:migrate<CR>

highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted
"use :set list! to toggle visible whitespace on/off
set listchars=tab:>-,trail:.,extends:>

nmap <silent> <leader>l :set list!<CR>
map ,ws :%s/\s\+$//e<CR>

map ,gp :Gist -p<CR>
map ,gst :Gist<CR>
map ,ga :Gist -a<CR>
noremap ,bc :s#^#//<CR>
noremap ,cf :echo expand("%:p")<CR>

noremap ,nt :NERDTreeToggle<CR>

set backupdir=~/.vim/backup/
set directory=~/.vim/backup/
