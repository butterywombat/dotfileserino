filetype off
" Bootstrap
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
call plug#begin('~/.vim/plugged')

Plug 'dstein64/vim-startuptime', {'on': 'StartupTime'}

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim' " , {'on': 'Files'}

" Navigation
Plug 'preservim/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'

" Plug 'christoomey/vim-tmux-navigator'
Plug 'knubie/vim-kitty-navigator'

" General crap
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline' " TODO switch to lightline, less bloat
Plug 'vim-airline/vim-airline-themes', {'on': 'AirlineTheme'} " not needed fluff, think most themes automagically set this too if theres a theme available
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine', {'on': 'IndentLinesToggle'}
Plug 'easymotion/vim-easymotion'
Plug 'bkad/CamelCaseMotion'
Plug 'justinmk/vim-sneak' " 2 char f/t
let g:sneak#s_next = 1
let g:sneak#label = 1
map f <Plug>Sneak_s
map F <Plug>Sneak_S
" for some reason my s/S are taken by 'remove char/line and enter insert mode'- how?
" cl/cc do the same as S/s
 " note using T then pressing t means going backwards, and T is forwards now (base dir changed)
map t <Plug>Sneak_t
map T <Plug>Sneak_T

Plug 'metakirby5/codi.vim', {'on': 'Codi'} " replify

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'yuttie/hydrangea-vim'
Plug 'AlessandroYorba/Alduin'
Plug 'w0ng/vim-hybrid'
Plug 'nightsense/snow'
Plug 'nightsense/stellarized'
Plug 'nightsense/cosmic_latte' " hi LineNr ctermbg=NONE guibg=NONE

Plug 'alvan/vim-closetag' " TODO re-eval workings
Plug 'jiangmiao/auto-pairs' " replace Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace' " highlight trailing ws


" Lang specific
Plug 'ap/vim-css-color'
"Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'yuezk/vim-js', {'for': 'javascript'} " compare w pangloss

Plug 'maxmellon/vim-jsx-pretty', {'for': 'javascript'}
Plug 'mustache/vim-mustache-handlebars', {'for': 'handlebars'}
" Plug 'sheerun/vim-polyglot'

Plug 'heavenshell/vim-jsdoc', {'tag': '1.0.0'} " 2.0 doesn't support nvim

" LSP and lintings
Plug 'dense-analysis/ale', {'on': 'ALEFix'}
" unfortunately seems like prettier-stylelint (even prettier-stylelint-temp) not being maintained well, it's
" not working for me. can investigate later. so need ale for at least css

Plug 'neoclide/coc.nvim', {'branch': 'release'} ", 'on': 'CocAction'}
Plug 'liuchengxu/vista.vim'

" This has the limitation that you can't uninstall the extension by using :CocUninstall and that automatic update support is not available.
" Can't seem to bypass artifactory to install with CocInstall, this is the
" other option
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-stylelint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'} " reconsider need
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'} " reconsider need
Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'} " had vim
" errors for this, maybe just need to reinstall? i yarn installed directly into .coc/extensions

" Graphical undo tree
" Plug 'sjl/gundo.vim'

" Snippets. I never use snippets.
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" Extra extraness
" Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-unimpaired'
" Plug 'terryma/vim-multiple-cursors'

" Playing with ----------------------------------------------------------------
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " broken for nvim
Plug 'junegunn/vim-peekaboo'
" Plug 'luochen1990/rainbow' " needs config, broken. retry when attempting clojure

" TODO
" - add a way to edit this file quickly
" - consider which-key, coc-actions which has floating windows ranger/ranger.vim/floaty ranger thing, coc-explorer, defx, floaterm
" - try just using netrw? w some settings from https://www.youtube.com/watch?v=nDGhjk4Eqbc&list=LLz2frLr13jJWUBJJyD8im3w

call plug#end()

let mapleader=","
" set nocompatible " default for nvim
filetype plugin indent on
syntax on
" colorscheme gruvbox

" let g:nord_cursor_line_number_background = 1
colorscheme nord

set termguicolors " better colors, incl the colorcolumns
set background=dark
set encoding=utf-8
set fileencoding=utf-8
set comments=sr:/**,m:*\ ,ex:*/,://
set number
set relativenumber
set foldenable " 3 folding
set foldmethod=indent
set foldlevelstart=99
set spelllang=en_us
set splitbelow
" set autowrite
set autoread
set ruler " display current cursor position in lower right corner.
set timeoutlen=500
set hidden
set smartindent
set autoindent
set tabstop=2 " 4 tab stuff
set shiftwidth=2
set softtabstop=2
set expandtab
" set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help
" set backspace=2 " have backspace work like normal. seems to be fine without rn
" set colorcolumn=80

let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,".join(range(120,999),",")
set listchars=tab:▸\ ,eol:¬
" set clipboard=unnamed " point to system keyboard, seems to work without this for now
set laststatus=2 " always display status bar. TODO reeval
set wrap " better line wrapping
set textwidth=79
set formatoptions=qrn1
set incsearch " search stuff
set hlsearch
set ignorecase
set smartcase

set showcmd " show command in bottom right portion of the screen
set updatetime=250
set shell=/usr/local/bin/zsh

" keybindings/maps
nnoremap <space> :

" removes </word/> delims in search registry
nnoremap * g*


" yank and delete line without newline
noremap yl ^y$
noremap dl ^d$

" go to end of line while in insert mode, stay in insert mode
inoremap <C-e> <C-o>$

" find comma, append newline after comma
nnoremap <leader>z f,a<cr><esc>

" Use Return key to clear search highlighting
nmap <CR> :nohlsearch<CR>

" " Preserve indentation while pasting text from the OS X clipboard
" noremap <C-p>:set paste<CR>:put *<CR>:set nopaste<CR>

" fzf
nmap <Leader>t :Files<CR>
nmap <Leader>p :GFiles<CR>

" git status
nmap <silent><Leader>G :GFiles?<CR>

" or maybe gt, go for theirs, ours
nmap <leader>g1 :diffget //2 <bar> diffup<CR> 
nmap <leader>g2 :diffget //3 <bar> diffup<CR>
nmap <silent><Leader>gs :G<CR>
" fugitive git status

nmap ; :Buffers<CR>
nnoremap rg :RG 
" search for word under cursor
nnoremap <silent><leader>* :RG <C-R><C-W><CR>
" search for last yanked item
nnoremap <silent><leader>y :RG <C-R>"<CR>
" search for last searched term
nnoremap <silent><leader>s :RG <C-R>/<CR>

" Vim keybindings fzf
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" end fzf

noremap <leader>i :IndentLinesToggle<cr>

noremap <leader>n :NERDTreeToggle<CR>
noremap <leader>nf :NERDTreeFind<cr>
" let NERDTreeHighlightCursorline = 0 " may help with slowness, but it didn't seem to

noremap <leader>al :ALEFix<cr>

" from Erik Falor - From Vim Muggle to Wizard in 10 Easy Steps (8) video
" will execute the current line in shell and pipe back to buffer
noremap Q !!sh<CR>

" nmap <leader>q ysiw'
" nmap <silent><leader>s :set spell!<CR>
" nmap <leader>l :set list!<CR>

" TODO prune from here
autocmd BufReadPost quickfix nmap <buffer> <CR> <CR>
" autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl
" au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl
" au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

" old
" noremap ; :
" noremap : ;

" Plugin settings
let NERDTreeShowHidden=1
let g:airline_powerline_fonts = 1

" display all buffers when only one tab open
let g:airline#extensions#tabline#enabled = 1

call camelcasemotion#CreateMotionMappings('<leader>')

" let delimitMate_expand_cr = 1
" let delimitMate_expand_space = 1
" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" not sure why this doesn't work - my js picks up conflicting lint errs
" let g:ale_linter_aliases = {'frontend': ['javascript', 'scss']}
" coc stylelint + prettier seem to be lacking, use ale for that
let g:ale_linters = {'scss': ['prettier', 'stylelint'], 'javascript': ['prettier', 'eslint']}
let g:ale_fixers = {'scss': ['prettier', 'stylelint'], 'javascript': ['prettier', 'eslint']}

let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_enable_es6 = 1
let g:jsdoc_underscore_private = 1

let g:NERDSpaceDelims = 1

let g:peekaboo_compact = 1

" pangloss js
" let g:javascript_conceal_function   = "ƒ"
" let g:javascript_conceal_null       = "ø"
" let g:javascript_conceal_this       = "@"

" ""!!!!!The following is from skwp/dotfiles/vimrc (yadr)
" "set history=1000                "Store lots of :cmdline history

set noswapfile
"set nobackup
set backupdir=~/.vim/backups/backups
set nowb

" Persistent undo - keep undo history across sessions, by storing in file.
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

"set linebreak " Wrap lines at convenient points

" ================ Completion =======================
" set wildmode=list:longest
" set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
" set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
" set wildignore+=*vim/backups*
" set wildignore+=*sass-cache*
" set wildignore+=*DS_Store*
" set wildignore+=vendor/rails/**
" set wildignore+=vendor/cache/**
" set wildignore+=*.gem
" set wildignore+=log/**
" set wildignore+=tmp/**
" set wildignore+=*.png,*.jpg,*.gif
"
" ================ Scrolling ========================
" set scrolloff=8 " start scrolling when we're 8 lines away from margins
" set sidescrolloff=15
" set sidescroll=1

" set splitbelow splitright

" set ch=1 " make command one line high

" however interferes with my camelcase motion setup
noremap <leader>w :up<cr> 

set ttyfast " u got a fast terminal
set lazyredraw " to avoid scrolling problems
" set ttyscroll=3
" set timeoutlen=250

" Cursorline/CursorColumn for current window only
augroup Cursor
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
  au WinLeave * setlocal nocursorcolumn
augroup END

" Source the vimrc file after saving it
augroup sourcing
  autocmd!
  autocmd bufwritepost .vimrc source $MYVIMRC
augroup END

" Syntax off for large files
" autocmd BufReadPre * if getfsize(expand("%")) > 1000000 | syntax off | endif

nmap <leader>em <Plug>(easymotion-s)
xmap <leader>em <Plug>(easymotion-s)

command! FormatJSON %!python -m json.tool
" autocmd BufNewFile,BufRead *.json set ft=javascript

" RG --------------------------------------------------------------------------
set grepprg=rg\ --vimgrep " for fugitive Ggrep

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --follow --hidden --vimgrep --color "always"
  \ -g "!{.git,node_modules,vendor}/*" '
" note --vimgrep takes over the previously set --hidden :( so easiest to find
" in hidden with F. but need vimgrep for preview window for some reason until I redo that part manually

" F seems a little different than Rg. can do F require('path') but Rg doesn't find. Rg <enter> then require('path') seems to work though.
command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

" Get Files. override fzf :Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" copied from fzf.vim
" make fzf completely delegate its search responsibliity to ripgrep, may be faster
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
" end rg ----------------------------------------------------------------------

" Coc -------------------------------------------------------------------
let g:coc_node_path = '/Users/xhu/.nvm/versions/node/v13.13.0/bin/node' " use more updated node
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Eslint :CocCommand eslint.executeAutofix
command! -nargs=0 Bro :CocCommand git.browserOpen " like Gbro but specific line
" setup autofixonsave/eslint as a formatter by following coc-eslint docs (still using coc-prettier/prettier-eslint for now)

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

" Use `[d` and `]d` to navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
" nnoremap <silent> K :call CocActionAsync('showSignatureHelp')<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
    " call CocActionAsync('showSignatureHelp')
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

" Use <TAB> for selections ranges. syntax tree selection
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <S-tab> <Plug>(coc-range-select)
xmap <silent> <S-tab> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
noremap <leader>fi :Format<cr>

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" autocmd User CocGitStatusChange {command}
" let g:airline_section_y = \"%{get(b:, 'coc_git_blame', 'yo')}"
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics. clashing with some mappings
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

" navigate chunks of current buffer ([c and ]c use fugitive to navigate the
" same)
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)

" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
nmap <leader>cu :CocCommand git.chunkUndo<CR>

" show commit contains current position
nmap gc <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)
" end coc ---------------------------------------------------------------------

" json c (with comments for cocconfig)
" autocmd FileType json syntax match Comment +\/\/.\+$+
" \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
" \ -g "!*.{min.js,swp,o,zip}"

" Vista
let g:vista_default_executive = 'coc'
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
" By default vista.vim never runs if you don't call it explicitly.
" show the nearest function in your statusline automatically
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:airline_section_y = "%{NearestMethodOrFunction()}"

let g:github_enterprise_urls = ['https://github.tlcinternal.com']

" TODO stopped working
" vim-closetag
"" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'javascriptreact': 'jsxRegion',
   \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
" end vim-closetags

" Playing with ----------------------------------------------------------------
" let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1 " for syntax highlighting plugin

" attempt to replace nerdtree with netrw, needs work
" map <silent><Leader>nf :let @/=expand("%:t") <Bar> execute 'Lex' expand("%:h") <Bar> normal n<CR>
" map <Leader>n :Lex<CR>

" broken
" let g:NERDTreeLimitedSyntax = 1 " remove some lag
" augroup nerdtree
"     autocmd!
"     autocmd FileType nerdtree syntax clear NERDTreeFlags
"     " other nerdtree related aucomds
" augroup END
"
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>

" easy console log
" imap clg console.log()<Esc>==f(<CR>a
" vmap gl cclg<Esc>p
