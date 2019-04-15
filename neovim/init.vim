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
set cmdheight=1
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

nmap ,v "+p
vmap ,c "+yy
nmap ,c "+yy

nmap <C-L><C-L> :set invrelativenumber<CR>


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

Plug 'sbdchd/neoformat'

" ctrlsf
Plug 'dyng/ctrlsf.vim'
let g:ctrlsf_ackprg = 'ag'
let g:ctrlsf_ignore_dir = ['tags', '.git', 'GTAGS', 'GPATH', 'GRTAGS']
let g:ctrlsf_default_root = 'project+fw'
let g:ctrlsf_case_sensitive = 'yes'

" language server
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
if !has('nvim')
  packadd nvim-yarp
  packadd vim-hug-neovim-rpc
endif
let g:LanguageClient_serverCommands = {
    \ 'cpp': ['clangd'],
    \ 'c': ['clangd']
    \ }
let g:LanguageClient_useVirtualText = 0
"let g:LanguageClient_hoverPreview = "Never"
"function SetLSPShortcuts()
nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>ln :call LanguageClient#textDocument_rename()<CR>
nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
nnoremap <leader>lr :call LanguageClient#textDocument_references()<CR>
nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
"endfunction()
"augroup LSP
  "autocmd!
  "autocmd FileType cpp,c call SetLSPShortcuts()
"augroup END

" .clang-format
" https://clang.llvm.org/docs/ClangFormatStyleOptions.html

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
set completeopt-=preview
"autocmd CompleteDone * silent! pclose!

Plug 'Shougo/echodoc.vim'
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

set cscopetag
set cscopeprg='gtags-cscope'
"cs add GTAGS

Plug 'kana/vim-fakeclip'

"Plug 'davidhalter/jedi-vim'
"py << EOF
"sys.path.insert(0, '/home/peizhaoyou/ml_system/pico/tools/ptest')
"sys.path.insert(0, '/home/peizhaoyou/ml_system/pico/test-common/functiontest/testlib')
"EOF
"
call plug#end()
