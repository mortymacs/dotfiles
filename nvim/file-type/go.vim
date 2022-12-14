" Go config file.

" Config.
let b:coc_root_patterns = ['.git', 'go.mod', 'go.sum', 'Makefile', 'Magefile']
let g:go_auto_type_info = 0
let g:go_gopls_gofumpt=1
let g:go_gopls_enabled=0
let g:go_fmt_command = "golines"
let g:go_fmt_options = {'golines': '-m 128 --base-formatter gofumpt'}

" Hotkeys.
"" Goto definition.
call MapKeys("<c-c><c-d>", "<Plug>(coc-definition)")

"" Goto type definition.
call MapKeys("<c-c><c-t>", ":Telescope coc type_definitions<cr>")

"" Back to caller.
call MapKeys("<c-c><c-b>", "<c-o>")

"" Goto implementation.
call MapKeys("<c-c><c-i>", ":Telescope coc implementations<cr>")

"" References / callers.
call MapKeys("<c-c><c-r>", ":Telescope coc references_used<cr>")

"" Refactor (rename).
call MapKeys("<c-c><c-e>", "<Plug>(coc-rename)")

"" Method signature.
call MapKeys("<c-c><c-q>", ":call CocAction('jumpDefinition', v:false)<CR>")

"" Method document.
call MapKeys("<c-c><c-k>", ":GoDoc<cr>")

"" Reformat buffer.
call MapKeys("<c-c><c-f>", ":GoFmt<cr>")
