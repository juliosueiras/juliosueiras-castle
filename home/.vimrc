" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
set nocompatible
syntax on

filetype plugin indent on " Automatically detect file types.

so ~/.vimrc.omnisharp

sourc ~/.vimrc.bundles

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
set comments=sl:/*,mb:*,elx:*/ " auto format comment blocks

" Remove trailing whitespaces and ^M chars {
" To disable the stripping of whitespace, add the following to your
" .vimrc.before.local file:
" let g:spf13_keep_trailing_whitespace = 1
autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2
" preceding line best in a plugin but here for now.
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
" Workaround vim-commentary for Haskell
autocmd FileType haskell setlocal commentstring=--\ %s
" Workaround broken colour highlighting in Haskell
autocmd FileType haskell,rust setlocal nospell
" }

let g:dbext_default_profile_oracle = 'type=ORA:user=SA302:passwd=summer2015@aces:filetype=sql'
let g:dbext_default_profile_mysql = 'type=MYSQL:user=juliosueiras:passwd=19940620:dbname=school:filetype=mysql:extra=-t'
augroup SQL
  " completion support etc
  autocmd BufRead,BufNewFile .mysql,.sql,.php,*.haml call vim_addon_sql#Connect('mysql', {'database':'school', 'user':'juliosueiras', 'password' : '19940620'})

  " user interface providing to query mappings (see code):
  autocmd BufRead,BufNewFile .sql call vim_addon_sql#UI()
augroup end


let g:ftplugin_sql_omni_key = '<C-D>'

set relativenumber
nnoremap <F10> :b <C-Z>

set t_Co=256
let g:molokai_original = 1
let g:rehash256 = 1
color molokai

inoremap jj <ESC>
set noshowmode
""""""""""
" Options
""""""""""
" Use :help 'option (including the ' character) to learn more about each one.
"
" Buffer (File) Options:
set hidden                     " Edit multiple unsaved files at the same time
set confirm                    " Prompt to save unsaved changes when exiting
" Keep various histories between edits
set viminfo='1000,f1,<500,:100,/100,h


set noswapfile
set nobackup
set nowb
set conceallevel=2 concealcursor=i

" Search Options:
"
set hlsearch                   " Highlight searches. See below for more.
set ignorecase                 " Do case insensitive matching...
set smartcase                  " ...except when using capital letters
set incsearch                  " Incremental search

" Insert (Edit) Options:
set backspace=indent,eol,start " Better handling of backspace key
set nopaste                    " Start in normal (non-paste) mode
set pastetoggle=<F12>          " Use <F11> to toggle paste modes

" Status / Command Line Options:
set wildmenu                   " Better commandline completion
set wildmode=longest:full,full " Expand match on first Tab complete
set showcmd                    " Show (partial) command in status line.
set gcr=a:blinkon500-blinkwait500-blinkoff500
set laststatus=2               " Always show a status line
set cmdheight=2                " Prevent "Press Enter" messages
" Show detailed information in status line
set statusline=%f%m%r%h%w\ [%n:%{&ff}/%Y]%=[0x\%04.4B][%03v][%p%%\ line\ %l\ of\ %L]

" Interface Options:
set number                     " Display line numbers at left of screen
set visualbell                 " Flash the screen instead of beeping on errors
set t_vb=                      " And then disable even the flashing
set mouse=a                    " Enable mouse usage (all modes) in terminals
" Quickly time out on keycodes, but never time out on mappings
set timeout timeoutlen=600 ttimeoutlen=1

set colorcolumn=+1

" Indentation Options:
set tabstop=8                  " NEVER change this!
" Change the '2' value below to your preferred indentation level
set shiftwidth=2               " Number of spaces for
set softtabstop=2              " ...each indent level
"Set windows pos and resize
set lines=42
set columns=118

" No surround sound
set noerrorbells
set novisualbell
set t_vb=

" Set Fold config
" set foldmethod=syntax
set foldenable

" misc settings
set fileformat=unix     " file mode is unix
set fileformats=unix,dos,mac

" set Undo file
set viminfo+=!

" Setting Spell Checker
set spelllang=en_us                      " spelling options

" Fix Fucking Vim Prefix for GTK
set backspace=indent,eol,start

" setting the tabs like that
" set list listchars=tab:→\ ,trail:\ 
" set list listchars=tab:▸\ 
"set list listchars=tab:-\ ,trail:\ 
set list listchars=tab:-\ ,extends:>,precedes:<

"""""""
" Maps
"""""""
" Reformat current paragraph
nnoremap Q gqip

" Move cursor between visual lines on screen
nnoremap <Up> gk
nnoremap <Down> gj

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Toggle search highlighting
nnoremap <C-Bslash>       :set hls!<bar>:set hls?<CR>
inoremap <C-Bslash>       <Esc>:set hls!<bar>:set hls?<CR>a

""""""""""""""""
" Auto commands
""""""""""""""""
"
if has("autocmd")
    augroup filetype
        " Remove ALL autocommands for the current group.
        autocmd!

        " Jump to last-known-position when editing files
        " Note: The | character is used in Vim as a command separator (like ; in C)
        autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    augroup END
endif



" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<M-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:syntastic_html_checkers = [ 'tidy', 'jshint' ]
let g:syntastic_asm_checkers = ['gcc', 'nasm']
let g:syntastic_javascript_checkers = ['jslint', 'jshint', 'jsl', 'eslint', 'jscs', 'flow', 'standard']
let g:syntastic_cshtml_checkers = []
let g:syntastic_c_checkers = ['gcc', 'clang_check', 'make', 'clang_tidy', 'splint', 'sparse']
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

nnoremap <F8> :TagbarToggle<kEnter>
let g:airline#extensions#tabline#enabled=1
au BufNewFile,BufRead *.gradle setf groovy
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:tagbar_type_css = {
            \ 'ctagstype' : 'Css',
            \ 'kinds'     : [
            \ 'c:classes',
            \ 's:selectors',
            \ 'i:identities'
            \ ]
            \ }


let g:zv_zeal_directory = "$HOME/Documents/GitHubRepo/zeal/bin/zeal"
let g:android_sdk_path = "/opt/android-sdk"

" if has('statusline')
"     set laststatus=2
"     set statusline=%<%f\ " Filename
"     set statusline+=%w%h%m%r " Options
"     set statusline+=%{fugitive#statusline()} " Git Hotness
"     set statusline+=%{virtualenv#statusline()}
"     set statusline+=\ [%{&ff}/%Y] " Filetype
"     set statusline+=\ [%{getcwd()}] " Current dir
"     set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav
" endif


let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#max_list = 15
let g:neocomplete#force_overwrite_completefunc = 1


" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings {
" These two lines conflict with the default digraph mapping of <C-K>
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" if exists('g:spf13_noninvasive_completion')
" 	inoremap <CR> <CR>
" 	" <ESC> takes you out of insert mode
" 	inoremap <expr> <Esc>   pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"
" 	" <CR> accepts first, then sends the <CR>
" 	inoremap <expr> <CR>    pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
" 	" <Down> and <Up> cycle like <Tab> and <S-Tab>
" 	inoremap <expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"
" 	inoremap <expr> <Up>    pumvisible() ? "\<C-p>" : "\<Up>"
" 	" Jump up and down the list
" 	inoremap <expr> <C-d>   pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
" 	inoremap <expr> <C-u>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
" else
" <C-k> Complete Snippet
" <C-k> Jump to next snippet point
imap <silent><expr><C-k> neosnippet#expandable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
            \ "\<C-e>" : "\<Plug>(neosnippet_expand_or_jump)")
smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()


" <CR>: close popup
" <s-CR>: close popup and save indent.
inoremap <expr><s-CR> pumvisible() ? neocomplete#smart_close_popup()"\<CR>" : "\<CR>"

function! CleverCr()
    if pumvisible()
        if neosnippet#expandable()
            let exp = "\<Plug>(neosnippet_expand)"
            return exp . neocomplete#smart_close_popup()
        else
            return neocomplete#smart_close_popup()
        endif
    else
        return "\<CR>"
    endif
endfunction

" <CR> close popup and save indent or expand snippet
imap <expr> <CR> CleverCr()
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#smart_close_popup()
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" " Courtesy of Matteo Cavalleri

function! CleverTab()
    if pumvisible()
        return "\<C-n>"
    endif
    let substr = strpart(getline('.'), 0, col('.') - 1)
    let substr = matchstr(substr, '[^ \t]*$')
    if strlen(substr) == 0
        " nothing to match on empty string
        return "\<Tab>"
    else
        " existing text matching
        if neosnippet#expandable_or_jumpable()
            return "\<Plug>(neosnippet_expand_or_jump)"
        else
            return neocomplete#start_manual_complete()
        endif
    endif
endfunction

imap <expr> <Tab> CleverTab()
" }

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
" let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
" let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
" }
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags"
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

if has("autocmd") && exists("+omnifunc")
     autocmd Filetype *
   \ if &omnifunc == "" |
   \   setlocal omnifunc=syntaxcomplete#Complete |
   \ endif
endif

let g:codeoverview_autoupdate=1

scriptencoding utf-8
set fileencoding=utf-8 encoding=utf-8
set autowrite " Automatically write a file when leaving a modified buffer
set shortmess+=filmnrxoOtT " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore " Allow for cursor beyond last character
set history=1000 " Store a ton of history (default is 20)
set hidden " Allow buffer switching without saving
set iskeyword-=. " '.' is an end of word designator
set iskeyword-=# " '#' is an end of word designator
set iskeyword-=- " '-' is an end of word designator
set iskeyword-=_ " '-' is an end of word designator

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])


" Vim UI {
set tabpagemax=15 " Only show 15 tabs
highlight clear SignColumn " SignColumn should match background
" color in relative mode
if has('cmdline_info')
    set ruler " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd " Show partial commands in status line and
    " Selected characters/lines in visual mode
endif

set backspace=indent,eol,start " Backspace for dummies
set linespace=0 " No extra spaces between rows
set number " Line numbers on
set showmatch " Show matching brackets/parenthesis
set incsearch " Find as you type search
set hlsearch " Highlight search terms
set winminheight=0 " Windows can be 0 line high
set ignorecase " Case insensitive search
set smartcase " Case sensitive when uc present
set wildmenu " Show list instead of just completing
set wildmode=list:longest,full " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,] " Backspace and cursor keys wrap too
set scrolljump=5 " Lines to scroll when cursor leaves screen
set scrolloff=3 " Minimum lines to keep above and below cursor
set foldenable " Auto fold code
set foldmethod=syntax
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" Formatting {
set nowrap " Do not wrap long lines
set autoindent " Indent at the same level of the previous line
set shiftwidth=4 " Use indents of 4 spaces
set expandtab " Tabs are spaces, not tabs
set tabstop=4 " An indentation every four columns
set softtabstop=4 " Let backspace delete indent
set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)
set splitright " Puts new vsplit windows to the right of the current
set splitbelow " Puts new split windows to the bottom of the current
set matchpairs+=<:> " Match, to be used with %
set pastetoggle=<F12> " pastetoggle (sane indentation on pastes)
set comments=sl:/*,mb:*,elx:*/ " auto format comment blocks
" Remove trailing whitespaces and ^M chars
" To disable the stripping of whitespace, add the following to your
" .vimrc.before.local file:
" let g:spf13_keep_trailing_whitespace = 1
autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2
" preceding line best in a plugin but here for now.
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
" Workaround vim-commentary for Haskell
autocmd FileType haskell setlocal commentstring=--\ %s
" Workaround broken colour highlighting in Haskell
autocmd FileType haskell,rust setlocal nospell
" }"

" Let the statusbar as it is for inactive windows
let g:airline_inactive_collapse=0
let g:airline_left_sep = ""
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
"}
python import sys; sys.path.append("/usr/lib/python3.4/site-packages/twisted/")
let g:task_rc_override     = 'rc.defaultwidth=999'
au InsertLeave *.css :BLReloadCSS
let g:auto_save = 0
au BufRead,BufNewFile *.thor set filetype=ruby
let g:LatexBox_viewer = 'mupdf'
let g:LatexBox_latexmk_options = '--shell-escape -pv'

let g:webdevicons_enable_nerdtree=0
set cursorline
set cursorcolumn
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
set wildignore=*.o,*.obj,*~                                                     "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
"
" Toggle buffer list
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>T :TagbarToggle<CR>
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev Bd bd
cnoreabbrev bD bd
cnoreabbrev wrap set wrap
cnoreabbrev nowrap set nowrap
cnoreabbrev bda BufOnly
cnoreabbrev t tabe
cnoreabbrev T tabe


nnoremap Y y$"
" Move selected lines up and down Yank to the end of the line
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <F10> :b <C-Z>
let g:ctrlp_switch_buffer = 't'
let vimrplugin_show_args = 1
let vimrplugin_latexmk = 0
let vimrplugin_latexcmd = "latex"
let vimrplugin_latexcmd = 'latexmk -shell-escape -silent -f -pdf -pdflatex="xelatex %O -synctex=1 %S"'
function SetXeTex()
    let g:Tex_CompileRule_pdf = 'xelatex -aux-directory=F:/Vim/my_latex_doc/temp --synctex=-1 -src-specials -interaction=nonstopmode $*'
endfunction

map <Leader>lx :<C-U>call SetXeTex()<CR>

" let g:EclimCompletionMethod = 'omnifunc'
"
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.java =
            \ '\%(\h\w*\|)\)\.\w*'



let g:NumberToggleTrigger="<F2>"
let g:virtualenv_auto_activate=1

nnoremap <F9> :VimFilerExplorer -status -auto-cd<CR>

let g:pastebin_api_dev_key='b18b11f8af33b7a95804b94c27cce50f'
let g:zv_zeal_directory = "/usr/bin/zeal"
let g:zv_docsets_dir = '~/.local/share/Zeal/Zeal/docsets'

" fix zeal Java issue
"

let g:zv_added_files_type = {
            \ 'java': 'java se8',
            \ }

let g:airline_theme='dark'
let g:airline_powerline_fonts=1

let g:org_agenda_files=['~/org/index.org']
let g:pad#dir="/home/juliosueiras/notes"
set viewoptions=cursor,folds,slash,unix

let g:github_access_token = "24109f0ab902a39f381e130c7c341ca3afcaecff"
let g:gissues_async_omni = 0
let g:gissues_lazy_load = 1

autocmd QuickFixCmdPost *grep* cwindow

let g:tex_fold_enabled=1
let g:viewdoc_open="below new"

call vimfiler#set_execute_file('txt', 'vim')
call vimfiler#set_execute_file('c', ['gvim', 'vim'])

let g:vimfiler_as_default_explorer = 1

" Enable file operation commands.
" Edit file by tabedit.
" call vimfiler#custom#profile('default', 'context', {
"       \ 'safe' : 0,
"       \ 'edit_action' : 'tabopen',
"       \ })

" Like Textmate icons.
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
" let g:vimfiler_file_icon = ' '
let g:vimfiler_marked_file_icon = '✓'
" let g:vimfiler_readonly_file_icon = ' '
let g:my_vimfiler_explorer_name = 'explorer'
let g:my_vimfiler_winwidth = 30
let g:vimfiler_safe_mode_by_default = 0
" let g:vimfiler_directory_display_top = 1


" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


let g:ctrlp_funky_syntax_highlight = 1

nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

set cpo-=<
set wcm=<C-Z>
nnoremap <F4> :emenu <C-Z>
if &term == "screen-256color"
    let &t_SI = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[0 q"
endif

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'c'    : ['#(whoami)'],
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['#(date +"%I:%M %p")', '%a', '%Y'],
      \'z'    : ['#H']}

let g:tmuxline_theme = 'airline'

au BufRead /tmp/mutt-* set tw=72
au FileType Python set foldmethod=indent foldlevel=99

let g:tex_fold_override_foldtext = 1
let g:tex_fold_allow_marker = 1
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=Red

let g:SrcExpl_pluginList = [
            \ "__TagBar__",
            \ "_VimFiler_"
            \ ]

let g:rooter_patterns = ['.projectroot', 'Rakefile', '.git/']

let g:rooter_change_directory_for_non_project_files = 1

nnoremap <leader>t :tabnew<CR>
let g:sw_exe = "/opt/SQLWorkbench/sqlwbconsole.sh"
let b:db_conn = {'host':'127.0.0.1','database':'School', 'user':'juliosueiras', 'password' : '19940620'}


"" CtrlSpace Settings {
hi CtrlSpaceSelected term=reverse ctermfg=187  ctermbg=23  cterm=bold
hi CtrlSpaceNormal   term=NONE    ctermfg=244  ctermbg=232 cterm=NONE
hi CtrlSpaceSearch   ctermfg=220  ctermbg=NONE cterm=bold
hi CtrlSpaceStatus   ctermfg=230  ctermbg=234  cterm=NONE
let g:ctrlspace_use_tabline = 1
" }

"" Vison Settings {
autocmd BufRead,BufNewFile package.json Vison
autocmd BufRead,BufNewFile project.json Vison project.json
autocmd BufRead,BufNewFile .bowerrc Vison bowerrc.json
" }

if has("autocmd")
  autocmd Filetype java setlocal omnifunc=javacomplete#Complete
endif

nnoremap <F6> call javacomplete#AddImport()<cr>
let g:vimtex_view_method = 'zathura'
let g:livepreview_previewer = 'zathura'
let g:syntastic_html_tidy_ignore_errors=["<ion-", "discarding unexpected </ion-", " proprietary attribute \"ng-"]

function! s:is_graph_only_line(candidate)
    return has_key(a:candidate.action__data, 'hash') ? 0 : 1
endfunction

let s:pandoc_diff_action = {
            \ 'description' : 'pandoc diff with vimpreviewpandoc',
            \ 'is_selectable' : 1,
            \ 'is_quit' : 1,
            \ 'is_invalidate_cache' : 0,
            \ }
function! s:pandoc_diff_action.func(candidates)
    if s:is_graph_only_line(a:candidates[0])
                \ || len(a:candidates) > 1 && s:is_graph_only_line(a:candidates[1])
        call giti#print('graph only line')
        return
    endif

    let from  = ''
    let to    = ''
    let file  = len(a:candidates[0].action__file) > 0
                \               ? a:candidates[0].action__file
                \               : expand('%:p')
    let relative_path = giti#to_relative_path(file)
    if len(a:candidates) == 1
        let to   = a:candidates[0].action__data.hash
        let from = a:candidates[0].action__data.parent_hash
    elseif len(a:candidates) == 2
        let to   = a:candidates[0].action__data.hash
        let from = a:candidates[1].action__data.hash
    else
        call unite#print_error('too many commits selected')
        return
    endif

    call vimpreviewpandoc#VimPreviewPandocGitDiff({
                \   'file' : relative_path,
                \   'from' : from,
                \   'to'   : to,
                \ })
endfunction

call unite#custom#action('giti/log', 'diff_pandoc_preview', s:pandoc_diff_action)
unlet s:pandoc_diff_action
au BufEnter * set conceallevel=2 concealcursor=i
let g:rooter_disable_map = 1
let g:pandoc#modules#enabled = ["folding"]
let g:pandoc#after#modules#enabled = ["supertab", "neosnippets", "snipmate", "unite", "tablemode", "nrrwrgn", "ultisnips"]

let g:syntastic_c_compiler_options = '-w -std=gnu99'
let g:syntastic_c_compiler_options = '-w -std=gnu99'

let g:syntastic_python_checkers = ['prospector', 'python']

let g:syntastic_tex_checkers = ['lacheck']

let g:investigate_url_for_ruby="http://devdocs.io/#q=django ^s"

let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","

let tern_show_argument_hints = 'on_move'

" ============  Settings from AxiVim ========="

" fzf Plugin config
set rtp+=~/.fzf

" TagBar Config
" Just configure and [make] ctags file
let g:tagbar_ctags_bin = "/usr/bin/ctags"
let g:tagbar_iconchars = ['+', '-']
" for coffeeScript
let g:tagbar_type_coffee = {
			\ 'ctagstype' : 'coffee',
			\ 'kinds'     : [
			\ 'c:classes',
			\ 'm:methods',
			\ 'f:functions',
			\ 'v:variables',
			\ 'f:fields',
			\ ]
			\ }
let g:tagbar_type_css = {
			\ 'ctagstype' : 'Css',
			\ 'kinds'     : [
			\ 'c:classes',
			\ 's:selectors',
			\ 'i:identities'
			\ ]
			\ }

" Syntastic Config
set statusline+=%#f1#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_error_symbol = 'x'
let g:syntastic_warning_symbol = '!'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0

" set Syntastic Cheacker engine
" example JavaScript use JSHint [ NodeJS ]
let g:syntastic_php_checkers        = ['php', 'phpcs', 'phpmd']
"let g:syntastic_java_checkers       = ['java', 'jsp']
" let g:syntastic_c_checkers          = ['c', 'h']
"let g:syntastic_cpp_checkers        = ['cpp']

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
    echo '- Lock NeoComplete'
    exe 'NeoCompleteLock'
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
    echo '- UnLock NeoComplete'
    exe 'NeoCompleteUnlock'
endfunction

" UltiSnips Config
" Trigger configuration.
let g:UltiSnipsExpandTrigger       = "<Tab>"
let g:UltiSnipsJumpForwardTrigger  = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<leader><Tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Emmet Config
" change <Tab> config , if use [YouCompleteMe]
let g:user_emmet_expandabbr_key ='<S-Tab>'
let g:user_emmet_settings = {
			\ 'php'     : {
			\ 'extends' : 'html',
			\ 'filters' : 'c',
			\ },
			\ 'xml'     : {
			\ 'extends' : 'html',
			\ },
			\ 'haml'    : {
			\ 'extends' : 'html',
			\ },
			\}

" GitGutter Setting
let g:gitgutter_sign_column_always = 0
let g:gitgutter_max_signs = 99999

" c.vim Building Config for C/C++ Vim
let g:C_UseTool_cmake='yes'
let g:C_UseTool_doxygen = 'yes'
"let  g:C_LocalTemplateFile = $VIM.'/vimfiles/c-support/templates/Templates'

" Unite Settings
let g:unite_prompt=">>"
let g:unite_source_file_rec_max_cache_files = 0
let g:unite_source_history_yank_enable      = 1
let g:unite_source_rec_async_command        = 1
let g:unite_source_grep_command             = 'ag'
let g:unite_source_grep_default_opts        = '--nocolor --nogroup --column'
let g:unite_source_grep_recursive_opt       = ''
let g:unite_source_history_yank_enable      = 1
let g:unite_split_rule                      = "botright"
let g:unite_update_time                     = 100
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
			\ 'ignore_pattern', join([
			\ '\.git/',
			\ 'git5/.*/review/',
			\ 'google/obj/',
			\ 'tmp/',
			\ '.sass-cache',
			\ 'node_modules/',
			\ 'bower_components/',
			\ 'dist/',
			\ '.git5_specs/',
			\ '.pyc',
			\ ], '\|'))
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '-'
let g:vimfiler_tree_closed_icon = '>'
let g:vimfiler_marked_file_icon = '*'

" Multip Cursor
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Vim incsearch
let g:vim_search_pulse_disable_auto_mappings = 1
let g:incsearch#auto_nohlsearch = 1

" ========================= Plugin Config End =========================
"
" Ignore file config
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
"
so $VIMRUNTIME/menu.vim

if has('persistent_undo')
    set undofile " So is persistent undo ...
    set undolevels=1000 " Maximum number of changes that can be undone
    set undoreload=10000 " Maximum number lines to save for undo on a buffer reload
endif

" NeoVim Configuration
if !has('nvim')
    set ttymouse=xterm2
endif
