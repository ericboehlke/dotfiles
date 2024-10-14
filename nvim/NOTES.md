QuickFix List

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
