set nocompatible

"syntax enable
filetype plugin indent on

" Hybrid line numbers
set number relativenumber

" Tabs
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

inoremap ;; <Esc>/<++><Enter>"_c4l

" LaTeX stuff
" autocmd BufWritePost *.tex silent! execute "!xelatex % >/dev/null 2>&1" | redraw!

autocmd FileType tex inoremap ;bf \textbf{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i

autocmd FileType html inoremap ;p <p><Enter><Enter></p><Esc>ki

call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'sbdchd/neoformat'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'rust-lang/rust.vim'

call plug#end()

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

colorscheme gruvbox
set background=dark

lua require('lspconfig').clangd.setup{ }

