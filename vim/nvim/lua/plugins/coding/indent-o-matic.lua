return {
    "Darazaki/indent-o-matic",
    event = "BufReadPre",
    -- Pinned: c3683ab calls vim.treesitter.get_parser() bare, which throws on
    -- Neovim 0.11 for buffers without a parser (csv, pdf, ...) and breaks
    -- opening files from neo-tree. Unpin once upstream guards it or on 0.12+.
    commit = "764da1f30b5bb4a49035c3abc9a586322296b812",
}
