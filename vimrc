call plug#begin('~/.vim/plugged')
Plug 'dstein64/vim-startuptime', {'on': 'StartupTime'}
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim', {'on': 'Files'}
Plug 'mustache/vim-mustache-handlebars', {'for': 'handlebars'}
Plug 'moll/vim-node'
Plug 'docunext/closetag.vim'
" Plug 'w0rp/ale', {'on': 'ALEFix'}
" Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
" Plug 'Valloric/YouCompleteMe'
" Plug ap/vim-css-color
Plug 'bkad/CamelCaseMotion'
Plug 'Raimondi/delimitMate'
" Plug 'sjl/gundo.vim'
" Plug 'majutsushi/tagbar' maybe
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}

Plug 'Xuyuanp/nerdtree-git-plugin'
" General crap
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " trying coc
Plug 'christoomey/vim-tmux-navigator'
" Tpope
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-unimpaired'
" Plug 'Shougo/vimproc'
" Snippets
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'ntpeters/vim-better-whitespace' " highlight traling ws
Plug 'metakirby5/codi.vim', {'on': 'Codi'}
" Colorschemes
Plug 'morhetz/gruvbox'
" Plug 'joshdick/onedark.vim'
" JS Plugs
"Plug 'marijnh/tern_for_vim'
" Plug 'schickling/vim-bufonly'
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug  'mxw/vim-jsx'

Plug 'neoclide/coc.nvim', {'branch': 'release'} ", 'on': 'CocAction'}

Plug 'heavenshell/vim-jsdoc', {'for': 'javascript'}

 " This has the limitation that you can't uninstall the extension by using :CocUninstall and that automatic update support is not available.
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-stylelint', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'} " had vim
" errors for this, maybe justneed to reinstall? yarn installed directly into
" .coc/extensions

Plug 'glidenote/newdayone.vim'


call plug#end()

let mapleader=","
call camelcasemotion#CreateMotionMappings('<leader>')
" Plugin settings
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let g:signify_sign_overwrite = 0
" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"let g:tern_map_keys=1
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" not sure why this doesn't work - my js picks up conflicting lint errs
" let g:ale_linter_aliases = {'frontend': ['javascript', 'scss']}
" let g:ale_linters = {'scss': ['prettier', 'stylelint'], 'javascript': ['prettier', 'eslint']}
" let g:ale_fixers = {'scss': ['prettier', 'stylelint'], 'javascript': ['prettier', 'eslint']}

let g:deoplete#enable_at_startup = 1

" SETTINGS
set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
colorscheme gruvbox
set background=dark
set encoding=utf-8
set fileencoding=utf-8
set comments=sr:/**,m:*\ ,ex:*/,://
set number
set relativenumber
"folding
set foldenable
set foldmethod=indent
set foldlevelstart=99
"Spell Checking
set spelllang=en_us
set splitbelow
"Write the old file out when switching between files.
" set autowrite
set autoread
"Display current cursor position in lower right corner.
set ruler
set timeoutlen=500
set hidden
"Indent stuff
set smartindent
set autoindent
"Tab stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help
set t_Co=256
set backspace=2 "
" set colorcolumn=80
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,".join(range(120,999),",")
set listchars=tab:▸\ ,eol:¬
set clipboard=unnamed
set laststatus=2
"Better line wrapping
set wrap
set textwidth=79
set formatoptions=qrn1
"search stuff
set incsearch
set hlsearch
set ignorecase
set smartcase
"Show command in bottom right portion of the screen
set showcmd
set updatetime=250
set termguicolors

" keybindings/maps
" inoremap jk <esc>
nnoremap <space> :
nmap <leader>q ysiw'
" nmap <silent><leader>s :set spell!<CR>
" nnoremap <leader>nt :NERDTreeToggle<cr>
nmap <leader>l :set list!<CR>
nmap ; :Buffers<CR>

" yank and delete line without newline
noremap yl ^y$
noremap dl ^d$

" go to end of line while in insert mode, stay in insert mode
inoremap <C-e> <C-o>A

nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
" find comma, append newline after comma
nnoremap <leader>z f,a<cr><esc>
" Use Return key to clear search highlighting
nmap <CR> :nohlsearch<CR>
autocmd BufReadPost quickfix nmap <buffer> <CR> <CR>
" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put *<CR>:set nopaste<CR>
" nmap <F8> :TagbarToggle<CR>
nnoremap dp :diffput<cr>
"auto command stuff.
autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
set shell=/usr/local/bin/fish
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1


" Dani's olde stuff
" "!!!From my old vimrc
" noremap ,gc :!git add . && git commit -am "
" noremap ,gp :!git push<CR>
" noremap ,gl :!git pull<CR>
" noremap ,hp :!hub pull-request<CR>
" noremap ; :
" noremap : ;
noremap ,n :NERDTreeToggle<CR>
noremap <leader>nf :NERDTreeFind<cr>
" noremap <leader>fi :ALEFix<cr>
" "shouldn't need this but seems ; : above conflicting

 let g:javascript_conceal_function   = "ƒ"
 let g:javascript_conceal_null       = "ø"
 let g:javascript_conceal_this       = "@"
" 
" ""!!!!!The following is from skwp/dotfiles/vimrc (yadr)
" "" Use Vim settings, rather then Vi settings (much better!).
" "" This must be first, because it changes other options as a side effect.
" "
" "" ================ General Config ====================
" "
" "set backspace=indent,eol,start  "Allow backspace in insert mode
" "set history=1000                "Store lots of :cmdline history
" "set showcmd                     "Show incomplete cmds down the bottom
" set autoread                    "Reload files changed outside vim
" "
" "" This makes vim act like all other editors, buffers can
" "" exist in the background without being in a window.
" "" http://items.sjbach.com/319/configuring-vim-right
" "set hidden
" "
" "" ================ Turn Off Swap Files ==============
" "
 set noswapfile
" "set nobackup
set backupdir=~/.vim/backups/backups
set nowb
" "
" "" ================ Persistent Undo ==================
" "" Keep undo history across sessions, by storing in file.
" "" Only works all the time.
" "
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile
" "
" "" Display tabs and trailing spaces visually
" "set list listchars=tab:\ \ ,trail:·
" "
" "set nowrap       "Don't wrap lines
" "set linebreak    "Wrap lines at convenient points
" "
" "" ================ Folds ============================
" "
" "set foldmethod=indent   "fold based on indent
" "set foldnestmax=3       "deepest fold is 3 levels
" "set nofoldenable        "dont fold by default
" "
" "" ================ Completion =======================
" "
" "set wildmode=list:longest
" "set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
" "set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
" "set wildignore+=*vim/backups*
" "set wildignore+=*sass-cache*
" "set wildignore+=*DS_Store*
" "set wildignore+=vendor/rails/**
" "set wildignore+=vendor/cache/**
" "set wildignore+=*.gem
" "set wildignore+=log/**
" "set wildignore+=tmp/**
" "set wildignore+=*.png,*.jpg,*.gif
" "
" "" ================ Scrolling ========================
" "
" "set scrolloff=8         "Start scrolling when we're 8 lines away from margins
" "set sidescrolloff=15
" "set sidescroll=1
" 
" " Windows *********************************************************************
" set equalalways " Multiple windows, when created, are equal in size
" set splitbelow splitright
" 
" :nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" 
" " Status Line *****************************************************************
" set ruler " Show ruler
" set ch=1 " Make command line two lines high
" 
" 
" " Insert New Line **************************************************************
" set ch=1 " Make command one line high
" 
" " Mapping ********************************************************************
" noremap <leader>w :up<cr>
" 
" " Speedy.vim ********************************************************************
" set ttyfast " u got a fast terminal
" " set ttyscroll=3
set lazyredraw " to avoid scrolling problems
" set timeoutlen=250
" 
 " Cursorline/CursorColumn for current window only ****************
augroup Cursor
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
  au WinLeave * setlocal nocursorcolumn
augroup END
" 
" "CtrlP
" let g:ctrlp_custom_ignore= {'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\', 'dir': '\v[\/]\.(git|hg|svn)$'}
" let g:ctrlp_max_files=0
" let g:ctrlp_max_depth=40
" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ./'
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" " Syntax off for large files
" "autocmd BufReadPre * if getfsize(expand("%")) > 1000000 | syntax off | endif

" "set statusline+=%#warningmsg#
" "set statusline+=%{SyntasticStatuslineFlag()}
" "set statusline+=%*

nmap s <Plug>(easymotion-s)

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
command! FormatJSON %!python -m json.tool
" autocmd BufNewFile,BufRead *.json set ft=javascript
"
"Coc stuff
let g:coc_node_path = '/Users/xhu/.nvm/versions/node/v13.13.0/bin/node' "use more updated node
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

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
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
noremap <leader>fi :Format<cr>

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" end coc stuff
"
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_enable_es6 = 1
let g:jsdoc_underscore_private = 1

" json c (with comments for cocconfig)
" autocmd FileType json syntax match Comment +\/\/.\+$+

" \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
" \ -g "!*.{min.js,swp,o,zip}"
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --follow --hidden --vimgrep --color "always"
  \ -g "!{.git,node_modules,vendor}/*" '

" F seems a little different than Rg. can do F require('path') but Rg doesn't find. Rg <enter> then require('path') seems to work though.
command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
