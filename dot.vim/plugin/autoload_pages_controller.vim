function! s:AutoLoadPagesController()
    let l:LIB_PATH = "lib/"
    let l:regexPagesFile = "^\\%(\\w\\+:\\{2\\}\\)\\+Controller:\\{2\\}\\%(\\w\\+:\\{2\\}\\)\\+\\%(\\w\\+\\)->display;$"
    let l:lastLineNo = line("$")
    let l:i = 0
    while i < lastLineNo
        let i = i + 1
        let l:line = getline(i)
        let l:c = matchstr(line, regexPagesFile)
        if c != ""
            let l:pagesFileName = substitute(c, "::", "/", "g")
            let l:pagesFileName = substitute(pagesFileName, "->display", "", "g")
            let l:pagesFileName = substitute(pagesFileName, ";", ".pm", "g")
            let l:currentFilePath      = expand("%:p")
            let l:currentDirectoryPath = substitute(currentFilePath, "\\w\\+\\.pl$", "", "g")
            let l:pagesFilePath        = currentDirectoryPath . LIB_PATH . pagesFileName

            if !filereadable(pagesFilePath)
                "for subdomain
                let l:parentPath    = substitute(currentDirectoryPath, "\/\\w\\+\/$", "\/", "")
                let l:pagesFilePath = parentPath . LIB_PATH . pagesFileName
            endif

            if filereadable(pagesFilePath)
                let l:choice = confirm("found \"" . c . "\"\nopen Pages file ok? ( " . pagesFilePath . " )", "&y\n&n\n")

                if choice == 1
                    let l:cmd = "n " . pagesFilePath
                    try
                        exe cmd
                    catch
                        echo v:exception
                    endtry
                    set filetype=perl
                endif
                break
            endif
        endif
    endwhile
endfunction

autocmd BufRead *.pl :call s:AutoLoadPagesController()
