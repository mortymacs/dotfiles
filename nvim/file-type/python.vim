" Python config file.

" Config.
set expandtab shiftwidth=4 softtabstop=4
let b:coc_root_patterns = ['.git', '.venv', 'pyproject.toml']
let g:ale_python_isort_options = '--profile black'

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
call MapKeys("<c-c><c-q>", ":call CocAction('jumpDefinition', v:false)<cr>")

"" Method document.
call MapKeys("<c-c><c-k>", ":call CocAction('jumpDefinition', v:false)<cr>")

"" Reformat buffer.
function! PyFmt()
  Black
  ALEFix isort
endfunction
call MapKeys("<c-c><c-f>", ":call PyFmt()<cr>")
