---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- Java development pack (jdtls, nvim-jdtls, debugger, treesitter)
  { import = "astrocommunity.pack.java" },

  -- Lua support (useful for editing nvim config)
  { import = "astrocommunity.pack.lua" },

  -- JSON/YAML support (common in Java projects for configs)
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.xml" },

  -- Docker support (common in Java microservices)
  { import = "astrocommunity.pack.docker" },
}
