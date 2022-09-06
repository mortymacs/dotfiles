" General.
filetype off                 " required
syntax on
set mouse-=a
set number
set cursorline
set nocompatible             " be iMproved, required
set termguicolors            " enable true colors support
"" https://stackoverflow.com/a/2054674/2338672
set tabstop=4
set shiftwidth=4
set expandtab
"" https://stackoverflow.com/a/11560415/2338672
set backspace=2
set hidden
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes

filetype plugin on
filetype plugin indent on    " required
"" https://superuser.com/a/35421/298390
set whichwrap+=<,>,[,]
set nowrap

" Package.
call plug#begin('~/.vim/plugged')
" Theme and colorscheme.
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'norcalli/nvim-colorizer.lua'

" Tabbar.
Plug 'romgrk/barbar.nvim'

" Status.
Plug 'nvim-lualine/lualine.nvim'

" File and search.
Plug 'junegunn/fzf.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'preservim/tagbar'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'famiu/bufdelete.nvim'

" Text.
Plug 'tpope/vim-surround'
Plug 'RRethy/vim-illuminate'
Plug 'Yggdroot/indentLine'

" Git.
Plug 'airblade/vim-gitgutter'
Plug 'sindrets/diffview.nvim'

" Development.
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'KabbAmine/zeavim.vim'
Plug 'preservim/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'voldikss/vim-floaterm'
Plug 'luochen1990/rainbow'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'vim-test/vim-test'
Plug 'pechorin/any-jump.vim'
Plug 'dense-analysis/ale'
Plug 'lukas-reineke/indent-blankline.nvim'

" C/C++.
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" Python.
Plug 'psf/black'
Plug 'alfredodeza/pytest.vim'

" Go.
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" DevOps.
Plug 'hashivim/vim-terraform'

" Project.
Plug 'mhinz/vim-startify'

" Markdown.
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'npxbr/glow.nvim'

" Misc.
Plug 'sotte/presenting.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'preservim/vimux'
call plug#end()

" Color.
lua require'colorizer'.setup()
autocmd BufWritePost * :ColorizerAttachToBuffer
let g:rainbow_active = 1
let s:rainbow_conf = {
\ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta', 'orangered', 'burlywood1', 'brown1', 'darkorchid1', 'deeppink2']
\}

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

" Theme and colorscheme.
set background=dark
colorscheme spaceduck
let g:lightline = { 'colorscheme': 'spaceduck' }
"" https://stackoverflow.com/a/17506351
hi Vertsplit guibg=NONE guifg=#30365F
"" https://stackoverflow.com/a/15648665/2338672
set cmdheight=1
set laststatus=3
"" https://stackoverflow.com/a/37720708/2338672
hi Normal guibg=NONE ctermbg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
"" https://stackoverflow.com/a/63382382
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
"" https://stackoverflow.com/a/40411893/2338672
hi EndOfBuffer ctermfg=black guifg=black
"" https://stackoverflow.com/a/19877212/2338672
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
lua << END
require('lualine').setup{
  options = {
    theme = "spaceduck"
  }
}
END

" Terminal.
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
call MapKeys("<c-x><c-r>", "FloatermToggle<cr>")

" Search.
call MapKeys("<c-f>", ":Lines<cr>")
call MapKeys("<c-c><c-t>", ":AnyJump<cr>")
call MapKeys("<c-c><c-g>", ":AnyJumpArg ")
call MapKeys("<c-x><c-g>", ":Ag<cr>")
let g:any_jump_disable_default_keybindings = 1

" Test.
let test#strategy = "floaterm"
call MapKeys("<c-t><c-n>", ":TestNearest<cr>")
call MapKeys("<c-t><c-s>", ":TestSuite<cr>")
call MapKeys("<c-t><c-l>", ":TestLast<cr>")

" Coc.nvim.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()
call MapKeys("<c-c><c-d>", "<Plug>(coc-definition)")
call MapKeys("<c-c><c-i>", "<Plug>(coc-implementation)")
call MapKeys("<c-c><c-r>", "<Plug>(coc-references)")
call MapKeys("<c-c><c-e>", "<c-o>")
"" https://github.com/neoclide/coc.nvim/issues/2202#issuecomment-662969193
inoremap <c-q> <c-\><c-o>:call CocActionAsync('showSignatureHelp')<cr>
autocmd CursorHold * silent call CocActionAsync('highlight')
call MapKeys("<c-m-l>", "<Plug>(coc-codeaction)")

" Code indent.
"" https://github.com/jelly/Dotfiles/blob/master/.vimrc
autocmd FileType python,cucumber set expandtab shiftwidth=4 softtabstop=4
autocmd FileType c,cpp,h,html,css,vim,yaml,yml,json set expandtab shiftwidth=2 softtabstop=2
set cindent
set smartindent
set autoindent
set complete+=s
"" reformat the whole buffer
call MapKeys("<c-c><c-l>", "gg=G<cr>")
call MapKeys("<c-m-l>", "gg=G<cr>")

" Fzf.
"" https://github.com/universal-ctags/ctags/issues/218#issuecomment-72355190
let g:fzf_tags_command='fd | ctags --links=no -L-'
call MapKeys("<c-x><c-f>", ":Files<cr>")
call MapKeys("<c-x><c-t>", ":Tags<cr>")
call MapKeys("<c-x><c-b>", ":Buffers<cr>")

" File manager.
lua << END
require('nvim-tree').setup{
  renderer = {
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
    special_files = {"Makefile", "CMakeLists.txt", "Cargo.toml", "go.mod"},
  },
  filters = {
    custom = {"^\\.git"},
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = false,
  },
  git = {
    enable = true,
    ignore = true,
    show_on_dirs = false,
    timeout = 400,
  },
  view = {
    mappings = {
      list = {
        { key = "<cr>",   action = "edit" },
        { key = "v",      action = "vsplit" },
        { key = "h",      action = "split" },
        { key = "<tab>",  action = "preview" },
        { key = "g",      action = "refresh" },
        { key = "n",      action = "create" },
        { key = "d",      action = "remove" },
        { key = "r",      action = "rename" },
        { key = "x",      action = "cut" },
        { key = "c",      action = "copy" },
        { key = "p",      action = "paste" },
        { key = "bp",     action = "bulk_move" },
        { key = "y",      action = "copy_name" },
        { key = "Y",      action = "copy_absolute_path" },
        { key = "/",      action = "search_node" },
      },
    },
  },
}
END
call MapKeys("<c-x><c-l>", ":NvimTreeToggle<cr>")

" Tagbar.
call MapKeys("<c-c><c-a>", ":TagbarToggle<cr>")
let g:tagbar_sort = 0
let g:tagbar_show_balloon = 0

" Window.
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

" Buffer.
call MapKeys("<c-x><c-e>", ":Bd!<cr>")

" Clipboard.
"" https://superuser.com/a/921975
vmap <c-c><c-c> y:call system("xclip -i -selection clipboard", getreg("\""))<cr>:call system("xclip -i", getreg("\""))<cr>
nmap <c-c><c-v> :call setreg("\"",system("xclip -o -selection clipboard"))<cr>p

" Tabbar.
let g:airline#extensions#tabline#enabled = 1
call MapKeys("<s-right>", ":BufferNext<cr>")
call MapKeys("<s-left>", ":BufferPrevious<cr>")
call MapKeys("<c-x><c-q>", ":BufferClose<cr>")
call MapKeys("<c-x><c-a>", ":tabnew<cr>")
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
let bufferline.icons = v:true
let bufferline.auto_hide = v:true
let bufferline.animation = v:false
let bufferline.closable = v:false
let bufferline.clickable = v:false

" Hotkeys general.
call MapKeys("<c-g>", "<esc>")
"" select.
call MapKeys("<m-space>", "v") " v$ v0o$
call MapKeys("<c-x><c-s>", ":w<cr>")
call MapKeys("<c-@>", "v")
call MapKeys("<c-d>", "yyp")

" Git.
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

" Tree-Sitter.
lua << END
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "c",
    "cpp",
    "rust",
    "go",
    "python",
    "lua",
    "bash",
    "cmake",
    "make",
    "sql",
    "latex",
    "markdown",
    "dockerfile",
    "hcl",
    "json",
    "yaml",
    "toml",
    "regex",
    "http"
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  }
}
END

" Text.
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

" Development.
"" https://vim.fandom.com/wiki/Shifting_blocks_visually
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
call NorMapKeys("<c-c><c-s>", ":call nerdcommenter#Comment('cc', 'toggle')<cr>")
call NorMapKeys("<c-/>", ":call nerdcommenter#Comment('cc', 'toggle')<cr>")
"" https://vim.fandom.com/wiki/Fix_indentation
call MapKeys("<c-c><c-r>", "gg=G<c-o><c-o>")
"" https://unix.stackexchange.com/a/75431/204066
autocmd BufWritePre * :%s/\s\+$//e
call MapKeys("<c-c><c-h>", "<plug>Zeavim")
call MapKeys("<c-c><c-m>", ":Glow<cr>")

" ALE.
let g:ale_disable_lsp = 1
let g:ale_python_isort_options = '--profile black'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" C/C++.
autocmd FileType c,cpp call MapKeys("<c-m-l>", ":FormatCode clang-format<cr>")

" Python.
function! ReformatBuffer()
  Black
  ALEFix isort
endfunction
autocmd FileType python call MapKeys("<c-m-l>", ":call ReformatBuffer()<cr>")
autocmd FileType python call MapKeys("<c-c><c-p>", ":!python %<cr>")
autocmd FileType python call MapKeys("<c-t><c-c>", ":Pytest class<cr>")
autocmd FileType python call MapKeys("<c-t><c-m>", ":Pytest method<cr>")
autocmd FileType python call MapKeys("<c-t><c-f>", ":Pytest function<cr>")
autocmd FileType python call MapKeys("<c-t><c-a>", ":Pytest file<cr>")

" Go.
let g:go_auto_type_info = 0
autocmd FileType go call MapKeys("<c-m-l>", ":GoFmt<cr>")
autocmd FileType go call MapKeys("<c-c><c-i>", ":GoImplements<cr>")
autocmd FileType go call MapKeys("<c-c><c-r>", ":GoReferrers<cr>")
"" Refactor
autocmd FileType go call MapKeys("<c-r><c-n>", ":GoRename<cr>")
autocmd FileType go call MapKeys("<c-r><c-c>", ":GoCallers<cr>")
autocmd FileType go call MapKeys("<c-c><c-k>", ":GoDoc<cr>")

" CMake.
autocmd BufWritePost CMakeLists.txt execute '! cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1'

" Terraform.
autocmd FileType terraform call MapKeys("<c-m-l>", ":TerraformFmt<cr>")

" XML.
"" https://gist.github.com/ptitfred/3402279
function! PrettyXML()
  silent %!xmllint --format --encode UTF-8 --recover - 2>/dev/null
endfunction
command! Fxml call PrettyXML()

autocmd FileType xml call MapKeys("<c-m-l>", ":Fxml<cr>")

" JSON.
autocmd FileType json call MapKeys("<c-m-l>", ":%!jq<cr>")

" Markdown.
let g:vim_markdown_folding_disabled = 1

