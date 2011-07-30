syntax on

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number
set incsearch
set tags=tags
set laststatus=2

set encoding=euc-jp
set fileencoding=euc-jp

nmap <silent> ,ge :set iskeyword+=:<CR>"vyiw:edit `perl -Ilib -It/inc /usr/bin/perldoc -l <C-r>v`<CR>:set iskeyword-=:<CR>
nmap <silent> ,gn :set iskeyword+=:<CR>"vyiw:new `perl -Ilib -It/inc /usr/bin/perldoc -l <C-r>v`<CR>:set iskeyword-=:<CR>
nmap <silent> ,gv :set iskeyword+=:<CR>"vyiw:vnew `perl -Ilib -It/inc /usr/bin/perldoc -l <C-r>v`<CR>:set iskeyword-=:<CR>
nmap <silent> ,gt :set iskeyword+=:<CR>"vyiw:tabedit `perl -Ilib -It/inc /usr/bin/perldoc -l <C-r>v`<CR>:set iskeyword-=:<CR>

set splitright

autocmd FileType yaml nmap ,s :!perl -e 'use YAML; eval {YAML::Load("'"."%"."'");}; print $@;'<CR>
autocmd FileType perl nmap ,s :!perl -wc -Ilib -It/inc %

set list
set listchars=eol:\ ,trail:$

set mouse=a
set ttymouse=xterm2

map <silent> sy :call YanktmpYank()<CR> 
map <silent> sp :call YanktmpPaste_p()<CR> 
map <silent> sP :call YanktmpPaste_P()<CR> 

set syntax=on
setlocal omnifunc=syntaxcomplete#Complete

set t_Co=256
set background=dark
au BufRead,BufNewFile *.t    set filetype=perl
au BufRead,BufNewFile *.tmpl    set filetype=html

if &term =~ "xterm"
  "256 color --
  let &t_Co=256
  " restore screen after quitting
  set t_ti=ESC7ESC[rESC[?47h t_te=ESC[?47lESC8
  if has("terminfo")
    let &t_Sf="\ESC[3%p1%dm"
    let &t_Sb="\ESC[4%p1%dm"
  else
    let &t_Sf="\ESC[3%dm"
    let &t_Sb="\ESC[4%dm"
  endif
endif

colorscheme wombat256

