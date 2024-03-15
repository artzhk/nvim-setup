-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use({
        "rebelot/kanagawa.nvim",
        as = "kanagawa",
    })

    use({ 'nvim-treesitter/nvim-treesitter', as = 'treesitter', { run = ':TSUpdate' } })

    use {
        'nvim-telescope/telescope.nvim',
        as = 'telescope',
        tag = '0.1.5',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        "ThePrimeagen/harpoon",
        as = "harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    use({ 'mbbill/undotree', as = 'undotree' })
    use({ 'tpope/vim-fugitive', as = 'fugitive' })
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },

            -- Snippets
            { 'L3MON4D3/LuaSnip',
                requires = { 'rafamadriz/friendly-snippets' }
            },
        }
    }

    use { "github/copilot.vim", as = "copilot" }
    use {
        "pmizio/typescript-tools.nvim",
        requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("typescript-tools").setup {
                settings = {
                    tsserver_file_preferences = {
                        importModuleSpecifierPreference = "non-relative",
                    },
                    expose_as_code_action = "all",
                }
            }
        end,
   }
end)
