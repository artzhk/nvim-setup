return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() 
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_install = { "c", "cpp", "typescript", "javascript", "lua", "html", "scss", "vim", "python", "json"},
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        italic = false,
      })
    end
  }
}
