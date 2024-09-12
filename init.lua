vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.wrap = true
vim.o.linebreak = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.cmd('syntax on')
vim.o.clipboard = 'unnamedplus'
vim.o.mouse = 'a'
vim.cmd('colorscheme xcode_dark')

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'luckasRanarison/nvim-devdocs'
  use 'akinsho/toggleterm.nvim'

  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  }

  use 'airblade/vim-gitgutter'
  use 'romgrk/barbar.nvim'
  use 'preservim/nerdtree'
  use 'kyazdani42/nvim-web-devicons'
  use 'neoclide/coc.nvim' 
  use 'mattn/emmet-vim'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'tpope/vim-fugitive'
  use 'ctrlpvim/ctrlp.vim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'akinsho/nvim-bufferline.lua'
  use 'mhinz/vim-signify'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'

  -- use 'kyazdani42/nvim-tree.lua'
  use 'tpope/vim-obsession'
  use 'codota/tabnine-nvim'
  use 'jiangmiao/auto-pairs'
  use 'sheerun/vim-polyglot'
  use 'lewis6991/impatient.nvim'
  use 'ryanoasis/vim-devicons'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'sindrets/diffview.nvim'
  use 'stevearc/dressing.nvim'
end)

vim.g.coc_global_extensions = {
  'coc-tsserver',
  'coc-html',
  'coc-css',
  'coc-python',
  'coc-json',
  'coc-yaml',
  'coc-go',
  'coc-java',
  'coc-rust-analyzer'
}

vim.api.nvim_set_keymap('i', '<C-Space>', 'coc#refresh()', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', { noremap = true, silent = true })

vim.cmd([[
  augroup MyAutocmds
    autocmd!
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
  augroup END
]])

vim.api.nvim_set_keymap('n', '<C-L>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

vim.g.NERDTreeShowBookmarks = 1
vim.g.NERDTreeShowHidden = 1
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

vim.api.nvim_set_keymap('n', 'dd', '"_dd', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'd$', '"_d$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'd^', '"_d^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'd0', '"_d0', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'dG', '"_dG', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'dgg', '"_dgg', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'd%', '"_d%', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'd_', '"_d_', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'd}', '"_d}', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'd{', '"_d{', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'd(', '"_d(', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'd)', '"_d)', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'd<CR>', '"_d<CR>', { noremap = true, silent = true })

require('telescope').setup{}
vim.api.nvim_set_keymap('n', '<C-d>', ':Telescope current_buffer_fuzzy_find<CR>', { noremap = true, silent = true })

vim.g.user_emmet_leader_key = '<S-Tab>'
vim.api.nvim_set_keymap('i', '<S-Tab>', '<Plug>(emmet-expand-abbr)', { noremap = true, silent = true })

vim.cmd [[
  highlight BufferCurrent guifg=#ffffff guibg=#282c34 gui=bold
  highlight BufferVisible guifg=#ffffff guibg=#44475a
  highlight BufferInactive guifg=#6272a4 guibg=#282c34
  highlight BufferTabpages guifg=#ff5555 guibg=#282c34
]]

vim.cmd [[
  augroup MyColors
    autocmd!
    autocmd ColorScheme * highlight BufferCurrent guifg=#ffffff guibg=#282c34 gui=bold
    autocmd ColorScheme * highlight BufferVisible guifg=#ffffff guibg=#44475a
    autocmd ColorScheme * highlight BufferInactive guifg=#6272a4 guibg=#282c34
    autocmd ColorScheme * highlight BufferTabpages guifg=#ff5555 guibg=#282c34
  augroup END
]]

vim.api.nvim_set_keymap('n', '<C-Tab>', ':BufferNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-Tab>', ':BufferPrevious<CR>', { noremap = true, silent = true })

require("toggleterm").setup{
  size = 10,
  open_mapping = [[<C-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '1',
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true,
  shell = vim.o.shell, 
  float_opts = {
    border = 'curved',
    winblend = 3,
  }
}
