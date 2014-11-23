Sort Motion.vim
===============

This plugin provides the ability to sort in Vim using text objects and
motions. Sorting lines and argument lists manually can be a hassle, and thus
most write it off as a waste of effort, but when its as easy as anything else
in Vim, it becomes a viable option.

`sort-motion` has two different sorting modes:

- Linewise: sort a sequence of lines (require statements, gem lists, etc)
- Listwise: sort a comma separated list (argument lists, attribute lists, etc)

Installation
------------

Using [Vundle][]:

``` vim
" add this line to your ~/.vimrc
Bundle 'christoomey/vim-sort-motion'
```

then run `:BundleInstall` from within Vim.

[Vundle]: https://github.com/gmarik/Vundle.vim

Usage
-----

The plugin defines a single key mapping, `gs`, for sorting based on a text
object or motion. To use the mapping, type `gs` followed by a motion, ie `2j`
to sort down two lines.

Examples:

- `gs2j` => Sort down two lines (current + 2)
- `gsip` => Sort the current paragraph
- `gsii` => Sort the current indentation level (requires [text-obj-indent plugin][])

In addition, if the text object is within a line then `sort-motion` will
attempt to sort the text as a comma separated list.

Examples:

- `gsi'` => Sort within single quote. (`'foo, bar, baz'` would become `'bar,
  baz, foo'`)

[text-obj-indent plugin]: https://github.com/kana/vim-textobj-indent

Configuration
-------------

If you'd like to pass any options to `sort`
you can set `g:sort_motion_flags`. For example you could use:

```vim
let g:sort_motion_flags = "ui"
```

To make all sorts case insensitive and remove duplicates.
