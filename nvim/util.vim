"Utilities.

function! CopySelectedArea()
  "" https://superuser.com/a/921975
  :call system("xclip -i -selection clipboard", getreg("\""))
  :call system("xclip -i", getreg("\""))
endfunction

function Paste()
  "" https://superuser.com/a/921975
  :call setreg("\"",system("xclip -o -selection clipboard"))
endfunction

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
