" sort-motion.vim - Sort based on linewise motions
" Maintainer:   Chris Toomey <http://ctoomey.com/>
" Version:      0.1
" Source:       http://github.com/christoomey/vim-sort-motion

if exists('g:loaded_sort_motion') || &cp || v:version < 700
  finish
endif
let g:loaded_sort_motion = 1

nnoremap <silent> <Plug>SortMotion
      \ :<C-U>set opfunc=sort_motion#sort_motion<CR>g@
xnoremap <silent> <Plug>SortMotionVisual
      \ :<C-U>call sort_motion#sort_motion(visualmode())<CR>
nnoremap <silent> <Plug>SortLines
      \ :<C-U>call sort_motion#sort_lines()<CR>

if !hasmapto('<Plug>SortMotion', 'n') && maparg('gs', 'n') ==# ''
  nmap gs <Plug>SortMotion
endif
if !hasmapto('<Plug>SortMotionVisual', 'x') && maparg('gs', 'x') ==# ''
  xmap gs <Plug>SortMotionVisual
endif
if !hasmapto('<Plug>SortLines', 'n') && maparg('gss', 'n') ==# ''
  nmap gss <Plug>SortLines
endif
