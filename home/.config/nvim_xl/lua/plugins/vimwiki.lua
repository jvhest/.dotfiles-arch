return {
  "vimwiki/vimwiki",
  event = "VimEnter",
  init = function()
    -- setup vimwiki_list
    local wiki = {}
    wiki.path = "~/vimwiki/"
    wiki.syntax = "markdown"
    wiki.ext = "md"
    vim.g.vimwiki_list = { wiki }
    vim.g.vimwiki_global_ext = 1
  end,
}
