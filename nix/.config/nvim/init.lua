vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.g.mapleader= " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
    lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
local plugins = {
    -- Colorscheme
    { "catppuccin/nvim", name = "catppuccin", priority = 100 },

    -- Syntax highlighting
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- LSP and Autocomplete
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },
    { "onsails/lspkind.nvim" },
    { "jose-elias-alvarez/null-ls.nvim" },

    -- File browsing and searching
    { 'nvim-telescope/telescope.nvim', tag = '0.1.6', dependencies = { 'nvim-lua/plenary.nvim' } },
    { 'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons' } }
}

require("lazy").setup(plugins, opts)

-- Colorscheme
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

-- Telescope setup
local builtin = require('telescope.builtin')
vim.keymap.set({'n', 'i', 'v'} , '<leader>p', function()
    builtin.find_files({
        hidden = true,
        previewer = true,
        file_ignore_patterns = {
            "node_modules/",
            "%.git/",
            "vendor/",
            "storage/",
            "dist/",
            "coverage/",
            "public/",
            "build/"
        }
    })
end, {})

vim.keymap.set({'n', 'i', 'v'}, '<D-S-p>', function()
  builtin.live_grep({
    hidden = true,
    previewer = true,
    file_ignore_patterns = {
      "node_modules/",
      "%.git/",
      "vendor/",
      "storage/",
      "dist/",
      "coverage/",
      "public/",
      "build/"
    }
  })
end, {})

-- Treesitter setup
local config = require("nvim-treesitter.configs")
config.setup({
    ensure_installed = {"lua", "javascript", "typescript", "php", "twig"},
    highlight = { enable = true },
    indent = { enable = true }
})

-- Nvim-tree setup
require("nvim-tree").setup({
  view = {
    side = "right",   -- Open tree on the right side
    width = 30,       -- Adjust width as needed
  },
  update_focused_file = {
    enable = true,    -- Highlight the currently open file
    update_cwd = true,
  },
  renderer = {
    indent_markers = {
      enable = true,  -- Show indentation guides
    },
    highlight_opened_files = "all",  -- Highlight open files
  },
  actions = {
    open_file = {
      quit_on_open = true,  -- Close nvim-tree when opening a file
      resize_window = true, -- Resize window on opening a file
    }
  }
})

vim.wo.number = true

-- Sync OS & Neovim clipboard
vim.o.clipboard = "unnamedplus"

vim.o.ignorecase = true
vim.o.smartcase = true

-- Keymaps
vim.keymap.set({'n', 'i', 'v'}, '<D-S-e>', '<cmd>NvimTreeToggle<CR>', {})
vim.keymap.set({'n', 'i', 'v'}, '<leader>cp', ':let @+ = expand("%:p")<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })

vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

local toggle_terminal = require('toggle_terminal')

vim.api.nvim_set_keymap('n', '<D-j>', ':lua require("toggle_terminal").toggle()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<D-j>', '<C-\\><C-n>:lua require("toggle_terminal").toggle()<CR>', { noremap = true, silent = true })


-- LSP setup
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "ts_ls", "intelephense", "phpactor" }
})

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- TypeScript/JavaScript LSP
lspconfig.ts_ls.setup({
    capabilities = capabilities,
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
    end
})

-- PHP LSP
lspconfig.intelephense.setup({
    capabilities = capabilities
})

-- PHP/Laravel specific LSP
lspconfig.phpactor.setup({
    capabilities = capabilities
})

-- Autocomplete setup
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    }),
    formatting = {
        format = require('lspkind').cmp_format({ with_text = true, menu = { buffer = "[Buffer]", nvim_lsp = "[LSP]", luasnip = "[Snippet]" } })
    }
})

-- Null-ls (formatting/linting)
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier.with({
            filetypes = { "javascript", "typescript", "json", "css", "php", "twig" }
        }),
        null_ls.builtins.formatting.phpcsfixer,
        null_ls.builtins.diagnostics.eslint
    }
})

