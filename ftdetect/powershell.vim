" Vim ftdetect plugin file
" Language:           Windows PowerShell
" Maintainer:         Shidong Wang <wsdjeg@outlook.com>
au BufNewFile,BufRead   *.ps1      setl filetype=powershell
au BufNewFile,BufRead   *.psd1     setl filetype=powershell
au BufNewFile,BufRead   *.psm1     setl filetype=powershell
au BufNewFile,BufRead   *.pssc     setl filetype=powershell
au BufNewFile,BufRead   *.ps1xml   setl filetype=powershell.xml
au BufNewFile,BufRead   *.cdxml    setl filetype=xml
au BufNewFile,BufRead   *.psc1     setl filetype=xml
