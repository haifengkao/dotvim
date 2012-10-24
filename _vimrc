set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
  Bundle 'gmarik/vundle'
  Bundle 'Shougo/neocomplcache'
 Bundle 'Shougo/neosnippet'
  Bundle 'BreakPts'
  Bundle 'genutils'
  Bundle 'Rip-Rip/clang_complete'
  Bundle 'osyo-manga/neocomplcache-clang_complete'
 "Bundle 'SirVer/ultisnips'
 Bundle 'qqshfox/objc_matchbracket'

   " vim-scripts repos
  Bundle 'FuzzyFinder'
  Bundle 'L9'
 Bundle 'EnhCommentify.vim'
 Bundle 'DoxygenToolkit.vim'
 Bundle 'a.vim'
 Bundle 'delimitMate.vim'
 Bundle 'repeat.vim'
 Bundle 'surround.vim'
 
" Bundle 'tpope/vim-fugitive'
 " My Bundles here:
 "
 " original repos on github
" Bundle 'tpope/vim-fugitive'
 " vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'
 " non github repos
" Bundle 'git://git.wincent.com/command-t.git'
 " ...

 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..


" ================ Ultisnips ==============
"   let g:UltiSnipsExpandTrigger="<tab>"
"   let g:UltiSnipsJumpForwardTrigger="<tab>"
"   let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" ================ Clang Complete ================
" Enable auto clang complete
let g:clang_complete_auto = 1


" Show clang errors in the quickfix window
let g:clang_hl_errors = 1

" Automatically complete after ., ::, ->
let g:clang_complete_copen = 0

" Enable snippets
let g:clang_snippets = 1
let g:clang_snippets_engine='clang_complete'
" let g:clang_snippets_engine='ultisnips'
let g:clang_conceal_snippets=0

let g:clang_periodic_quickfix = 0

"ignore clang error
let g:clang_user_options='|| exit 0'

let g:clang_use_library = 1
let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

" ------------------------------neocomplcache---------------------------------------

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

" Use neocomplcache & clang_complete !!! REQUIRED (Lono: doesn't seem to
" change anything)
let g:neocomplcache_force_overwrite_completefunc=1

" Select the first available completion in the popup
let g:clang_auto_select = 1

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1

" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1

let g:neocomplcache_auto_completion_start_length = 3
let g:neocomplcache_manual_completion_start_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" snippets expand key
 imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>" 
imap  <silent><expr><tab>  neocomplcache#sources#snippets_complete#expandable() ? "\<plug>(neocomplcache_snippets_expand)" : (pumvisible() ? "\<c-e>" : "\<tab>")
 smap  <tab>  <right><plug>(neocomplcache_snippets_jump)
inoremap <expr><c-e>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType objc  set omnifunc=ClangComplete

if has('win32') || has('win64') 
else
    let g:neocomplcache_temporary_dir = "$HOME/.vim/tmp/neocomplcache"
endif


 
