" Vim ftdetect plugin file
" Language:           Windows PowerShell
" Maintainer:         Shidong Wang <wsdjeg@outlook.com>
au BufNewFile,BufRead   *.ps1      setf=powershell
au BufNewFile,BufRead   *.psd1     setf=powershell
au BufNewFile,BufRead   *.psm1     setf=powershell
au BufNewFile,BufRead   *.pssc     setf=powershell
au BufNewFile,BufRead   *.ps1xml   setf=powershell.xml
au BufNewFile,BufRead   *.cdxml    setf=xml
au BufNewFile,BufRead   *.psc1     setf=xml
