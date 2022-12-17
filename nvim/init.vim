" General.
filetype off                 " required
syntax on
set mouse=
set number
set relativenumber
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
"" https://github.com/jelly/Dotfiles/blob/master/.vimrc
set cindent
set smartindent
set autoindent
set complete+=s

filetype plugin on
filetype plugin indent on    " required
"" https://superuser.com/a/35421/298390
set whichwrap+=<,>,[,]
set nowrap

" Package.
call plug#begin('~/.config/nvim/plugged')
" Theme and colorscheme.
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'norcalli/nvim-colorizer.lua'

" Scroll.
Plug 'karb94/neoscroll.nvim'

" Tabbar.
Plug 'romgrk/barbar.nvim'

" Status.
Plug 'nvim-lualine/lualine.nvim'

" Notification.
Plug 'rcarriga/nvim-notify'

" File and search.
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'preservim/tagbar'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'famiu/bufdelete.nvim'

" Text.
Plug 'kylechui/nvim-surround'
Plug 'RRethy/vim-illuminate'

" Git.
Plug 'airblade/vim-gitgutter'
Plug 'sindrets/diffview.nvim'
Plug 'f-person/git-blame.nvim'

" Github.
Plug 'pwntester/octo.nvim'

" Development.
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fannheyward/telescope-coc.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sheerun/vim-polyglot'
Plug 'KabbAmine/zeavim.vim'
Plug 'terrortylor/nvim-comment'
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
Plug 'google/vim-coverage'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" Python.
Plug 'psf/black'
Plug 'alfredodeza/pytest.vim'

" Go.
Plug 'fatih/vim-go'

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

source ~/.config/nvim/util.vim

" ---------- Clipboard.
vmap c y:call CopySelectedArea()<cr>
vmap x x:call CopySelectedArea()<cr>
nmap V :call Paste()<cr>p

" ---------- Color.
"" Theme.
set background=dark
colorscheme spaceduck

"" Colorizer.
lua require'colorizer'.setup()
autocmd BufWritePost * :ColorizerAttachToBuffer

"" Rainbow brackets.
let g:rainbow_active = 1
let s:rainbow_conf = {
\ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta', 'orangered', 'burlywood1', 'brown1', 'darkorchid1', 'deeppink2']
\}

let g:lightline = { 'colorscheme': 'spaceduck' }

"" Command part.
"" https://stackoverflow.com/a/15648665/2338672
set cmdheight=1
set laststatus=3

"" Vim parts.
"" https://stackoverflow.com/a/17506351
hi Vertsplit guibg=NONE guifg=#30365F
"" https://stackoverflow.com/a/37720708/2338672
hi Normal guibg=NONE ctermbg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi LineNr ctermbg=NONE guibg=NONE
"" https://stackoverflow.com/a/63382382
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
"" https://stackoverflow.com/a/40411893/2338672
hi EndOfBuffer ctermfg=black guifg=black

"" Tree-Sitter.
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
    "html",
    "css",
    "regex",
    "http"
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  }
}
END

" ---------- Status line.
lua << END
require('lualine').setup{
  options = {
    theme = "spaceduck",
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_a = {{'filename', newfile_status = true, path = 1}},
    lualine_b = {'branch', 'diff'},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {'filetype', 'filesize'},
    lualine_z = {'progress'}
  },
}
END

" ---------- Tabbar.
let g:airline#extensions#tabline#enabled = 1
call MapKeys("<s-right>",  ":BufferNext<cr>")
call MapKeys("<s-left>",   ":BufferPrevious<cr>")
call MapKeys("<c-x><c-q>", ":BufferClose<cr>")
call MapKeys("<c-x><c-n>", ":tabnew<cr>")
let bufferline = get(g:, 'bufferline', {})
let bufferline.icons     = v:true
let bufferline.auto_hide = v:true
let bufferline.animation = v:false
let bufferline.closable  = v:false
let bufferline.clickable = v:false

" ---------- Notification.
lua << END
require("notify").setup({
  background_colour = "#0F0F19",
  on_open = function (win)
    vim.api.nvim_win_set_config(win, { border = "single" })
  end,
})
END

" ---------- Splash screen.
let g:startify_custom_header = ""
let g:startify_lists = [
  \ { 'type': 'files',     'header': ['   MRU']            },
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ ]

" ---------- Scroll.
lua << END
require('neoscroll').setup{}
local t       = {}
t['<C-Up>']   = {'scroll', {'-vim.wo.scroll', 'true', '250'}}
t['<C-Down>'] = {'scroll', {'vim.wo.scroll' , 'true', '250'}}
require('neoscroll.config').set_mappings(t)
END

" ---------- File manager.
lua << END
require('nvim-tree').setup{
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
  renderer = {
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
    special_files = {"Makefile", "CMakeLists.txt", "Cargo.toml", "Magefile", "go.mod", "go.sum", "pyproject.toml"},
  },
  filters = {
    custom = {"^\\.git", "^\\.venv"},
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
    hide_root_folder = true,
    mappings = {
      custom_only = true,
      list = {
        { key = "<cr>",       action = "edit" },
        { key = "v",          action = "vsplit" },
        { key = "h",          action = "split" },
        { key = "<tab>",      action = "preview" },
        { key = "g",          action = "refresh" },
        { key = "n",          action = "create" },
        { key = "d",          action = "remove" },
        { key = "r",          action = "rename" },
        { key = "m",          action = "cut" },
        { key = "c",          action = "copy" },
        { key = "p",          action = "paste" },
        { key = "bp",         action = "bulk_move" },
        { key = "y",          action = "copy_name" },
        { key = "Y",          action = "copy_absolute_path" },
        { key = "/",          action = "live_filter" },
        { key = "<c-f>",      action = "search_node" },
        { key = "<c-]>",      action = "close" },
      },
    },
  },
}
END
call MapKeys("<c-]>", ":NvimTreeToggle<cr>")

" ---------- Terminal.
let g:floaterm_title = "$1/$2"
let g:floaterm_height = 0.5
let g:floaterm_width = 1.0
let g:floaterm_position = "botright"
let g:floaterm_wintype = "split"
let g:floaterm_autohide = 1
let g:floaterm_keymap_toggle = "<c-t><Up>"
let g:floaterm_keymap_new    = "<c-t><c-n>"
let g:floaterm_keymap_prev   = "<c-t><Left>"
let g:floaterm_keymap_next   = "<c-t><Right>"
let g:floaterm_keymap_kill   = "<c-t><c-k>"
let g:floaterm_opener = "tabe"
hi FloatermBorder ctermbg=black
"" https://stackoverflow.com/a/63908546/2338672
autocmd TermOpen * setlocal nonumber norelativenumber nocursorcolumn nocursorcolumn

" ---------- Search.
call MapKeys("<c-f>", ":Telescope current_buffer_fuzzy_find<cr>")
call MapKeys("<c-x><c-g>", ":Telescope live_grep<cr>")
let g:any_jump_disable_default_keybindings = 1

" ---------- Surround.
lua << END
  require("nvim-surround").setup()
  -- https://github.com/kylechui/nvim-surround/issues/134#issuecomment-1209789260
  vim.keymap.set('n', '"', '<cmd>norm ysiw"<cr>')
  vim.keymap.set('n', '\'', '<cmd>norm ysiw\'<cr>')
  vim.keymap.set('n', '(', '<cmd>norm ysiw)<cr>')
  vim.keymap.set('n', '{', '<cmd>norm ysiw}<cr>')
  vim.keymap.set('n', '[', '<cmd>norm ysiw]<cr>')
  vim.keymap.set('n', '<', '<cmd>norm ysiw><cr>')
END

" ---------- FZF.
call MapKeys("<c-x><c-f>", ":Files<cr>")
call MapKeys("<c-x><c-t>", ":Tags<cr>")
call MapKeys("<c-x><c-b>", ":Buffers<cr>")

" ---------- Telescope.
lua << END
require('telescope').setup{
  defaults = {
    layout_strategy = 'vertical',
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
  },
  pickers = {
    find_files = {
      borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
    },
  },
  extensions = {
    coc = {
      prefer_locations = true,
    }
  },
}
require('telescope').load_extension('coc')
END

" ---------- Code indent.
"" https://github.com/jelly/Dotfiles/blob/master/.vimrc
autocmd FileType html,css,yaml,yml,json set expandtab shiftwidth=2 softtabstop=2
lua << END
vim.opt.list = true
require("indent_blankline").setup {
  show_current_context = true,
  show_current_context_start = true,
}
END

" ---------- LSP.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()
"" https://github.com/neoclide/coc.nvim/issues/2202#issuecomment-662969193
inoremap <c-q> <c-\><c-o>:call CocActionAsync('showSignatureHelp')<cr>
autocmd CursorHold * silent call CocActionAsync('highlight')

" ---------- Tagbar.
call MapKeys("<c-c><c-a>", ":TagbarToggle<cr>")
let g:tagbar_sort = 0
let g:tagbar_show_balloon = 0

" ---------- Window.
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

"" Moving around panes.
call MapKeys("<m-up>",    "<c-w><c-k>")
call MapKeys("<m-down>",  "<c-w><c-j>")
call MapKeys("<m-left>",  "<c-w><c-h>")
call MapKeys("<m-right>", "<c-w><c-l>")

"" Resize panes.
call MapKeys("<c-s-up>",    ":resize -1<cr>")
call MapKeys("<c-s-down>",  ":resize +1<cr>")
call MapKeys("<c-s-left>",  ":vertical resize +1<cr>")
call MapKeys("<c-s-right>", ":vertical resize -1<cr>")

"" Buffer.
call MapKeys("<c-x><c-e>", ":Bd!<cr>")

" ---------- Git.
"" https://github.com/longsleep/bin-scripts/blob/master/config/vimrc
" auto wrap git commit messages
au FileType gitcommit set tw=72
let g:gitgutter_sign_added                   = '|'
let g:gitgutter_sign_modified                = '|'
let g:gitgutter_sign_removed                 = '|'
let g:gitgutter_sign_removed_first_line      = '|'
let g:gitgutter_sign_removed_above_and_below = '|'
let g:gitgutter_sign_modified_removed        = '|'
hi link GitGutterChangeLine DiffText
hi link GitGutterChangeLineNr Underlined
hi link GitGutterAddIntraLine DiffAdd

" ---------- Github.
lua << END
require('octo').setup()
END


" ---------- Text.
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
imap <m-bs> <c-w>

" ---------- Development.
"" https://vim.fandom.com/wiki/Shifting_blocks_visually
nnoremap <Tab>   >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab>   >gv
vnoremap <S-Tab> <gv

"" Comment.
lua << END
require('nvim_comment').setup({
  comment_empty = false,
  create_mappings = false,
})
END
vmap "<c-_>" ":'<,'>CommentToggle<cr>"
call NorMapKeys("<c-_>", ":CommentToggle<cr>:+1<cr>")

" ALE.
let g:ale_disable_lsp = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

"" Tags.
call MapKeys("<c-c><c-w>", ":BTags<cr>")

" C.
autocmd FileType c,h source ~/.config/nvim/file-type/c.vim

" C++.
autocmd FileType cpp,h source ~/.config/nvim/file-type/cpp.vim

" Rust.
autocmd FileType rust source ~/.config/nvim/file-type/rust.vim

" Go.
autocmd FileType go source ~/.config/nvim/file-type/go.vim

" Python.
autocmd FileType python source ~/.config/nvim/file-type/python.vim

" Magefile.
" https://vi.stackexchange.com/a/5202
autocmd BufEnter Magefile :setlocal filetype=go

" Terraform.
autocmd FileType terraform source ~/.config/nvim/file-type/terraform.vim

" Misc.
source ~/.config/nvim/file-type/misc.vim

" ---------- Hotkeys (misc).
"" select.
""" Other options: v$ v0o$
nmap <c-space> v
call MapKeys("<c-@>", "v")
call MapKeys("<c-d>", "yyp")

"" Save.
call MapKeys("<c-s>", ":wa<cr>")

"" Unselect highlighted words.
""" https://stackoverflow.com/a/19877212/2338672
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<cr><Esc>

"" Git.
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
call MapKeys("<c-g><c-d>", ":call DiffViewToggle()<cr>")
call MapKeys("<c-g><c-s>", ":Telescope git_status<cr>")
call MapKeys("<c-g><c-b>", ":Telescope git_branches<cr>")
call MapKeys("<c-g><c-c>", ":Telescope git_commits<cr>")
call MapKeys("<c-g><c-t>", ":Telescope git_stash<cr>")

" ---------- Events.
"" Remove spaces (on save).
""" https://unix.stackexchange.com/a/75431/204066
autocmd BufWritePre * :%s/\s\+$//e

