local trust_store_arg = "-Djavax.net.ssl.trustStore=" .. os.getenv("HOME") .. "/ssl/pcln_cacerts"

return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      opts.on_attach = function(...)
        require("jdtls").setup_dap {
          hotcodereplace = "auto",
          config_overrides = { vmArgs = trust_store_arg },
        }
        local astrolsp_avail, astrolsp = pcall(require, "astrolsp")
        if astrolsp_avail then astrolsp.on_attach(...) end
      end
    end,
    config = function(_, opts)
      vim.api.nvim_create_autocmd("Filetype", {
        pattern = "java",
        callback = function()
          if opts.root_dir and opts.root_dir ~= "" then
            require("jdtls").start_or_attach(opts)
          else
            require("astrocore").notify(
              "jdtls: root_dir not found. Please specify a root marker",
              vim.log.levels.ERROR
            )
          end
        end,
      })
      vim.api.nvim_create_autocmd("LspAttach", {
        pattern = "*.java",
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == "jdtls" then
            require("jdtls.dap").setup_dap_main_class_configs {
              config_overrides = { vmArgs = trust_store_arg },
            }
          end
        end,
      })
    end,
  },
}
