"prefix
nnoremap FF <C-w>

"Escape
inoremap ff <Esc>
vnoremap ff <Esc>

"ノーマルモードで行のどこにいても改行
nnoremap <CR> A<CR><Esc>

"上スライド
nnoremap MM ddkkp

"下スライド
nnoremap mm ddp

"行複製
nnoremap tt Yp
vnoremap tt yP

"shift+dでvisualモードで単語選択
nnoremap D viw

"閉じ括弧自動保管
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
" inoremap < <><LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

"カーソル上の単語検索
nnoremap <C-j> g*:noh<Enter>
nnoremap <C-k> g#:noh<Enter>

"ウインドウサイズ変更
"カレントウインドウの幅を増やす
nnoremap > <C-w>5>
"カレントウインドウの幅を減らす
nnoremap < <C-w>5<

"ハイライト切り替え
nnoremap <F3> :set hlsearch!<CR>

"ハイライト消す
nnoremap noh :noh<CR>

"タブリファクタリング
nnoremap tab :set expandtab<Enter>:retab<Enter>:w<Enter>

"設定ファイル読み込み
nnoremap <F5> :source ~/.config/nvim/init.vim<Enter>
nnoremap sou :source ~/.config/nvim/init.vim<Enter>


"文頭・文末
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $

" fzfショートカット
nnoremap gr :Ag<CR>
