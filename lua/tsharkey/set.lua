vim.opt.nu = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.termguicolors = true
vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.swapfile = true
vim.opt.directory = vim.fn.expand("~/.vim/swap")
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.undofile = true

vim.opt.splitright = true
vim.opt.splitbelow = true

-- use system keyboard and enable mouse support
vim.opt.clipboard:append("unnamedplus")
vim.opt.mouse:append("a")

vim.opt.cmdheight = 0
vim.opt.cursorline = true
vim.opt.autowriteall = true
vim.opt.autoread = true

