Sort Motion.vim
===============

Sort lines of text using motions and text objects. By default `sort-motion`
is mapped to `<leader>so`, so sorting a paragraph of text can be accomplished
with `<leader>soap`. Both funny to type, and easy to remember!

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

The plugin defines a single key mapping, `gs`, for sorting a range defined by
a text object or motion. To use the mapping, type `gs` followed by a motion,
ie `2j` to sort down two lines.

Examples:

- `gs2j` => Sort down two lines (current + 2)
- `gsip` => Sort the current paragraph
- `gsii` => Sort the current indentation level (requires [text-obj-indent plugin][])

[text-obj-indent plugin]: https://github.com/kana/vim-textobj-indent
