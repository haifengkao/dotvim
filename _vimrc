" ============= Vundle ===========
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

" ============= Common Settings ===========
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

color ayende
set nu 	"enable line number
"set autoindent 	"indent
"OPTIONAL: This enables automatic indentation as you type.
filetype indent on
set nowrap "no line wrapping
"alt key does not active menu
set winaltkeys=no
set fdm=syntax "set folding rule to language syntax
set foldnestmax=3 "set fold level to 3 at max
"open all folds
set foldlevelstart=99
"set isfname+=32 "Vim to support filenames with spaces in when using gf, may break things
"
"To avoid getting the "Press ENTER" message whenever I open a file
set cmdheight=2
set tabstop=4  "tab stop for 4 spaces 
set shiftwidth=4
set expandtab "transform all tabs into spaces
"go to command mode
imap jj <Esc>

" turn off annoying bell
set vb

" smartindent automatically inserts one extra level of indentation in some cases.
set smartindent
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

set scrolloff=5                 " keep at least 5 lines around the cursor
set autoread                    " Reload the file when it has been modified
set wildmenu                    " Enable menu for file as below
set wildmode=longest,full       " Make :tabe matches longest common filename
set shortmess=atI               " Avoid The 'Press ENTER or type command to continue' 

"inserts the longest common text of all matches; and the menu will come up even if there's only one match
set completeopt=longest,menuone
"set completeopt=longest,menuone,preview

"Here is how to emulate Emacs¡¦ transpose-words in Vim
nmap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<cr><c-o><c-l>:nohl<cr>

"If you like Y to work from the cursor to the end of line (which is more logical, but not Vi-compatible)
noremap Y y$

"disable mouse middle click(annoying when scrolling)
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>

"tabbed editing, not working
"map <C-t> <Esc>:tabnew<CR> 

"save all files
inoremap <silent> <C-s> <ESC>:wa<CR> 
nnoremap <silent> <C-s> :wa<CR>

"find the occurence in all files
"nnoremap <Leader>f :noautocmd vimgrep/\<<C-r><C-w>\>/j **/*.[ch] **/*.[ch]pp **/*.java **/*.pl **/*.rb **/*.py **/*.cs<CR>:cw<CR>
nnoremap <Leader>F :noautocmd vimgrep/\c/j **/*.[ch] **/*.[ch]pp **/*.tex **/*.java **/*.pl **/*.rb **/*.py **/*.cs **/*.m <left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>

"Keystroke Savor for Substituting all occurrences of the word under the cursor
"without question
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gI<Left><Left><Left>
vmap <Leader>s y:execute "%s/".escape(@",'[]/')."//gI"<Left><Left><Left><Left>
"with question
nnoremap <Leader>S :%s/\<<C-r><C-w>\>//gcI<Left><Left><Left><Left>
vmap <leader>S y:execute "%s/".escape(@",'[]/')."//gcI"<left><left><left><left><Left>

"Then you can use Ctrl-NumPad+ to increment numbers as others do with <C-A> 
noremap <C-kPlus> <C-A>
noremap <C-kMinus> <C-X>
"failed try
"noremap <C-Char-61> <C-X>
"noremap <C-=> <C-A>
"noremap <C--> <C-X>

"for easy page down and page up, failed
"noremap <Space> <C-F> conflicted with FuzzyFinder
"noremap <BS> <C-B>

" ============= Doxygen ===========
"with @retval end
nnoremap <Leader>d :let g:DoxygenToolkit_returnTag="@retval "<CR>:Dox<CR>
"with @return end
nnoremap <Leader>D :let g:DoxygenToolkit_returnTag="@return "<CR>:Dox<CR>

" ============= Python ====================
"disable cscope for python
au FileType python set nocst

"save all files for python, and rebuild tag file with ctags (TODO: switch to GNU Global when it supports python)
au FileType python inoremap <silent> <C-s> <ESC> :wa<CR>:cs kill 0<CR>:!start cmd /c  cs.py<CR>:!start cmd /c ctags -R --python-kinds=-i .<CR>:Sleep 1000<CR>:cs add cscope.out<CR>
au FileType python nnoremap <silent> <C-s> :wa<CR>:cs kill 0<CR>:!start cmd /c cs.py<CR>:!start cmd /c ctags -R --python-kinds=-i .<CR>:Sleep 1000<CR>:cs add cscope.out<CR>

" ============= FuzzyFinder ===============
"can I set default to open tabs??
"break the original forward functionality
"nmap ff :FuzzyFinderFile<CR> 
"nmap fw ::FuzzyFinderTag<CR>
nmap <Leader>g :FufFile<CR> 
nmap <Leader>f :FufTag<CR>
" MruFile is disabled by default
nmap <Leader>r :FufMruFile<CR>
inoremap <C-M-F10> <ESC> :FufTag<CR>
nmap <C-M-F10> :FufTag<CR>
inoremap <C-M-F11> <ESC> :FufFile<CR>
nmap <C-M-F11> :FufFile<CR>
"open the file in the current buffer
let g:fuf_keyOpen = '<C-l>'
"open the file in a new tab
let g:fuf_keyOpenTabpage = '<CR>'

" ============= ctags ===============
"for ctag.vim
"c-tag remap, jump to previous tag
"noremap <C-[> <C-t> "breaks clang_complete
"C-\ - Open the definition in a new tab, never use it
"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"A-] - Open the definition in a vertical split, never use it
"map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" ============= Omni-Completion ===========
"now the complete will match case-insensitive words
"set ignorecase 

"exclude boost directory for include complete since it takes TOO LONG
set include=^\\s*#\\s*include\ \\(<boost/\\)\\@!

"remember to build ctags file as below for omni-cpp-complete
"map <C-F12> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>

"completion hotkeys
"default complete
"imap <M-F10> <c-x><c-p>
"make default complete to be longest common text of auto-complete
imap <M-F10> <ESC>:call MyDefaultComplete()<CR>
"file complete
imap <M-F9> <c-x><c-f>
"line complete
imap <C-M-F9> <c-x><c-l>

function MyDefaultComplete()
"    call feedkeys("a\<c-x>\<c-o>")
    call feedkeys("a\<c-x>\<c-p>")
endfunction

" ================ Ultisnips ==============
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

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

" ================ Neocomplcache ================

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

" Use neocomplcache & clang_complete !!! REQUIRED (solve conflicts with clang)
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

" =============== System Setting ============
if has('win32') || has('win64') 
    source $VIMRUNTIME/mswin.vim
    behave mswin
    " Don't let swap and backup files fill my working directory.
    set backupdir=c:\\temp,.        " Backup files
    set directory=c:\\temp,.        " Swap files

    "persistent undo for VIM 7.3 or above
    set undodir=c:\\temp,.
    "generate by D:\ctags>ctags -R --c++-kinds=+p-d-e --file-scope=no --fields=+iaS -f cv_tags --extra=+q d:\OpenCV2.0\src
    "No macro, enum value and restricted to exported symbols
    set tags+=D:\ctags\cv_tags
    "generate by D:\ctags>ctags -R --c++-kinds=+p-d-e-m --file-scope=no --fields=+iaS -f cv_header_tags --extra=+q d:\OpenCV2.0\include\opencv
    "set tags+=D:\ctags\cv_header_tags
    "set path+=D:/OpenCV2.0/src
    set path+=D:/OpenCV/include/opencv
    set path+=D:/boost/boost_1_42

    "Maximize window when start
    "au Filetype cpp,c,cs,txt,viki,tex,m,rc,vim simalt ~x
    au GUIEnter * simalt ~x

    "set guifont=Consolas:h11:cSHIFTJIS
    "set guifont=*
    set guifont=Consolas:h11

    "save all files and rebuild tag file
    "need Sleep function to wait cs.py to rebuild cscope.out
    au FileType cpp,c,java inoremap <silent> <C-s> <ESC> :wa<CR>:cs kill 0<CR>:!start cmd /c  cs.py<CR>:Sleep 1000<CR>:cs add cscope.out<CR>
    au FileType cpp,c,java nnoremap <silent> <C-s> :wa<CR>:cs kill 0<CR>:!start cmd /c cs.py<CR>:Sleep 1000<CR>:cs add cscope.out<CR>

    "set tags+=D:\ctags57\boost-tags
else
    let os=substitute(system('uname'), '\n', '', '')
    if os == 'Darwin' || os == 'Mac'
        set backupdir=/tmp,.        " Backup files
        set directory=/tmp,.        " Swap files
        set undodir=/tmp,.
        set guifont=Consolas:h16
    "elseif os == 'Linux'
    endif
endif


"a sleep function which allows vim to wait for the other processes to finish
com! -complete=command -nargs=+ Sleep call s:Sleep(<q-args>)
fun! s:Sleep(millisec)
    let ct = localtime()
    let dt = 0
    while dt < (a:millisec/1000)
        let dt = localtime() - ct
    endwhile
endfun
