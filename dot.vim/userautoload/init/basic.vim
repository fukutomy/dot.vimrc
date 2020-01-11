"エンコード系
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

"ファイルフォーマット
set fileformat=unix

"ビープ音を消す
set belloff=all

"スクロール時に一番下までカーソルが移動しない
set scrolloff=5

"行番号表示
set number

"行の相対表示をやめる
set norelativenumber

"backspaceの機能設定(字下げ、行末、挿入の開始点を超えて削除)
set backspace=2

"カーソルがある行をハイライト表示
set cursorline

"カーソル位置のカラムをハイライト表示しない
set nocursorcolumn

"左右のカーソル移動で行移動
set whichwrap=b,s,h,l,<,>,[,]

"swapfileを生成しない
set noswapfile

"Always display the statusline in all windows
set laststatus=2

"Always display the tabline, even if there is only one tab
set showtabline=2

"検索したワードをハイライト
set hlsearch

"モード表示をOFF
set noshowmode

" クリップボード
set clipboard&
set clipboard^=unnamedplus

"Don't autofold anything
set foldlevel=100

"対応括弧に<>を追加
set matchpairs& matchpairs+=<:>

"対応括弧をハイライト表示する
set showmatch

"対応括弧の表示秒数を3秒にする
set matchtime=3

"改行時に前の行のインデントを計測
set autoindent

"改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

"新しい行を作った時に高度な自動インデントを行う
set smarttab

"タブをスペースに変換
set expandtab

"ファイル上のタブ文字の見た目の幅
set tabstop=4

"自動インデント時に挿入されるスペース量
set shiftwidth=2

"tabを押した時に挿入されるスペース量
set softtabstop=2

"高速ターミナル接続を行う
set ttyfast

"マクロなどの途中経過を描写しない
set lazyredraw

"カーソルの形指定
set guicursor=v:block-Cursor/lCursor-blinkon0,n-i-c-ci:ver50-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

"ファイルを開いたときにタブ文字があったらスペースに変換
autocmd BufNewFile,BufRead * set expandtab
autocmd BufNewFile,BufRead * retab

"ファイルタイプ
autocmd FileType vue syntax sync fromstart
autocmd FileType eruby syntax sync fromstart
autocmd BufNewFile,BufRead *.{html,htm} set filetype=html
autocmd BufNewFile,BufRead *.html.erb set filetype=html.eruby
autocmd BufNewFile,BufRead *.{pug*} set filetype=pug
autocmd BufNewFile,BufRead *.{jade*} set filetype=pug
autocmd BufRead,BufNewFile *.scss set filetype=sass
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.rb set filetype=ruby
autocmd BufRead,BufNewFile *.slim set filetype=slim
autocmd BufRead,BufNewFile *.js set filetype=javascript
autocmd BufRead,BufNewFile jquery.*.js set filetype=javascript syntax=jquery
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.pug.javascript.css
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\""
