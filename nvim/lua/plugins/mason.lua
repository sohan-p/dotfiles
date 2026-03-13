---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "jdtls",
        "java-debug-adapter",
        "java-test",
        "lemminx",
        "lua-language-server",
        "stylua",
        "google-java-format",
      },
    },
  },
}
