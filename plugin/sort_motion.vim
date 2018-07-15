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

if !exists('g:sort_motion_visual_block_command')
  let g:sort_motion_visual_block_command = 'sort'
endif

function! s:sort_motion(mode) abort
  if a:mode == 'line'
    execute "'[,']sort " . g:sort_motion_flags
  elseif a:mode == 'char'
    execute "normal! `[v`]y"
    let startpos = match(@@, '\v\i')
    let parts = split(@@, '\v\i+')
    if startpos > 0
      let prefix = parts[0]
      let delimiter = parts[1]
      let suffix = parts[-1]
    else
      let prefix = ''
      let delimiter = parts[0]
      let suffix = ''
    endif
    if prefix == delimiter
      let prefix = ''
    endif
    if suffix == delimiter
      let suffix = ''
    endif
    let sortstart = strlen(prefix)
    let sortend = strlen(@@) - sortstart - strlen(suffix)
    let sortables = strpart(@@, sortstart, sortend)
    let sorted = join(sort(split(sortables, '\V' . escape(delimiter, '\'))), delimiter)
    execute "normal! v`]c" . prefix . sorted . suffix
    execute "normal! `["
  elseif a:mode == 'V'
    execute "'<,'>sort " . g:sort_motion_flags
  elseif a:mode ==# ''
    execute "'<,'>".g:sort_motion_visual_block_command.' '.g:sort_motion_flags
  endif
endfunction

function! s:sort_lines()
  let beginning = line('.')
  let end = v:count1 + beginning - 1
  execute beginning . ',' . end . 'sort ' . g:sort_motion_flags
endfunction

xnoremap <silent> <Plug>SortMotionVisual :<C-U>call <SID>sort_motion(visualmode())<CR>
nnoremap <silent> <Plug>SortMotion :<C-U>set opfunc=<SID>sort_motion<CR>g@
nnoremap <silent> <Plug>SortLines :<C-U>call <SID>sort_lines()<CR>

if !exists('g:sort_motion')
  let g:sort_motion = 'gs'
endif

if !exists('g:sort_motion_lines')
  let g:sort_motion_lines = 'gss'
endif

if !exists('g:sort_motion_visual')
  let g:sort_motion_visual = 'gs'
endif

execute 'nmap ' . g:sort_motion        . ' <Plug>SortMotion'
execute 'nmap ' . g:sort_motion_lines  . ' <Plug>SortLines'
execute 'vmap ' . g:sort_motion_visual . ' <Plug>SortMotionVisual'
