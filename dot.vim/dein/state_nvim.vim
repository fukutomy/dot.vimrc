if g:dein#_cache_version !=# 150 || g:dein#_init_runtimepath !=# '/Users/takahirofukutomi/.config/nvim,/etc/xdg/nvim,/Users/takahirofukutomi/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/usr/local/Cellar/neovim/0.4.3/share/nvim/runtime,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/takahirofukutomi/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/takahirofukutomi/.config/nvim/after,/Users/takahirofukutomi/.vim/,/Users/takahirofukutomi/.vim/dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/takahirofukutomi/.config/nvim/init.vim', '/Users/takahirofukutomi/.vim/userautoload/dein/plugins.toml', '/Users/takahirofukutomi/.vim/userautoload/dein/lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/takahirofukutomi/.vim/dein'
let g:dein#_runtime_path = '/Users/takahirofukutomi/.vim/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/Users/takahirofukutomi/.vim/dein/.cache/init.vim'
let &runtimepath = '/Users/takahirofukutomi/.config/nvim,/etc/xdg/nvim,/Users/takahirofukutomi/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/Users/takahirofukutomi/.vim/dein/repos/github.com/junegunn/fzf,/Users/takahirofukutomi/.vim/dein/repos/github.com/neoclide/coc.nvim,/Users/takahirofukutomi/.vim/dein/.cache/init.vim/.dein,/usr/local/Cellar/neovim/0.4.3/share/nvim/runtime,/Users/takahirofukutomi/.vim/dein/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/takahirofukutomi/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/takahirofukutomi/.config/nvim/after,/Users/takahirofukutomi/.vim/,/Users/takahirofukutomi/.vim/dein/repos/github.com/Shougo/dein.vim'
filetype off
  map p <Plug>(miniyank-autoput)
  map P <Plug>(miniyank-autoPut)
  command! -bang -nargs=* Rg call fzf#vim#grep(   'rg --line-number --no-heading '.shellescape(<q-args>), 0,   fzf#vim#with_preview({'options': '--exact --reverse'}, 'right:50%:wrap'))
  let g:html5_event_handler_attributes_complete = 1
  let g:html5_rdfa_attributes_complete = 1
  let g:html5_microdata_attributes_complete = 1
  let g:html5_aria_attributes_complete = 1
  let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.erb,*.php,*.vue'
  let g:indent_guides_enable_on_vim_startup=1
  let g:indent_guides_auto_colors = 0
  let g:indent_guides_exclude_filetypes = ['help', 'vimfiler']
  let g:airline#extensions#branch#enabled = 1
  nnoremap [fugitive]  <Nop>
  nmap <space>g [fugitive]
  nnoremap <silent> [fugitive]s :Gstatus<CR><C-w>T
  nnoremap <silent> [fugitive]a :Gwrite<CR>
  nnoremap <silent> [fugitive]c :Gcommit-v<CR>
  nnoremap <silent> [fugitive]b :Gblame<CR>
  nnoremap <silent> [fugitive]p :Gpull<CR>
  nnoremap <silent> [fugitive]d :Gdiff<CR>
  nnoremap <silent> [fugitive]m :Gmerge<CR>
  let g:vim_json_syntax_conceal = 0
  noremap <Space><Space> <Esc>:call buffer_selector#OpenBufferSelector()<Enter>
  augroup vimfiler
    autocmd!
    autocmd FileType vimfiler call s:vimfiler_settings()
  augroup END
  function! s:vimfiler_settings()
    nnoremap <silent><buffer><expr> s vimfiler#do_switch_action('split')
    nnoremap <silent><buffer><expr> v vimfiler#do_switch_action('vsplit')
  endfunction
  let g:vimfiler_as_default_explorer=1
  let g:vimfiler_safe_mode_by_default = 0
  let g:vimfiler_tree_leaf_icon = " "
  let g:vimfiler_tree_opened_icon = ' '
  let g:vimfiler_tree_closed_icon = ' '
  let g:vimfiler_file_icon = '- '
  let g:vimfiler_marked_file_icon = '✓ '
  let g:vimfiler_readonly_file_icon = '✗ '
  let g:vimfiler_ignore_pattern = '^\%(.git\|.DS_Store\)$'
  nnoremap fi :VimFilerBufferDir<CR>
  nnoremap fe :VimFilerExplorer  -split -winwidth=35 -toggle -no-quit<CR>
  set laststatus=2
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  let g:airline#extensions#whitespace#mixed_indent_algo = 1
  let g:airline_theme = 'dark'
  let g:endwise_no_mappings=1
  let g:deoplete#enable_at_startup = 1
  set completeopt+=noinsert
source ~/.config/nvim/coc-settings.json
  let g:highlightedyank_highlight_duration = 200
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction
  nmap ww gcc
  vmap ww gcc
  if !exists('g:tcomment_types')
      let g:tcomment_types = {}
  endif
  let g:tcomment_types['eruby'] = '<%# %s %>'
  let g:tcomment_types['erb'] = '<%# %s %>'
  let g:tcomment_types['scss'] = '/* %s */'
  let g:tcomment_types['pug'] = '// %s'
  let g:tcomment_types['toml'] = '# %s'
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['txt'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['erb'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['slim'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['scss'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sass'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['coffee'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['rb'] = ''
