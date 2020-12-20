" TODO:
" - coc.vim -> ale
" - look for debugging plugins

" temp fix to normal colors?
set background=light

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

" highlights column & row of cursor
" PROBLEM is that this highlighting take priority over pretty much everything
" figure out a way where this highlighting is the lowest priority
" highlight CursorColumn ctermbg=232
" highlight CursorLine cterm=none ctermbg=232
" set cursorline
" set cursorcolumn

" Add to .vimrc (.nvimrc) to enable project-specific vimrc
" exrc allows loading local executing local rc files.
" secure disallows the use of :autocmd, shell and write commands in local .vimrc files.
" https://github.com/dense-analysis/ale/issues/1616#issuecomment-583536290
"set exrc
"set secure



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
au BufRead,BufNewFile *.tex setlocal colorcolumn=82 " latex

" Sets tab spaces to 2
au BufRead,BufNewFile *.js setlocal tabstop=2       " javascript
au BufRead,BufNewFile *.js setlocal shiftwidth=2
"au BufRead,BufNewFile *.g4 setlocal tabstop=2
"au BufRead,BufNewFile *.g4 setlocal shiftwidth=2
au BufRead,BufNewFile *.css setlocal tabstop=2
au BufRead,BufNewFile *.css setlocal shiftwidth=2
au BufRead,BufNewFile *.scm setlocal tabstop=2      " scheme
au BufRead,BufNewFile *.scm setlocal shiftwidth=2
au BufRead,BufNewFile *.html setlocal tabstop=2
au BufRead,BufNewFile *.html setlocal shiftwidth=2

" temp for cmput 415 c/c++:
"au BufRead,BufNewFile *.c setlocal tabstop=2
"au BufRead,BufNewFile *.c setlocal shiftwidth=2
"au BufRead,BufNewFile *.cpp setlocal tabstop=2
"au BufRead,BufNewFile *.cpp setlocal shiftwidth=2
"au BufRead,BufNewFile *.h setlocal tabstop=2
"au BufRead,BufNewFile *.h setlocal shiftwidth=2


" sets gdscript files to use tab spaces ;-;
au BufRead,BufNewFile *.gd setlocal noexpandtab

highlight ColorColumn ctermbg=236

" sets a specific highlight color as dark yellow
syntax on
set hlsearch
hi Search ctermbg=3

" sets the folding colors to not kill my eyes per fold
hi Folded ctermbg=236
hi Folded ctermfg=252

" vertical split highlight: dark grey fill, green char
"hi VertSplit ctermfg=235 ctermbg=2


" Sets all .fena files to use the config syntax highlighting
au BufRead,BufNewFile *.fena setfiletype conf
" Sets all .test files to use the config syntax highlighting (cmput 415)
au BufRead,BufNewFile *.test setfiletype conf
" Sets all .tzs (toonzscript) files to use javascript (ecmastandard)
" highlighting (note it's syntax because the linter doesn't like the
" predefined classes / functions toonzscript has)
au BufRead,BufNewFile *.tzs set syntax=javascript

" specifically a folding method for the 'notes.txt' file
autocmd BufRead,BufNewFile /mnt/shared/other/notes/notes.txt set foldmethod=marker foldmarker=//<,//>
autocmd BufRead,BufNewFile /mnt/c/Users/Austin\-zs/Documents/Austin/powder\ game\ code/Programming/Other/notes/notes.txt set foldmethod=marker foldmarker=//<,//>


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

highlight! link SignColumn LineNr
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1


" Markdown preview
" Note that this does NOT work using linux subsystem for windows
" although it works in ubuntu 18.04
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Trying to do shit with latex
" the following requires a `pip3 install neovim-remote`
" according to https://github.com/lervag/vimtex/wiki/introduction#neovim
Plug 'lervag/vimtex'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'mupdf'

" plantuml stuff
Plug 'https://github.com/weirongxu/plantuml-previewer.vim.git'
Plug 'https://github.com/aklt/plantuml-syntax.git'
Plug 'https://github.com/tyru/open-browser.vim.git'

" jupyter?
"Plug 'jupyter-vim/jupyter-vim'
Plug 'https://github.com/goerz/jupytext.vim.git'

" antlr 3, 4 syntax highlighting
Plug 'https://github.com/dylon/vim-antlr.git'
au BufRead,BufNewFile *.g set filetype=antlr3
au BufRead,BufNewFile *.g4 set filetype=antlr4

" ccls
Plug 'https://github.com/m-pilia/vim-ccls.git'

"" Airline with ALE
"let airline#extensions#ale#error_symbol = 'ERROR:'
"let airline#extensions#ale#warning_symbol = 'WARN:'
"
"" Async lint engine (ALE)
"Plug 'https://github.com/w0rp/ale.git'
"
"" Sets pylint3 as the pylint executable
"let g:ale_python_pylint_executable = 'pylint'
"
"" sets the only python linter as pylint3
"let b:ale_linters = {'python': ['pylint'], 'cpp': ['ccls']}
""let b:ale_linters = {'python': ['pylint']}
"
""let g:ale_completion_enabled = 1
"
"" auto complete
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"let g:deoplete#enable_at_startup = 1
"
"" enables it only on certain files
"" https://github.com/Shougo/deoplete.nvim/issues/464
"autocmd FileType * call deoplete#custom#buffer_option('auto_complete', v:false)
"autocmd FileType cpp call deoplete#custom#buffer_option('auto_complete', v:true)


Plug 'neoclide/coc.nvim', {'branch': 'release'}
autocmd FileType *      let b:coc_suggest_disable = 1
autocmd FileType cpp    let b:coc_suggest_disable = 0

" coc error colors
hi CocErrorSign     ctermfg=Red guifg=#ff0000 cterm=bold
hi CocWarningSign   ctermfg=Yellow guifg=#c4a000 cterm=bold
hi CocInfoSign      ctermfg=Brown guifg=#ff922b cterm=bold
hi CocHintSign      ctermfg=Blue guifg=#15aabf cterm=bold

" autocomplete menu background
" used for both file tab completion and coc.nvim
hi Pmenu ctermbg=236 ctermfg=231

" Airline with coc.nvim
let airline#extensions#coc#error_symbol = 'ERROR:'
let airline#extensions#coc#warning_symbol = 'WARN:'


" all of the following is copied/pasted from the script provided by coc.nvim
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
"set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
"set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" c++ syntax highlighting
Plug 'jackguo380/vim-lsp-cxx-highlight'


" ctrl-p
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll|o)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }


"Plug 'mg979/vim-visual-multi', {'branch': 'master'}

"let g:VM_maps = {}
"let g:VM_maps['Find Under'] = '<C-g>'   " replace C-n



" Initialize plugin system
call plug#end()



" ALE binding to jump to the next or previous error
" note that both mappings work
" nmap <silent> <leader>aj :ALENext<cr>
" nmap <silent> <leader>ak :ALEPrevious<cr>
nmap <silent> <leader>aj <Plug>(ale_next_wrap)
nmap <silent> <leader>ak <Plug>(ale_previous_wrap)
" ALE changing error to undercurl
highlight ALEError ctermbg=none cterm=undercurl
highlight ALEWarning ctermbg=none cterm=undercurl

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


