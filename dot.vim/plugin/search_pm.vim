" search pm file by current cusor string
"
" add .vimrc
" noremap fg :call Search_pm('vne')<ENTER>
" noremap ff :call Search_pm('e')<ENTER>
" noremap fd :call Search_pm('sp')<ENTER>

" activate filetype plugin 
:filetype plugin on
" add path
autocmd FileType perl :setlocal path+=lib/
"do not judge [$&/] as part of filename when cmd called
autocmd FileType perl set isfname-=$
autocmd FileType perl set isfname-=&
autocmd FileType perl set isfname-=/
"judge > as part of filename when cmd called
autocmd FileType perl set isfname+=\>

" overload perl.vim
" hook when gf called and can't find file from path and cfile
autocmd FileType perl set includeexpr=Search_pm('gf')

function! Search_pm(cmd)
  let l:wrapscan_flag = &wrapscan

  let l:pm_path  = substitute(expand("<cfile>"),'::','/','g')
  let l:method = ''
  " if include cfile string -> 
  if l:pm_path =~ '->'
    let l:tmp  = substitute(pm_path,'\s*->.*$','','g')
    let l:method  = substitute(substitute(substitute(pm_path ,tmp,'','g'),'->','','g'),'\s','','g')
    let l:pm_path = l:tmp
  endif

  let l:pm_path  = substitute(pm_path,'$','.pm','')

  let l:path     = &l:path
  let l:path_arr = split(path,',')

  for i in range(0,len(path_arr)-1)
    let a_path = path_arr[i]
    if filereadable(a_path . '/' . pm_path)
      if a:cmd == 'gf'
        return a_path . '/' . pm_path
      else
        exe "bel ".a:cmd . " " . a_path . '/' . pm_path
        "if cfile includes -> try to jump line exists 'sub methodname'
        if l:method != ''
          " move to head of file
          exe ":1"
          try
            " throw E385 if not found when search / cmd executed
            :set nowrapscan
            exe "/sub ".method
          catch/E385/
          endtry
        call Set_wrapscan_if_on(wrapscan_flag)
        endif
        return
      endif
    endif
  endfor

  " when cfile is type 'Hoge::static_method' return path/to/Hoge.pm
  let l:new_pm_path = substitute(pm_path,'/[^(/)]*.pm$','','g')
  let l:const = substitute(pm_path,new_pm_path.'/','','g')
  let l:const = substitute(const,'.pm$','','g')

  let l:new_pm_path = new_pm_path . ".pm"
  for i in range(0,len(path_arr)-1)
    let a_path = path_arr[i]
    if filereadable(a_path . '/' . new_pm_path)
      if a:cmd == 'gf'
        return a_path . '/' . new_pm_path
      else
        exe "bel " . a:cmd . " " . a_path . '/' . new_pm_path
        exe ":1"
        try
          " throw E385 if not found when search / cmd executed
          :set nowrapscan
          exe "/sub ".const
        catch/E385/
          exe ":1"
          try
            exe "/".const
          catch/E385/
          endtry
        endtry
        call Set_wrapscan_if_on(wrapscan_flag)
        return
      endif
    endif
  endfor
endfunction

function! Set_wrapscan_if_on(flag)
  if a:flag == 1
    :set wrapscan
  endif
endfunction

