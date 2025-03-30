-- Set treesitter query
vim.treesitter.query.set("markdown", "folds", "([(fenced_code_block) (indented_code_block) (section)] @fold (#trim! @fold))")

