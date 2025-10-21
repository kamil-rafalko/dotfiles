local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.9'})


--LSP
Plug('neovim/nvim-lspconfig')
Plug('nvim-lua/completion-nvim')


vim.call('plug#end')

vim.opt.tabstop = 4
vim.opt.number = true

--vim.lsp.enable('pyright')
--vim.lsp.enable('gopls')


vim.lsp.config['gopls'] = {
		cmd = { 'gopls' },
		filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
}

vim.lsp.enable('gopls')

local bufopts = { noremap = true, silent = true, buffer = bufnr }

vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, bufopts)

