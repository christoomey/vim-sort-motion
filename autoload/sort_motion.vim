" autoload/sort_motion.vim

if exists('g:autoloaded_sort_motion')
  finish
endif
let g:autoloaded_sort_motion = 1

let s:sort_motion_flags = get(g:, 'sort_motion_flags', '')

function! sort_motion#sort_motion(mode) abort
  let l:sort_motion_visual_block_command =
        \ get(g:,'sort_motion_visual_block_command', 'sort')

  if a:mode == 'line'
    execute "'[,']sort " . s:sort_motion_flags
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
    execute "'<,'>sort " . s:sort_motion_flags
  elseif a:mode ==# ''
    execute "'<,'>".l:sort_motion_visual_block_command.' '.s:sort_motion_flags
  endif
endfunction

function! sort_motion#sort_lines() abort
  let beginning = line('.')
  let end = v:count1 + beginning - 1
  execute beginning . ',' . end . 'sort ' . s:sort_motion_flags
endfunction
