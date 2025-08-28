# Neovim Cheatsheet

## Basic Neovim Stuff

`:Tutor` I am on chapter 2

`>` and `<` in visual mode indent/unindent stuff

`=` in visual mode formats stuff with indentation

`~` changes case, `U` makes uppercase, `u` makes lowercase in visual mode
`g~<movement>`, `gU<movement>`, `gu<movement>` for normal mode

`%` goes to the next `{([` or the matching `])}`


To substitute all occurrences in the file type
```
:%s/old/new/g
```

To ask for confirmation each time add 'c'
```
:%s/old/new/gc
```

`:r !ls` reads the output of the `ls` command and puts it below the cursor.

Searching

`:set ic hls is` ignore case, highlight search, incremental search
prepend `no` to turn off a setting, prepend `inv` to invert a setting

## Lua Config

Use [kickstart](https://github.com/nvim-lua/kickstart.nvim)

## QuickFix List

Find and replace in multiple files
```
# collect the files
:vimgrep pattern path
:vimgrep "--python-testing pytest" **/*/*.md

# open quickfix
:copen

# do the find and replace on each line
:cdo %s/--python-testing pytest //gc

# do the find and replace on each file
:cfdo %s/--python-testing pytest //gc
```
