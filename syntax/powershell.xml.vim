" Vim syntax file
" Language:           Windows PowerShell XML
" Maintainer:         Shidong Wang <wsdjeg@outlook.com>

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

let s:powershellxml_cpo_save = &cpo
set cpo&vim

doau syntax xml
unlet b:current_syntax

syn case ignore
syn include @powershellxmlScriptBlock <sfile>:p:h/powershell.vim
unlet b:current_syntax

syn region powershellxmlScriptBlock
      \ matchgroup=xmlTag     start="<Script>"
      \ matchgroup=xmlEndTag  end="</Script>"
      \ fold
      \ contains=@powershellxmlScriptBlock
      \ keepend
syn region powershellxmlScriptBlock
      \ matchgroup=xmlTag     start="<ScriptBlock>"
      \ matchgroup=xmlEndTag  end="</ScriptBlock>"
      \ fold
      \ contains=@powershellxmlScriptBlock
      \ keepend
syn region powershellxmlScriptBlock
      \ matchgroup=xmlTag     start="<GetScriptBlock>"
      \ matchgroup=xmlEndTag  end="</GetScriptBlock>"
      \ fold
      \ contains=@powershellxmlScriptBlock
      \ keepend
syn region powershellxmlScriptBlock
      \ matchgroup=xmlTag     start="<SetScriptBlock>"
      \ matchgroup=xmlEndTag  end="</SetScriptBlock>"
      \ fold
      \ contains=@powershellxmlScriptBlock
      \ keepend

syn cluster xmlRegionHook add=powershellxmlScriptBlock

let b:current_syntax = "powershellxml"

let &cpo = s:powershellxml_cpo_save
unlet s:powershellxml_cpo_save

