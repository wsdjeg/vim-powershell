" Vim indent file
" Language:           Windows PowerShell XML
" Maintainer:         Shidong Wang <wsdjeg@outlook.com>

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
	finish
endif
let b:did_indent = 1

" smartindent is good enough for powershell
setlocal smartindent
" disable the indent removal for # marks
inoremap <buffer> # X#

let b:undo_indent = "setl si<"

