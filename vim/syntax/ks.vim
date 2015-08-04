syn region ksLineComment start=+;+ end=+$+
syn region ksTag   start=+\[[^/]+   end=+\]+ fold contains=ksTagName,ksEqual

" タグネーム
syn keyword ksTagName contained font size
syn keyword ksEqual contained ee \=

highlight link ksLineComment Comment
highlight link ksTag   Function
highlight link ksEqual Operator
highlight link ksTagName Statement
