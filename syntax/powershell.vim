" Vim syntax file
" Language:           Windows PowerShell XML
" Maintainer:         Shidong Wang <wsdjeg@outlook.com>
"
" The following settings are available for tuning syntax highlighting:
"    let powershell_nofold_blocks = 1
"    let powershell_nofold_sig = 1
"    let powershell_nofold_region = 1

" Compatible VIM syntax file start
if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

" Operators contain dashes
setlocal iskeyword+=-

" PowerShell doesn't care about case
syn case ignore

" Sync-ing method
syn sync minlines=100

" Certain tokens can't appear at the top level of the document
syn cluster powershellNotTop contains=@powershellComment,powershellCDocParam,powershellFunctionDeclaration

" Comments and special comment words
syn keyword powershellCommentTodo TODO FIXME XXX TBD HACK NOTE contained
syn match powershellCDocParam /.*/ contained
syn match powershellCommentDoc /^\s*\zs\.\w\+\>/ nextgroup=powershellCDocParam contained
syn match powershellCommentDoc /#\s*\zs\.\w\+\>/ nextgroup=powershellCDocParam contained
syn match powershellComment /#.*/ contains=powershellCommentTodo,powershellCommentDoc,@Spell
syn region powershellComment start="<#" end="#>" contains=powershellCommentTodo,powershellCommentDoc,@Spell

" Language keywords and elements
syn keyword powershellConditional if else elseif switch default
syn keyword powershellRepeat while for do until break continue foreach in
syn match powershellRepeat /\<foreach\>/ nextgroup=powershellBlock skipwhite
syn match powershellKeyword /\<while\>/ nextgroup=powershellBlock skipwhite
syn match powershellKeyword /\<where\>/ nextgroup=powershellBlock skipwhite

syn keyword powershellException begin process end exit inlinescript parallel sequence
syn keyword powershellKeyword try catch finally throw
syn keyword powershellKeyword return filter in trap param data dynamicparam 
syn keyword powershellConstant $true $false $null
syn match powershellConstant +\$?+
syn match powershellConstant +\$_+
syn match powershellConstant +\$\$+
syn match powershellConstant +\$^+

" Keywords reserved for future use
syn keyword powershellKeyword class define from using var

" Function declarations
syn keyword powershellKeyword function nextgroup=powershellFunctionDeclaration skipwhite
syn keyword powershellKeyword filter nextgroup=powershellFunctionDeclaration skipwhite
syn keyword powershellKeyword workflow nextgroup=powershellFunctionDeclaration skipwhite
syn keyword powershellKeyword configuration nextgroup=powershellFunctionDeclaration skipwhite
syn keyword powershellKeyword class nextgroup=powershellFunctionDeclaration skipwhite
syn keyword powershellKeyword enum nextgroup=powershellFunctionDeclaration skipwhite
syn match powershellFunctionDeclaration /\w\+\(-\w\+\)*/ contained

" Function invocations
syn match powershellFunctionInvocation /\w\+\(-\w\+\)\+/

" Type declarations
syn match powershellType /\[[a-z_][a-z0-9_.,\[\]]\+\]/

" Variable references
syn match powershellScopeModifier /\(global:\|local:\|private:\|script:\)/ contained
syn match powershellVariable /\$\w\+\(:\w\+\)\?/ contains=powershellScopeModifier
syn match powershellVariable /\${\w\+\(:\w\+\)\?}/ contains=powershellScopeModifier

" Operators
syn keyword powershellOperator -eq -ne -ge -gt -lt -le -like -notlike -match -notmatch -replace -split -contains -notcontains
syn keyword powershellOperator -ieq -ine -ige -igt -ile -ilt -ilike -inotlike -imatch -inotmatch -ireplace -isplit -icontains -inotcontains
syn keyword powershellOperator -ceq -cne -cge -cgt -clt -cle -clike -cnotlike -cmatch -cnotmatch -creplace -csplit -ccontains -cnotcontains
syn keyword powershellOperator -in -notin
syn keyword powershellOperator -is -isnot -as -join
syn keyword powershellOperator -and -or -not -xor -band -bor -bnot -bxor
syn keyword powershellOperator -f
syn match powershellOperator /!/
syn match powershellOperator /=/
syn match powershellOperator /+=/
syn match powershellOperator /-=/
syn match powershellOperator /\*=/
syn match powershellOperator /\/=/
syn match powershellOperator /%=/
syn match powershellOperator /+/
syn match powershellOperator /-\(\s\|\d\|\.\|\$\|(\)\@=/
syn match powershellOperator /\*/
syn match powershellOperator /\//
syn match powershellOperator /|/
syn match powershellOperator /%/
syn match powershellOperator /&/
syn match powershellOperator /::/
syn match powershellOperator /,/
syn match powershellOperator /\(^\|\s\)\@<=\. \@=/

" Regular Strings
" These aren't precisely correct and could use some work
syn region powershellString start=/"/ skip=/`"/ end=/"/ contains=@powershellStringSpecial,@Spell
syn region powershellString start=/'/ skip=/''/ end=/'/

" Here-Strings
syn region powershellString start=/@"$/ end=/^"@/ contains=@powershellStringSpecial,@Spell
syn region powershellString start=/@'$/ end=/^'@/

" Interpolation
syn match powershellEscape /`./
syn region powershellInterpolation matchgroup=powershellInterpolationDelimiter start="$(" end=")" contained contains=ALLBUT,@powershellNotTop
syn region powershellNestedParentheses start="(" skip="\\\\\|\\)" matchgroup=powershellInterpolation end=")" transparent contained
syn cluster powershellStringSpecial contains=powershellEscape,powershellInterpolation,powershellVariable,powershellBoolean,powershellConstant,powershellBuiltIn,@Spell

" Numbers
syn match   powershellNumber		"\(\<\|-\)\@<=\(0[xX]\x\+\|\d\+\)\([KMGTP][B]\)\=\(\>\|-\)\@="
syn match   powershellNumber		"\(\(\<\|-\)\@<=\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[dD]\="
syn match   powershellNumber		"\<\d\+[eE][-+]\=\d\+[dD]\=\>"
syn match   powershellNumber		"\<\d\+\([eE][-+]\=\d\+\)\=[dD]\>"

" Constants
syn match powershellBoolean "$\%(true\|false\)\>"
syn match powershellConstant /\$null\>/
syn match powershellBuiltIn "$^\|$?\|$_\|$\$"
syn match powershellBuiltIn "$\%(args\|error\|foreach\|home\|input\)\>"
syn match powershellBuiltIn "$\%(match\(es\)\?\|myinvocation\|host\|lastexitcode\)\>"
syn match powershellBuiltIn "$\%(ofs\|shellid\|stacktrace\)\>"

" Folding blocks
if !exists('g:powershell_nofold_blocks')
	syn region powershellBlock start=/{/ end=/}/ transparent fold
endif

if !exists('g:powershell_nofold_region')
	syn region powershellRegion start=/#region/ end=/#endregion/ transparent fold keepend extend
endif

if !exists('g:powershell_nofold_sig')
	syn region powershellSignature start=/# SIG # Begin signature block/ end=/# SIG # End signature block/ transparent fold
endif

" Setup default color highlighting
if version >= 508 || !exists("did_powershell_syn_inits")
	if version < 508
		let did_powershell_syn_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	HiLink powershellNumber Number
	HiLink powershellBlock Block
	HiLink powershellRegion Region
	HiLink powershellException Exception
	HiLink powershellConstant Constant
	HiLink powershellString String
	HiLink powershellEscape SpecialChar
	HiLink powershellInterpolationDelimiter Delimiter
	HiLink powershellConditional Conditional
	HiLink powershellFunctionDeclaration Function
	HiLink powershellFunctionInvocation Function
	HiLink powershellVariable Identifier
	HiLink powershellBoolean Boolean
	HiLink powershellConstant Constant
	HiLink powershellBuiltIn StorageClass
	HiLink powershellType Type
	HiLink powershellScopeModifier StorageClass
	HiLink powershellComment Comment
	HiLink powershellCommentTodo Todo
	HiLink powershellCommentDoc Tag
	HiLink powershellCDocParam Todo
	HiLink powershellOperator Operator
	HiLink powershellRepeat Repeat
	HiLink powershellRepeatAndCmdlet Repeat
	HiLink powershellKeyword Keyword
	HiLink powershellKeywordAndCmdlet Keyword
	delcommand HiLink
endif

let b:current_syntax = "powershell"
