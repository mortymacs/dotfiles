" Misc types config file.

" XML.
"" https://gist.github.com/ptitfred/3402279
function! XMLFmt()
  silent %!xmllint --format --encode UTF-8 --recover - 2>/dev/null
endfunction
autocmd FileType xml command! Fxml call XMLFmt()
autocmd FileType xml call MapKeys("<c-m-l>", ":Fxml<cr>")

" JSON.
autocmd FileType json call MapKeys("<c-m-l>", ":%!jq<cr>")

" Markdown.
let g:vim_markdown_folding_disabled = 1
