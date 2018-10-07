" setting all tab spaces to use 4 spaces instead of one \t
" https://stackoverflow.com/a/234578
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" here because vim 7's default is noautoindent
" otherwise, this isn't really needed for neovim lol
set autoindent

" show line numbers
" https://stackoverflow.com/a/10274166
set number

" ignores case and smartcase so that if a pattern contains uppercase, it is case sensitive
" http://vim.wikia.com/wiki/Searching (under 'Case Sensitivity')
set ignorecase
set smartcase

" shows trailing whitespace
" https://www.reddit.com/r/vim/comments/4hoa6e/what_do_you_use_for_your_listchars/d2ra7qh/
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

" shows the command as visual feedback for using the leader key
set showcmd

" sets general buffer keybinds and options
" https://github.com/ap/vim-buftabline#buffer-basics
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-B> :bprev<CR>

set autoread

" allows one line above/below the cursor when scrolling down a file
set scrolloff=1

" uses the system clipboard
set clipboard^=unnamed,unnamedplus

" Sets this to delete the current buffer WITHOUT deleting the window
" this is useful when working with multiple tabs since tabs are a collection
" of windows
" https://stackoverflow.com/a/4468491
command Bd bp|bd #

" removes all trailing whitespace
command RmTrail %s/\s\+\n/\r/g|noh

" Sets the line ruler to 80 for better veritcal split viewing
" autocmd FileType python setlocal colorcolumn=82   " python
au BufRead,BufNewFile *.bf setlocal colorcolumn=82  " brainfuck
au BufRead,BufNewFile *.s setlocal colorcolumn=82   " assembly
highlight ColorColumn ctermbg=236

" sets a specific highlight color as dark yellow
syntax on
set hlsearch
hi Search ctermbg=3

" sets the folding colors to not kill my eyes per fold
hi Folded ctermbg=236
hi Folded ctermfg=252


" Sets all .fena files to use the config syntax highlighting
au BufRead,BufNewFile *.fena setfiletype conf

" specifically a folding method for the 'Random.txt' file
autocmd BufRead,BufNewFile ~/pgc/prog/Other/notes/Random.txt set foldmethod=marker foldmarker=//<,//>
autocmd BufRead,BufNewFile /mnt/c/Users/Austin\-zs/Documents/Austin/powder\ game\ code/Programming/Other/notes/Random.txt set foldmethod=marker foldmarker=//<,//>


" using vim-plug
" installed using :PlugInstall
call plug#begin('~/.local/share/nvim/plugged')

" vim surround (check out vim sandwich?)
Plug 'git://github.com/tpope/vim-surround.git'

" allows vim surround to repeat
Plug 'https://github.com/tpope/vim-repeat.git'

" better makesession
Plug 'https://github.com/tpope/vim-obsession.git'

" Airline
Plug 'https://github.com/vim-airline/vim-airline.git'

" Airline with tablines and buffers
" Display buffers on tabline
let g:airline#extensions#tabline#enabled = 1
" Show the buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1
" Remove the showing of tabs to show buffers better
let g:airline#extensions#tabline#show_tabs = 0

" Airline with ALE
let airline#extensions#ale#error_symbol = 'ERROR:'
let airline#extensions#ale#warning_symbol = 'WARN:'

" Async lint engine (ALE)
Plug 'https://github.com/w0rp/ale.git'

" Sets pylint3 as the pylint executable
let g:ale_python_pylint_executable = 'pylint3'

" sets the only python linter as pylint3
let b:ale_linters = {'python': ['pylint']}

" Vim markdown highlighting once again
Plug 'https://github.com/plasticboy/vim-markdown.git'

" Markdown Removes folding
let g:vim_markdown_folding_disabled = 1

" Shows git changes
Plug 'airblade/vim-gitgutter'

" How long it takes for git signs to show up in milliseconds
set updatetime=100

" Changed characters for gitgutter to better highlight each line and to better
" match vscode's git lines
let g:gitgutter_sign_added              = '█'
let g:gitgutter_sign_modified           = '█'
let g:gitgutter_sign_removed            = '▄'
let g:gitgutter_sign_removed_first_line = '▀'
let g:gitgutter_sign_modified_removed   = '▀'

" Markdown preview
" Note that this does NOT work using linux subsystem for windows
" although it works in ubuntu 18.04
Plug 'iamcco/markdown-preview.vim'

" Initialize plugin system
call plug#end()

" ALE binding to jump to the next or previous error
" note that both mappings work
" nmap <silent> <leader>aj :ALENext<cr>
" nmap <silent> <leader>ak :ALEPrevious<cr>
nmap <silent> <leader>aj <Plug>(ale_next_wrap)
nmap <silent> <leader>ak <Plug>(ale_previous_wrap)

" Markdown preview bindings
nmap <silent> <F8> <Plug>MarkdownPreview
imap <silent> <F8> <Plug>MarkdownPreview
nmap <silent> <F9> <Plug>StopMarkdownPreview
imap <silent> <F9> <Plug>StopMarkdownPreview


" look into:
" https://github.com/ap/vim-buftabline
" https://github.com/zefei/vim-wintabs
" https://github.com/scrooloose/nerdtree
"
" https://github.com/iamcco/markdown-preview.vim
" https://github.com/JamshedVesuna/vim-markdown-preview
" https://github.com/miyakogi/livemark.vim
"
" https://stackoverflow.com/questions/102384/using-vims-tabs-like-buffers
" https://stackoverflow.com/questions/26708822/why-do-vim-experts-prefer-buffers-over-tabs

" temp macros for kaizo trap lmao
" zero
" let @1 = 'A7a 65 72 6f 20 '
" one
" let @2 = 'A6f 6e 65 20 '


