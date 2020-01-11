if $compatible
  set nocompatible " Be iMproved
endif

set rtp+=~/.vim/
runtime! userautoload/init/*.vim
runtime! userautoload/dein/*.vim

let s:dein_dir = expand('~/.vim/dein')

"コマンド実行する $ git clone https://github.com/Shougo/dein.vim.git ~/.vim/dein/repos/github.com/Shougo/dein.vim
set rtp+=~/.vim/dein/repos/github.com/Shougo/dein.vim

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml('~/.vim/userautoload/dein/plugins.toml', {'lazy': 0})
  call dein#load_toml('~/.vim/userautoload/dein/lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

"シンタックスハイライト
syntax on

"配色設定
set t_Co=256
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none

"配色・ハイライト設定
highlight Comment ctermfg=239
highlight Number ctermfg=09
highlight LineNr ctermfg=07
highlight Directory ctermfg=118
highlight RubyInstanceVariable ctermfg=208
highlight htmlTag ctermfg=15
highlight htmlEndTag ctermfg=15
highlight Search term=reverse ctermfg=black ctermbg=248
"補完の配色
highlight Pmenu ctermbg=239
highlight PmenuSel ctermbg=6
highlight PMenuSbar ctermbg=239

" gitgutterの色
set updatetime=250
let g:gitgutter_max_signs = 500
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
highlight clear SignColumn
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4

"シンタックスハイライト(syntax onより前に書かない)
autocmd User Rails.view*                 NeoSnippetSource ~/.vim/snippet/ruby.rails.view.snip
autocmd User Rails.controller*           NeoSnippetSource ~/.vim/snippet/ruby.rails.controller.snip
autocmd User Rails/db/migrate/*          NeoSnippetSource ~/.vim/snippet/ruby.rails.migrate.snip
autocmd User Rails/config/routes.rb      NeoSnippetSource ~/.vim/snippet/ruby.rails.route.snip

" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#333333 ctermbg=235
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#2c2c2c ctermbg=240

"全角スペースをハイライト表示
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup ZenkakuSpace
  autocmd!
  autocmd ColorScheme       * call ZenkakuSpace()
  autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

colorscheme afterglow

set termguicolors
set guicursor=n-c-v:block-Cursor/Cursor-blinkon0
set guicursor+=i-ci:ver1-Cursor/Cursor-blinkwait300-blinkon200-blinkoff150
