set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set wrap
set linebreak
set ignorecase
set smartcase
set hlsearch
set incsearch
syntax on
set clipboard=unnamedplus
set mouse=a
colorscheme xcode_dark

call plug#begin('~/.local/share/nvim/plugged')

Plug 'wbthomason/packer.nvim'
Plug 'luckasRanarison/nvim-devdocs'
Plug 'akinsho/toggleterm.nvim'

Plug 'folke/which-key.nvim'
autocmd User WhichKey call which_key#register('<Space>', "g:which_key_map")

Plug 'airblade/vim-gitgutter'
Plug 'romgrk/barbar.nvim'
Plug 'preservim/nerdtree'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'neoclide/coc.nvim' 
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'mhinz/vim-signify'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
Plug 'codota/tabnine-nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'lewis6991/impatient.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'stevearc/dressing.nvim'

call plug#end()

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-python',
  \ 'coc-json',
  \ 'coc-yaml',
  \ 'coc-go',
  \ 'coc-java',
  \ 'coc-rust-analyzer'
\]

inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <silent><expr> <Tab> pumvisible() ? "<C-n>" : "<Tab>"
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gy <Plug>(coc-type-definition)

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1

set nobackup nowritebackup noswapfile

nnoremap dd "_dd
nnoremap d$ "_d$
nnoremap d^ "_d^
nnoremap d0 "_d0
nnoremap dG "_dG
nnoremap dgg "_dgg
nnoremap d% "_d%
nnoremap d_ "_d_
nnoremap d} "_d}"
nnoremap d{ "_d{"
nnoremap d( "_d("
nnoremap d) "_d)"
nnoremap d<CR> "_d<CR>

lua require('telescope').setup{}
nnoremap <C-d> :Telescope current_buffer_fuzzy_find<CR>

let g:user_emmet_leader_key='<S-Tab>'
inoremap <expr><S-Tab> emmet#expandAbbrIntelligent("\<tab>")

highlight BufferCurrent guifg=#ffffff guibg=#282c34 gui=bold
highlight BufferVisible guifg=#ffffff guibg=#44475a
highlight BufferInactive guifg=#6272a4 guibg=#282c34
highlight BufferTabpages guifg=#ff5555 guibg=#282c34

augroup MyColors
  autocmd!
  autocmd ColorScheme * highlight BufferCurrent guifg=#ffffff guibg=#282c34 gui=bold
  autocmd ColorScheme * highlight BufferVisible guifg=#ffffff guibg=#44475a
  autocmd ColorScheme * highlight BufferInactive guifg=#6272a4 guibg=#282c34
  autocmd ColorScheme * highlight BufferTabpages guifg=#ff5555 guibg=#282c34
augroup END

nnoremap <C-L> :NERDTreeToggle<CR>
nnoremap <C-Tab> :BufferNext<CR>
nnoremap <C-S-Tab> :BufferPrevious<CR>


lua require("toggleterm").setup{
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
