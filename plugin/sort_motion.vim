" sort-motion.vim - Sort based on linewise motions
" Maintainer:   Chris Toomey <http://ctoomey.com/>
" Version:      0.1
" Source:       http://github.com/christoomey/vim-sort-motion

if exists("g:loaded_sort_motion") || &cp || v:version < 700
  finish
endif
let g:loaded_sort_motion = 1

if !exists("g:sort_motion_flags")
  let g:sort_motion_flags = ""
endif

function! s:sort_motion(mode) abort
  if a:mode == 'line'
    execute "'[,']sort " . g:sort_motion_flags
  elseif a:mode == 'char'
    execute "normal! `[v`]y"
    let sorted = join(sort(split(@@, ', ')), ', ')
    execute "normal! v`]c" . sorted
  elseif a:mode == 'V' || a:mode == ''
    execute "'<,'>sort " . g:sort_motion_flags
  endif
endfunction

xnoremap <silent> <Plug>SortMotionVisual :<C-U>call <SID>sort_motion(visualmode())<CR>
nnoremap <silent> <Plug>SortMotion :<C-U>set opfunc=<SID>sort_motion<CR>g@

map gs <Plug>SortMotion
vmap gs <Plug>SortMotionVisual
