" general
filetype off                 " required
syntax on
set mouse-=a
set number
set cursorline
set nocompatible             " be iMproved, required
set termguicolors            " enable true colors support
set nowrap
"" https://stackoverflow.com/a/2054674/2338672
set tabstop=4
set shiftwidth=4
set expandtab
"" https://stackoverflow.com/a/11560415/2338672
set backspace=2
set updatetime=500
set hidden
set nobackup
set nowritebackup
set updatetime=300
filetype plugin on
filetype plugin indent on    " required
"" https://superuser.com/a/35421/298390
set whichwrap+=<,>,[,]

" package management
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ayu-theme/ayu-vim'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
Plug 'KabbAmine/zeavim.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'preservim/nerdcommenter'
Plug 'stsewd/isort.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'psf/black'
Plug 'alfredodeza/pytest.vim'
Plug 'vim-test/vim-test'
Plug 'stsewd/sphinx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'voldikss/vim-floaterm'
Plug 'sotte/presenting.vim'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'npxbr/glow.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'luochen1990/rainbow'
Plug 'famiu/bufdelete.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'itchyny/vim-cursorword'
Plug 'sindrets/diffview.nvim'
Plug 'f-person/git-blame.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'dense-analysis/ale'
Plug 'romgrk/barbar.nvim'
call plug#end()

" Color
lua require'colorizer'.setup()
let g:rainbow_active = 1

" https://stackoverflow.com/a/43595915/2338672
" https://stackoverflow.com/a/13854888/2338672
function! MapKeys(keys, rhs)
  for map_command in ['map', 'map!']
    execute map_command . a:keys '<esc>' . a:rhs
  endfor
endfunction
function! NorMapKeys(keys, rhs)
  for normap_command in ['nnoremap', 'inoremap']
    execute normap_command . a:keys '<esc>' . a:rhs
  endfor
  execute 'vnoremap' . a:keys '' . a:rhs
endfunction

" theme
set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
colorscheme ayu
"" https://stackoverflow.com/a/15648665/2338672
set cmdheight=1
"" https://stackoverflow.com/a/37720708/2338672
hi Normal guibg=NONE ctermbg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

" powerline
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '
let g:airline_left_alt_sep = ' '
let g:airline_right_alt_sep = ' '

" terminal
let g:floaterm_title = "$1/$2"
let g:floaterm_height = 0.5
let g:floaterm_width = 1.0
let g:floaterm_position = "bottom"
let g:floaterm_wintype = "float"
let g:floaterm_autohide = 1
let g:floaterm_keymap_toggle = "<c-x><c-r>"
let g:floaterm_keymap_new = "<c-x><c-n>"
let g:floaterm_keymap_prev = "<c-x><c-left>"
let g:floaterm_keymap_next = "<c-x><c-right>"
let g:floaterm_keymap_kill = "<c-x><c-k>"
let g:floaterm_keymap_kill = "<c-x><c-up>"
let g:floaterm_opener = "tabe"
hi FloatermBorder ctermbg=black

" telescope
call MapKeys("<c-x><c-g>", ":Telescope live_grep<cr>")

" coc.vim
"" https://github.com/neoclide/coc.nvim/issues/318#issuecomment-451331078
call MapKeys("<c-c><c-d>", ":call CocActionAsync('jumpDefinition', 'drop')<cr>")
call MapKeys("<c-c><c-e>", "<c-o>")

" code indent
"" https://github.com/jelly/Dotfiles/blob/master/.vimrc
autocmd FileType python,cucumber set expandtab shiftwidth=4 softtabstop=4
autocmd FileType c,cpp,h,html,css,vim,yaml,json set expandtab shiftwidth=2 softtabstop=2
set cindent
set smartindent
set autoindent
set complete+=s
"" reformat the whole buffer
call MapKeys("<c-c><c-l>", "gg=G<cr>")
call MapKeys("<c-m-l>", "gg=G<cr>")

" fzf
"" https://github.com/universal-ctags/ctags/issues/218#issuecomment-72355190
let g:fzf_tags_command='fd | ctags --links=no -L-'
call MapKeys("<c-x><c-f>", ":Files<cr>")
call MapKeys("<c-x><c-t>", ":Tags<cr>")
call MapKeys("<c-x><c-b>", ":Buffers<cr>")

" nerdtree
call MapKeys("<c-x><c-l>", ":NERDTreeToggle<cr>")
let g:NERDTreeIgnore=['\.pyc$', '\~$', 'venv', '.git', '__pycache__', '.tags', 'tags']
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
call MapKeys("<c-x><c-e>", ":Bd!<cr>")

" clipboard
"" https://superuser.com/a/921975
vmap <c-c><c-c> y:call system("xclip -i -selection clipboard", getreg("\""))<cr>:call system("xclip -i", getreg("\""))<cr>
nmap <c-c><c-v> :call setreg("\"",system("xclip -o -selection clipboard"))<cr>p

" tabbar
" tabbar
let g:airline#extensions#tabline#enabled = 1
"" https://github.com/vim-airline/vim-airline/issues/1688#issuecomment-373459776
let g:airline_powerline_fonts = 1
call MapKeys("<s-right>", ":BufferNext<cr>")
call MapKeys("<s-left>", ":BufferPrevious<cr>")
call MapKeys("<c-x><c-q>", ":BufferClose<cr>")
call MapKeys("<m-1>", ":BufferGoto 1<cr>")
call MapKeys("<m-2>", ":BufferGoto 2<cr>")
call MapKeys("<m-3>", ":BufferGoto 3<cr>")
call MapKeys("<m-4>", ":BufferGoto 4<cr>")
call MapKeys("<m-5>", ":BufferGoto 5<cr>")
call MapKeys("<m-6>", ":BufferGoto 6<cr>")
call MapKeys("<m-7>", ":BufferGoto 7<cr>")
call MapKeys("<m-8>", ":BufferGoto 8<cr>")
call MapKeys("<m-9>", ":BufferGoto 9<cr>")
let bufferline = get(g:, 'bufferline', {})
let bufferline.animation = v:false
let bufferline.closable = v:false
let bufferline.clickable = v:false

" general
call MapKeys("<c-g>", "<esc>")
"" select
call MapKeys("<c-space>", "v")  " v$
call MapKeys("<m-space>", "v0o$")
call MapKeys("<c-x><c-s>", ":w<cr>")
call MapKeys("<c-@>", "v")
call MapKeys("<c-d>", "yyp")
"" https://stackoverflow.com/a/20579322/2338672
let s:presentation_enabled = 0
function! PresentationToggle()
  Goyo
  if s:presentation_enabled
    Limelight!
    silent !xdotool key ctrl+0
    let s:presentation_enabled = 0
  else
    Limelight
    silent !xdotool key --repeat 4 ctrl+plus
    silent !xdotool key --repeat 4 ctrl+equal
    let s:presentation_enabled = 1
  endif
endfunction
call MapKeys("<c-x><c-p>", ":call PresentationToggle()<cr>")

" git
call MapKeys("<c-g><c-h>", "<plug>(GitGutterPreviewHunk)")
call MapKeys("<c-g><c-u>", "<plug>(GitGutterUndoHunk)")
call MapKeys("<c-g><c-l>", "<plug>(GitGutterStageHunk)")
"" https://stackoverflow.com/a/20579322/2338672
let s:diff_view_enabled = 0
function! DiffViewToggle()
  if s:diff_view_enabled
    DiffviewClose
    let s:diff_view_enabled = 0
  else
    DiffviewOpen
    let s:diff_view_enabled = 1
  endif
endfunction
call MapKeys("<c-g><c-s>", ":call DiffViewToggle()<cr>")
"" https://github.com/longsleep/bin-scripts/blob/master/config/vimrc
" auto wrap git commit messages
au FileType gitcommit set tw=72

" text
"" https://stackoverflow.com/a/63887462/2338672
nnoremap <s-m-down> :m .+1<cr>==
nnoremap <s-m-up>   :m .-2<cr>==
inoremap <s-m-down> <esc>:m .+1<cr>==gi
inoremap <s-m-up>   <esc>:m .-2<cr>==gi
vnoremap <s-m-down> :m '>+1<cr>gv=gv
vnoremap <s-m-up>   :m '<-2<cr>gv=gv
"" https://vim.fandom.com/wiki/Map_Ctrl-Backspace_to_delete_previous_word
noremap! <c-bs> <c-w>
noremap! <c-h> <c-w>
"" goto the beginning and end of a line.
call MapKeys("<c-e>", "<s-$>")
call MapKeys("<c-a>", "<s-^>")

" code
"" https://vim.fandom.com/wiki/Shifting_blocks_visually
call NorMapKeys("<tab>", ">>")
call NorMapKeys("<s-tab>", "<<_")
call NorMapKeys("<c-c><c-s>", ":call nerdcommenter#Comment('cc', 'toggle')<cr>")
"" https://vim.fandom.com/wiki/Fix_indentation
call MapKeys("<c-c><c-r>", "gg=G<c-o><c-o>")
"" https://unix.stackexchange.com/a/75431/204066
autocmd BufWritePre * :%s/\s\+$//e
call MapKeys("<c-c><c-h>", "<plug>Zeavim")
call MapKeys("<c-c><c-m>", ":Glow<cr>")

" python
call MapKeys("<c-c><c-p>", ":!python %<cr>")
call MapKeys("<c-t><c-c>", ":Pytest class<cr>")
call MapKeys("<c-t><c-m>", ":Pytest method<cr>")
call MapKeys("<c-t><c-f>", ":Pytest function<cr>")
call MapKeys("<c-t><c-a>", ":Pytest file<cr>")
" python - isort
let g:vim_isort_map = ''
let g:isort_command = 'isort'
call MapKeys("<c-c><c-i>", ":Isort --profile black<cr>")
"autocmd BufWritePre *.py execute ':Isort --profile black'
" python - black
call MapKeys("<c-c><c-r>", ":Black<cr>")
"autocmd BufWritePre *.py execute ':Black'

" ALE
let g:ale_disable_lsp = 1
