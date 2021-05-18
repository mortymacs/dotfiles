" general
filetype off                 " required
syntax on
set mouse-=a
set number
set cursorline
set nocompatible             " be iMproved, required
set termguicolors            " enable true colors support
set nowrap
"" source: https://stackoverflow.com/a/11560415/2338672
set backspace=2
set updatetime=500
set hidden
set nobackup
set nowritebackup
set updatetime=300
filetype plugin on

" package management
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'preservim/nerdtree'
Plugin 'preservim/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ayu-theme/ayu-vim'
Plugin 'tpope/vim-surround'
Plugin 'mileszs/ack.vim'
Plugin 'KabbAmine/zeavim.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'preservim/nerdcommenter'
Plugin 'fisadev/vim-isort'
Plugin 'psf/black'
Plugin 'alfredodeza/pytest.vim'
Plugin 'vim-test/vim-test'
Plugin 'stsewd/sphinx.nvim', { 'do': ':UpdateRemotePlugins' }
call vundle#end()            " required
filetype plugin indent on    " required

" https://stackoverflow.com/a/43595915/2338672
" https://stackoverflow.com/a/13854888/2338672
function! MapKeys(keys, rhs)
    for map_command in ['map', 'map!']
        execute map_command . a:keys '<esc>' . a:rhs
    endfor
endfunction

" theme
set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
colorscheme ayu
"" https://stackoverflow.com/a/15648665/2338672
set cmdheight=1

" powerline
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '
let g:airline_left_alt_sep = ' '
let g:airline_right_alt_sep = ' '

" coc.vim
"" source: https://github.com/neoclide/coc.nvim/issues/318#issuecomment-451331078
call MapKeys("<c-c><c-d>", ":call CocActionAsync('jumpDefinition')<cr>")
call MapKeys("<c-c><c-e>", "<c-o>")

" code indent
""" source: https://github.com/jelly/Dotfiles/blob/master/.vimrc
autocmd FileType python set expandtab shiftwidth=4 softtabstop=4
set cindent
set smartindent
set autoindent
set complete+=s

" fzf
call MapKeys("<c-x><c-f>", ":Files<cr>")
call MapKeys("<c-x><c-t>", ":Tags<cr>")
call MapKeys("<c-x><c-b>", ":Buffers<cr>")

" nerdtree
call MapKeys("<c-x><c-l>", ":NERDTreeToggle<cr>")
let g:NERDTreeIgnore=['\.pyc$', '\~$', 'venv', '.git', '__pycache__', '.tags']
let g:nerdtree_tabs_focus_on_files=1
"" https://stackoverflow.com/a/60465641/2338672
let NERDTreeCustomOpenArgs={'file':{'where': 't'}}

" tagbar
call MapKeys("<c-x><c-i>", ":TagbarToggle<cr>")

" window
"" https://vim.fandom.com/wiki/Maximize_window_and_return_to_previous_split_structure
function! MaximizeWindowToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction
call MapKeys("<c-x><c-m>", ":call MaximizeWindowToggle()<cr>")
call MapKeys("<c-x><c-v>", ":vsplit<cr>")
call MapKeys("<c-x><c-h>", ":split<cr>")
call MapKeys("<c-x><c-c>", ":close<cr>")
call MapKeys("<m-up>", "<c-w><c-k>")
call MapKeys("<m-down>", "<c-w><c-j>")
call MapKeys("<m-left>", "<c-w><c-h>")
call MapKeys("<m-right>", "<c-w><c-l>")
call MapKeys("<c-s-up>", ":resize -1<cr>")
call MapKeys("<c-s-down>", ":resize +1<cr>")
call MapKeys("<c-s-left>", ":vertical resize +1<cr>")
call MapKeys("<c-s-right>", ":vertical resize -1<cr>")

" buffer
call MapKeys("<c-x><c-e>", ":bd<cr>")

" clipboard
"" https://superuser.com/a/921975
vmap <c-c><c-c> y:call system("xclip -i -selection clipboard", getreg("\""))<cr>:call system("xclip -i", getreg("\""))<cr>
nmap <c-c><c-v> :call setreg("\"",system("xclip -o -selection clipboard"))<cr>p

" tabbar
let g:airline#extensions#tabline#enabled = 1
"" https://github.com/vim-airline/vim-airline/issues/1688#issuecomment-373459776
let g:airline_powerline_fonts = 1
call MapKeys("<s-right>", ":tabnext<cr>")
call MapKeys("<s-left>", ":tabprevious<cr>")

" general
call MapKeys("<c-x><c-s>", ":w<cr>")
call MapKeys("<c-x><c-q>", ":q<cr>")

" git
call MapKeys("<c-g><c-d>", "<plug>(GitGutterPreviewHunk)")
call MapKeys("<c-g><c-u>", "<plug>(GitGutterUndoHunk)")
call MapKeys("<c-g><c-l>", "<plug>(GitGutterStageHunk)")
" source: https://github.com/longsleep/bin-scripts/blob/master/config/vimrc
" auto wrap git commit messages
au FileType gitcommit set tw=72

" text
""source: https://stackoverflow.com/a/63887462/2338672
nnoremap <s-m-down> :m .+1<cr>==
nnoremap <s-m-up>   :m .-2<cr>==
inoremap <s-m-down> <esc>:m .+1<cr>==gi
inoremap <s-m-up>   <esc>:m .-2<cr>==gi
vnoremap <s-m-down> :m '>+1<cr>gv=gv
vnoremap <s-m-up>   :m '<-2<cr>gv=gv

" code
call MapKeys("<c-c><c-h>", "<plug>Zeavim")
""source: https://vim.fandom.com/wiki/Fix_indentation
call MapKeys("<c-c><c-r>", "gg=G<c-o><c-o>")
"" https://unix.stackexchange.com/a/75431/204066
autocmd BufWritePre * :%s/\s\+$//e
nnoremap <c-c><c-s> :call NERDComment('cc', 'toggle')<cr>
inoremap <c-c><c-s> :call NERDComment('cc', 'toggle')<cr>
vnoremap <c-c><c-s> :call NERDComment('cc', 'toggle')<cr>

" python
call MapKeys("<c-c><c-p>", ":!python %<cr>")
call MapKeys("<c-t><c-c>", ":Pytest class<cr>")
call MapKeys("<c-t><c-m>", ":Pytest method<cr>")
call MapKeys("<c-t><c-f>", ":Pytest function<cr>")
call MapKeys("<c-t><c-a>", ":Pytest file<cr>")
" python - isort
let g:vim_isort_map = ''
call MapKeys("<c-c><c-i>", ":Isort<cr>")
autocmd BufWritePre *.py execute ':Isort'
" python - black
call MapKeys("<c-c><c-r>", ":Black<cr>")
autocmd BufWritePre *.py execute ':Black'
