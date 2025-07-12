| mode      | keymap               | descr                                   |
| --------- | -------------------- | --------------------------------------- |
|           |                      | == Windows ==                           |
| n         | <leader>ww           | Other window                            |
| n         | <leader>wd           | Delete window                           |
| n         | <leader>w-           | Split window below                      |
| n         | <leader>w<pipe>      | Split window right                      |
| n         | <leader>-            | Split window below                      |
| n         | <leader><pipe>       | Split window right                      |
| --------- | -------------------- | --------------------------------------- |
|           |                      | == Move to Window ==                    |
| n         | <C-h>                | Go to left window                       |
| n         | <C-j>                | Go to lower window                      |
| n         | <C-k>                | Go to upper window                      |
| n         | <C-l>                | Go to right window                      |
| --------- | -------------------- | --------------------------------------- |
|           |                      | == Resize Window ==                     |
| n         | <C-Up>               | Increase window height                  |
| n         | <C-Down>             | Decrease window height                  |
| n         | <C-Left>             | Decrease window width                   |
| n         | <C-Right>            | Increase window width                   |
| --------- | -------------------- | --------------------------------------- |
|           |                      | == Move Lines ==                        |
| n         | <A-j>                | Move down                               |
| n         | <A-k>                | Move up                                 |
| i         | <A-j>                | Move down                               |
| i         | <A-k>                | Move up                                 |
| v         | <A-j>                | Move down                               |
| v         | <A-k>                | Move up                                 |
| --------- | -------------------- | --------------------------------------- |
|           |                      | == Buffers ==                           |
| n         | <S-h>                | Prev buffer                             |
| n         | <S-l>                | Next buffer                             |
| n         | [b                   | Prev buffer                             |
| n         | ]b                   | Next buffer                             |
| n         | <leader>bb           | Switch to Other Buffer                  |
| n         | <leader>`            | Switch to Other Buffer                  |
| --------- | -------------------- | --------------------------------------- |
|           |                      | == Clear search with <esc> ==           |
| n,i       | <esc>                | Escape and clear hlsearch               |
| n         | <leader>ur           | Redraw / clear hlsearch / diff update   |
| --------- | -------------------- | --------------------------------------- |
|           |                      | == Next/Prev search result ==           |
| n,x,o     | n                    | Next search result                      |
| n,x,o     | N                    | Prev search result                      |
| --------- | -------------------- | --------------------------------------- |
|           |                      | == Add undo break-points ==             |
| i         | ,                    | ,<c-g>u                                 |
| i         | .                    | .<c-g>u                                 |
| i         | ;                    | ;<c-g>u                                 |
| --------- | -------------------- | --------------------------------------- |
|           |                      | == Files ==                             |
| n         | <leader>fn           | New File                                |
| n,i,x,s   | <C-s>                | Save file                               |
| n         | <leader>qq           | Quit all                                |
| n         | <leader>K            | Keywordprg                              |
| --------- | -------------------- | --------------------------------------- |
|           |                      | == Better indenting ==                  |
| v         | <                    | dedent                                  |
| v         | >                    | indent                                  |
| --------- | -------------------- | --------------------------------------- |
|           |                      | == Quickfix ==                          |
| n         | <leader>xl           | Location List                           |
| n         | <leader>xq           | Quickfix List                           |
| n         | [q                   | Previous quickfix                       |
| n         | ]q                   | Next quickfix                           |
| --------- | -------------------- | --------------------------------------- |
| n,v       | <leader>cf           | == Format file ==                       |
| --------- | -------------------- | --------------------------------------- |
|           |                      | == Diagnostic ==                        |
| n         | <leader>cd           | Line Diagnostic                         |
| n         | ]d                   | Next Diagnostic                         |
| n         | [d                   | Prev Diagnostic                         |
| n         | ]e                   | Next Error                              |
| n         | [e                   | Prev Error                              |
| n         | ]w                   | Next Warning                            |
| n         | [w                   | Prev Warning                            |
|           |                      |                                         |
|           |                      | == Toggle options ==                    |
| n         | <leader>uf           | Toggle auto format (global)             |
| n         | <leader>uF           | Toggle auto format (buffer)             |
| n         | <leader>us           | Toggle Spelling                         |
| n         | <leader>uw           | Toggle Word Wrap                        |
| n         | <leader>uL           | Toggle Relative Line Numbers            |
| n         | <leader>ul           | Toggle Line Numbers                     |
| n         | <leader>ud           | Toggle Diagnostics                      |
| n         | <leader>uc           | Toggle Conceal                          |
| n         | <leader>uh           | Toggle Inlay Hints                      |
| n         | <leader>uT           | Toggle Treesitter Highlight             |
| --------- | -------------------- | --------------------------------------- |
|           |                      | == LazyVim ==                           |
| n         | <leader>l            | Lazy                                    |
| n         | <leader>L            | LazyVim Changelog                       |
| n         | <leader>ui           | Inspect Pos                             |
| --------- | -------------------- | --------------------------------------- |
|           |                      | == Floating terminal ==                 |
| n         | <leader>ft           | Terminal (root dir)                     |
| n         | <leader>fT           | Terminal (cwd)                          |
| n         | <c-/>                | Terminal (root dir)                     |
| n         | <c-\_>               | which key ignore                        |
| --------- | -------------------- | --------------------------------------- |
|           |                      | == Lazygit ==                           |
| n         | <leader>gg           | Lazygit (root dir)                      |
| n         | <leader>gG           | Lazygit (cwd)                           |
| --------- | -------------------- | --------------------------------------- |
|           |                      | == Terminal Mappings ==                 |
| t         | <esc><esc>           | Enter Normal Mode                       |
| t         | <C-h>                | Go to left window                       |
| t         | <C-j>                | Go to lower window                      |
| t         | <C-k>                | Go to upper window                      |
| t         | <C-l>                | Go to right window                      |
| t         | <C-/>                | Hide Terminal                           |
| t         | <c-\_>               | which key ignore                        |
| --------- | -------------------- | --------------------------------------- |
|           |                      | == Tabs ==                              |
| n         | <leader><tab>l       | Last Tab                                |
| n         | <leader><tab>f       | First Tab                               |
| n         | <leader><tab><tab>   | New Tab                                 |
| n         | <leader><tab>]       | Next Tab                                |
| n         | <leader><tab>d       | Close Tab                               |
| n         | <leader><tab>[       | Previous Tab                            |
| --------- | -------------------- | --------------------------------------- |
|           |                      | == Sessions ==                          |
| n         | <leader>qs           | Restore Session                         |
| n         | <leader>ql           | Restore Last Session                    |
| n         | <leader>qd           | Don't Save Current Session              |
| --------- | -------------------- | --------------------------------------- |
|           |                      | == Language Server ==                   |
| n         | <leader>cl           | Lsp Info                                |
| n         | gd                   | Goto Definition                         |
| n         | gr                   | References                              |
| n         | gD                   | Goto Declaration                        |
| n         | gI                   | Goto Implementation                     |
| n         | gy                   | Goto T[y]pe Definition                  |
| n         | K                    | Hover                                   |
| n         | gK                   | signatureHelp                           |
| i         | <c-k>                | Signature Help                          |
| n,v       | <leader>ca           | Code Action                             |
| n         | <leader>cA           | Source Action                           |
| n         | <leader>cr           | Rename                                  |
| --------- | -------------------- | --------------------------------------- |
| n         | <leader>sr           | Replace in files (Spectre)              |
| --------- | -------------------- | --------------------------------------- |
|           |                      | == Telescope ==                         |
| n         | <leader>,            | Switch Buffer                           |
| n         | <leader>/            | Grep (root dir)                         |
| n         | <leader>:            | Command History                         |
| n         | <leader><space>      | Find Files (root dir)                   |
| --------- | -------------------- | --------------------------------------- |
|           |                      | == Telescope - find ==                  |
| n         | <leader>fb           | Buffers                                 |
| n         | <leader>fc           | Find Config File                        |
| n         | <leader>ff           | Find Files (root dir)                   |
| n         | <leader>fF           | Find Files (cwd)                        |
| n         | <leader>fr           | Recent                                  |
| n         | <leader>fR           | Recent (cwd)                            |
| --------- | -------------------- | --------------------------------------- |
|           |                      | == Telescope - git ==                   |
| n         | <leader>gc           | commits                                 |
| n         | <leader>gs           | status                                  |
| --------- | -------------------- | --------------------------------------- |
|           |                      | == Telescope - search ==                |
| n         | <leader>s"           | Registers                               |
| n         | <leader>sa           | Auto Commands                           |
| n         | <leader>sb           | Buffer                                  |
| n         | <leader>sc           | Command History                         |
| n         | <leader>sC           | Commands                                |
| n         | <leader>sd           | Document diagnostics                    |
| n         | <leader>sD           | Workspace diagnostics                   |
| n         | <leader>sg           | Grep (root dir)                         |
| n         | <leader>sG           | Grep (cwd)                              |
| n         | <leader>sh           | Help Pages                              |
| n         | <leader>sH           | Search Highlight Groups                 |
| n         | <leader>sk           | Key Maps                                |
| n         | <leader>sM           | Man Pages                               |
| n         | <leader>sm           | Jump to Mark                            |
| n         | <leader>so           | Options                                 |
| n         | <leader>sR           | Resume                                  |
| n         | <leader>sw           | Word (root dir)                         |
| n         | <leader>sW           | Word (cwd)                              |
| n         | <leader>sw           | Selection (root dir)                    |
| n         | <leader>sW           | Selection (cwd)                         |
| n         | <leader>uC           | Colorscheme with preview                |
| n         | <leader>ss           | Goto Symbol                             |
| n         | <leader>sS           | Goto Symbol (Workspace)                 |

|       |             | == Noice ==        |
| ----- | ----------- | ------------------ |
|       |             | == Noice ==        |
| c     | <S-Enter>   | Redirect Cmdline   |
| n     | <leader>snl | Noice Last Message |
| n     | <leader>snh | Noice History      |
| n     | <leader>sna | Noice All          |
| n     | <leader>snd | Dismiss All        |
| n,i,s | <c-f>       | Scroll forward     |
| n,i,s | <c-b>       | Scroll backward    |

|     |            | == Noice ==                          |
| --- | ---------- | ------------------------------------ |
| n   | <leader>fP | Find Plugin File                     |
| n   | ;f         | Lists files (cwd + gitignore)        |
| n   | ;r         | Live Grep (cwd + .gitignore)"        |
| n   | ;t         | List help tags                       |
| n   | ;;         | Resume previous picker               |
| n   | ;e         | List Diagnostics for open buffer(s)  |
| n   | ;s         | Lists Function names, variables      |
| n   | sf         | Open File Browser in the buffer path |
