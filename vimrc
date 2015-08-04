" ====================================================================
" NeoBundle Plugin Setting:
"
""" 行頭のTAB文字を可視化
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'

  " ----------------------------------------------
  " Coding Helper:
  "
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'mattn/emmet-vim'  "for html
  "NeoBundle 'taglist.vim' "taglist for ctags を別windowに表示
  "NeoBundle 'Source-Explorer-srcexpl.vim' "ctags系plugin

  " ----------------------------------------------
  " Colorscheme:
  "
  "NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'nanotech/jellybeans.vim'
  NeoBundle 'w0ng/vim-hybrid'

  " ----------------------------------------------
  " Syntax Highlight:
  "
  NeoBundle 'kchmck/vim-coffee-script'
    au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
  NeoBundle 'digitaltoad/vim-jade'
    au BufRead,BufNewFile,BufReadPre *.jade set filetype=jade
  NeoBundle 'leafgarland/typescript-vim'
    au BufRead,BufNewFile,BufReadPre *.ts set filetype=typescript

  " ----------------------------------------------
  " Other Plugins:
  "
  NeoBundle 'tpope/vim-surround' "http://vimblog.hatenablog.com/entry/vim_plugin_surround_vim
  NeoBundle 'terryma/vim-multiple-cursors' " http://qiita.com/sachin21/items/cfcb81bf4d1073429b68
    let g:multi_cursor_use_default_mapping=1 "default keymap
    " let g:multi_cursor_next_key='<C-n>'
    " let g:multi_cursor_prev_key='<C-p>'
    " let g:multi_cursor_skip_key='<C-x>'
    " let g:multi_cursor_quit_key='<Esc>'

call neobundle#end()
NeoBundleCheck

" ====================================================================
" Ctags And Cscope Setting:
" 全然見直してないので使うときは確認
"
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let g:SrcExpl_updateTagsCmd = "/usr/local/bin/ctags --sort=foldcase -R ."
let tlist_php_settings = 'php;c:class;d:constant;f:function'

if has("cscope")
  set csprg=/usr/local/bin/cscope
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
     if filereadable("cscope.out")
         cs add cscope.out
           " else add database pointed to by environment
             elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  set csverb
  "set cscopequickfix=s-,c-,d-,i-,t-,e-
endif

" ====================================================================
" General Settings:
"   (...拡張子別の設定は ~/.vim/ftplugin/拡張子.vim に書きましょう)
"
syntax enable
set number
set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch
set cursorline
set autoindent
set bg=dark
set backspace=indent,eol,start

" show statusline
set laststatus=2
set statusline=%f%r%=--%p\/100%%--\ [\ format:%{&ff}\ ][\ enc:%{&fileencoding}\ ][\ col:%3c\ ]

" netrwは常にtree view
let g:netrw_liststyle = 3

" ====================================================================
" Keybind:
"

""" Normal Mode:
nnoremap t< 10<c-w><
nnoremap t> 10<c-w>>
nnoremap t+ 10<c-w>+
nnoremap t- 10<c-w>-
nnoremap <c-l> gt
nnoremap <c-h> gT
nnoremap <c-j> 10j
nnoremap <c-k> 10k
nnoremap Q <Nop>
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

""" Insert Mode:
" <c-o>が便利
inoremap <c-$> <c-o>$
inoremap <c-^> <c-o>^
inoremap <c-h> <c-o>h
inoremap <c-j> <c-o>j
inoremap <c-k> <c-o>k
inoremap <c-l> <c-o>l

""" Visual Mode:
" v選択後、*でサーチ
vnoremap * "zy:let @/ = @z<CR>n
vnoremap <c-j> 10j
vnoremap <c-k> 10k

""" Command Mode:
cnoremap bv bel vnew
cnoremap cc cursorcolumn
cnoremap nocc nocursorcolumn
cnoremap ai autoindent
cnoremap noai noautoindent

" コメント行でoすると次の行もコメントになるのを防止(うまくいかない)
autocmd filetype * setlocal formatoptions-=ro

" ====================================================================
" Command Alias:
"
" VimShowHlGroup: Show highlight group name under a cursor
 command! VimShowHlGroup echo synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')

" VimShowHlItem: Show highlight item name under a cursor
 command! VimShowHlItem echo synIDattr(synID(line("."), col("."), 1), "name")

" ====================================================================
" Colorize Setting:
"
"colorscheme jellybeans
colorscheme hybrid

""" 行番号の色変更
autocmd ColorScheme * highlight LineNr ctermfg=238 guifg=#999999
"autocmd ColorScheme * highlight ModeMsg ctermfg=255

""" 行末の空白文字を可視化
highlight WhitespaceEOL cterm=underline ctermbg=red guibg=#FF0000
au BufWinEnter,WinEnter,VimEnter,BufRead * let w:m1 = matchadd("WhitespaceEOL", '\s\+$')

""" タブ文字を視覚化
highlight TabString ctermbg=red guibg=red
au BufWinEnter,WinEnter,VimEnter,BufRead * let w:m2 = matchadd("TabString", '^\t+')

""" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermbg=red guibg=#666666
au BufWinEnter,WinEnter,VimEnter,BufRead * let w:m3 = matchadd("ZenkakuSpace", '　')

""" 最後に拡張子別設定を読み込む(途中で読み込むと以降の.vimrcが適用されない）
filetype plugin on
