-- command! TidyJIRA call TidyJIRAFunc()
vim.api.nvim_exec([[
  command! TidyJIRA call TidyJIRAFunc()
  function! TidyJIRAFunc()
    :set ft=markdown
    :v/SPPC/d
    :%s/\(SPPC-\d\{5\}\)\s*\nSPPC-\d\{5\}\s*/[[\1](https:\/\/jira.shopee.io\/browse\/\1)] /
    :%norm A
  endfunc
]], true)

vim.api.nvim_exec([[
func! RunVimRun()
    :w
    if &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'go'
        " :GoRun
        set splitbelow
        :sp
        :term go run %
    elseif &filetype == 'python'
        set splitbelow
        :sp
        :term python3 %
    elseif &filetype == 'markdown'
        exec "MarkdownPreview"
    elseif &filetype == 'xhtml'
        :!open % -a Google\ Chrome
    elseif &filetype == 'dot'
        let current_file_name=expand('%:r')
        let output_file_path=current_file_name . '.png'
        exec "!dot -Tpng % -o " . output_file_path
        exec "!open " . output_file_path
    elseif &filetype == 'mermaid'
        " let current_file_name=expand('%:r')
        " let output_file_path=current_file_name . '.png'
        " exec "!mmdc -H -i " . current_file_name . ".mmd -o " output_file_path . " -t bright -b transparent"
        " exec "!open " . output_file_path
        exec "!mermaid %"
    elseif &filetype == 'scala'
        set splitbelow
        :sp
        :term scala %
    endif
endfunc
]], true)
