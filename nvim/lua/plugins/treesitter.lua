---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    auto_install = true,
    ensure_installed = {
      "java",
      "lua",
      "vim",
      "vimdoc",
      "xml",
      "json",
      "yaml",
      "markdown",
      "markdown_inline",
      "kotlin",
      "dockerfile",
    },
  },
}
