set nocompatible
set nu
set incsearch
set hlsearch
set wildmenu
set laststatus=2
set nofoldenable
set bs=2
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set encoding=utf-8
set cmdheight=2
set cursorline

filetype indent on
filetype plugin indent on
syntax on
syntax enable
colorscheme molokai
" set cursorcolumn
highlight CursorLine   cterm=bold

set backup
set backupext=.bak
"set patchmode=.orig
set directory=~/.vim-tmp
set backupdir=~/.vim-tmp

let mapleader="\<Space>"
inoremap <C-k> <ESC>
inoremap <M-h> <Left>
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-l> <Right>
inoremap <M-d> <DELETE>
inoremap ˙ <Left>
inoremap ∆ <Down>
inoremap ˚ <Up>
inoremap ¬ <Right>
inoremap ∂ <DELETE>

nmap <C-L><C-L> :set invrelativenumber<CR>

nmap ,v "+p
vmap ,c "+yy
nmap ,c "+yy
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

nnoremap <leader>t. :tabedit %<cr>
nnoremap <leader>tc :tabclose<cr>

let g:python_host_prog = "~/tools/bin/python2"
let g:python3_host_prog = "~/tools/bin/python3"

call plug#begin()

" The NERD tree allows you to explore your filesystem and to open files and
" directories.
Plug 'scrooloose/nerdtree'
map <F5> :NERDTreeToggle<CR>
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" a class outline viewer for Vim
Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>


" Supertab is a vim plugin which allows you to use <Tab> for all your insert
" completion needs
"Plug 'ervandew/supertab'

" minibufexpl
Plug 'fholgado/minibufexpl.vim'
let g:miniBufExplorerAutoStart = 0

" airline
Plug 'vim-airline/vim-airline'

" Vim motion on speed!
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
map <Leader><leader>. <Plug>(easymotion-repeat)

" Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'kien/ctrlp.vim'

" Doxygen
Plug 'zoyopei/DoxygenToolkit.vim'

" Surround.vim is all about surroundings: parentheses, brackets, quotes, XML
" tags, and more. The plugin provides mappings to easily delete, change and
" add such surroundings in pairs.
Plug 'tpope/vim-surround'

" NERD Commenter
Plug 'scrooloose/nerdcommenter'

" additional vim c++ syntax highlighting
Plug 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1

"Plug 'sbdchd/neoformat'

" ctrlsf
Plug 'dyng/ctrlsf.vim'
let g:ctrlsf_ackprg = 'ag'
let g:ctrlsf_ignore_dir = ['tags', '.git', 'GTAGS', 'GPATH', 'GRTAGS']
let g:ctrlsf_default_root = 'project+fw'
let g:ctrlsf_case_sensitive = 'yes'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap for coc-format 
nmap <leader>fa <Plug>(coc-format)
" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" language server
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
"if !has('nvim')
"  packadd nvim-yarp
"  packadd vim-hug-neovim-rpc
"endif
"let g:LanguageClient_serverCommands = {
"    \ 'cpp': ['clangd', '--pch-storage=memory'],
"    \ 'c': ['clangd', '--pch-storage=memory'],
"    \ 'python': ['pyls','--log-file','/tmp/pyls.log', '-vvv'],
"    \ 'go': ['gopls']
"    \ }
"let g:LanguageClient_settingsPath='./settings.json'
"let g:LanguageClient_useVirtualText = 0
""let g:LanguageClient_changeThrottle = 1
""let g:LanguageClient_hoverPreview = "Never"
""function SetLSPShortcuts()
"nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
"nnoremap <leader>li :call LanguageClient#textDocument_implementation()<CR>
"nnoremap <leader>ln :call LanguageClient#textDocument_rename()<CR>
"nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
"vnoremap <leader>lf :call LanguageClient#textDocument_rangeFormatting()<CR>
"nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
"nnoremap <leader>lr :call LanguageClient#textDocument_references()<CR>
"nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
"nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
"nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
"nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
"nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
"endfunction()
"augroup LSP
  "autocmd!
  "autocmd FileType cpp,c call SetLSPShortcuts()
"augroup END

" .clang-format
" https://clang.llvm.org/docs/ClangFormatStyleOptions.html

"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1
"set completeopt-=preview
"autocmd CompleteDone * silent! pclose!

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'Shougo/deoplete.nvim'
"Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

Plug 'Shougo/echodoc.vim'
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'

"Plug 'fatih/vim-go'

" (Optional) Multi-entry selection UI.
"Plug 'junegunn/fzf'

set cscopetag
set cscopeprg='gtags-cscope'
"cs add GTAGS

"Plug 'kana/vim-fakeclip'

"Plug 'davidhalter/jedi-vim'
"

Plug 'chr4/nginx.vim'

call plug#end()
