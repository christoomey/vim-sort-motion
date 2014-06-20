" sort-motion.vim - Sort based on linewise motions
" Maintainer:   Chris Toomey <http://ctoomey.com/>
" Version:      0.1
" Source: http://github.com/christoomey/vim-sort-motion

if exists("g:loaded_sort_motion") || &cp || v:version < 700
  finish
endif
let g:loaded_sort_motion = 1

function! s:sort_motion(type,...) abort
  if a:0
    echo 'in a:0 truthy block'
  else " not in visual
    if a:type == 'line'
      '[,']sort
    elseif a:type == 'char'
      silent exe "normal! `[v`]y"
      let sorted = join(sort(split(@@, ', ')), ', ')
      silent exe "normal! v`]c" . sorted
    endif
  endif
endfunction

nnoremap <silent> <Plug>SortMotion :<C-U>set opfunc=<SID>sort_motion<CR>g@

map gs <Plug>SortMotion
