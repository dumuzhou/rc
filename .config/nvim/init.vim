" 插件
let g:python3_host_prog = '/usr/local/bin/python3'
call plug#begin('~/.vim/plugged')
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'CocInstall -sync coc-html'}
"Plug '/opt/homebrew/bin/fzf'
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim' " needed for previews
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
Plug 'airblade/vim-rooter'
"Plug 'ervandew/supertab'
"Plug 'mauritsvdvijgh/flutter-reload.vim'
" swift 格式化
Plug 'w0rp/ale', {'tag': 'v2.5.0'}

" 代码片段
Plug 'dumuzhou/vim-snippets'

" 缩进和高亮
Plug 'tomasr/molokai'
Plug 'leafoftree/vim-vue-plugin'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
"Plug 'suan/vim-instant-markdown'
Plug 'dart-lang/dart-vim-plugin'
Plug 'Quramy/tsuquyomi'
Plug 'chemzqm/vim-jsx-improve'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'posva/vim-vue'
Plug 'udalov/kotlin-vim'
Plug 'keith/swift.vim'
Plug 'groenewege/vim-less'

" 目录和注释
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'

call plug#end()

let g:rooter_patterns = ['.git', 'package.json', 'Makefile', '*.sln', 'build/env.sh']


"let g:SuperTabDefaultCompletionType = "<c-n>"

let g:vim_vue_plugin_load_full_syntax = 1

" 记录上次打开文件位置
if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif

" 配色
filetype indent on
filetype plugin indent on
filetype on
colorscheme molokai
syntax on
set t_Co=256
let g:molokai_original = 0

" air-line
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1


" 代码补全
"let g:ycm_min_num_of_chars_for_completion = 3
"let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_complete_in_comments = 1
"let g:ycm_key_list_select_completion = ["<c-n>", "<Down>"]
"let g:ycm_key_list_previous_completion = ["<c-p>", "<Up>"]

highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight ALEErrorSign ctermbg=235

let g:jsx_ext_required = 0

" 重命名
nmap <leader>rn <Plug>(coc-rename)
" typescript
let g:typescript_ignore_browserwords = 1
autocmd BufNewFile,BufRead *.ts set filetype=typescript
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx

" 缩进
set ai
set ci
set number
set bs=2
set noet
set sw=2
set sw=2
set ts=2
set completeopt=preview,menu
set autochdir
set expandtab
set cc=80

" 字符
set fileencodings=uft-8,gbk
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set termencoding=utf-8
set clipboard=unnamed

" 文件类型设置
autocmd BufNewFile,BufRead *.myrc set filetype=zsh
autocmd BufNewFile,BufRead *.vue set filetype=vue
autocmd BufNewFile,BufRead *.nvue set filetype=vue
autocmd BufNewFile,BufRead *.wxml set filetype=javascript
autocmd BufNewFile,BufRead *.wxss set filetype=css
autocmd BufNewFile,BufRead *.dart set filetype=dart
autocmd FileType scss setl iskeyword+=@-@
autocmd FileType less setl iskeyword+=@-@
"autocmd FileType less setl iskeyword+=@-@
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd BufRead,BufNewFile *.tsx setlocal syntax=typescript.javascript
"autocmd FileType html setlocal omnifunc=javascriptcomplete#CompleteJS
"if !exists("g:ycm_semantic_triggers")
  "let g:ycm_semantic_triggers = {}
"endif
"let g:ycm_semantic_triggers['typescript'] = ['.']

" 不生成备份文件
set nobackup nowritebackup noswapfile

" 快捷键
nmap B :call Jsbeau()<CR>
nmap Dir :NERDTreeMirror<CR>
nmap Dir :NERDTreeToggle<CR>
nmap Q <leader>cc
nmap W <leader>cu
nmap Nb :set number <CR>
nmap Nnb :set nonumber <CR>
nmap P :set paste <CR>
nmap F gg = G
nmap Np :set nopaste <CR>
nmap r :call Run()<CR>


nmap <leader>rn <Plug>(coc-rename)
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" 查看buffers
" left bbb = 'bp<bar>bd #'
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>d :bp<bar>bd #<CR>

" 切换buffers
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" allow to scroll in the preview
set mouse=a



" 代码格式化
" 代码变动不检查
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_fixers = {
      \   'swift': ['swiftformat'],
      \}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

" 运行
func! Run()
  let file = expand("%")
  if stridx(file,".js")>-1
    "exec "w"
    exec "! clear && node %<"
  endif
  if stridx(file,".ts")>-1
    "exec "w"
    "exec "! clear && ts-node %"
    exec "! clear && yarn start"
  endif
  if stridx(file,".go")>-1
     exec "w"
     exec "! clear && go run %"
"    exec "! curl http://127.0.0.1:8080/%<"
  endif
  if stridx(file,".dart")>-1
    exec "w"
    "exec "! clear && dart --enable-asserts %"
    exec "! clear && pub run ./index.dart"
  endif
  if stridx(file,".swift")>-1
    exec "w"
    exec "! clear && swiftc MyClass.swift main.swift && ./main"
  endif
  if stridx(file,".java")>-1
    exec "w"
    exec "! clear && javac % && java %<"
  endif
  if stridx(file,".kt")>-1
    exec "w"
    exec "! clear && kotlinc main.kt -include-runtime -d main.jar && java -jar main.jar"
  endif
  if stridx(file,".py")>-1
    exec "w"
    exec "! clear && python3 %"
  endif
  if stridx(file,".rs")>-1
    exec "w"
    exec "! clear && cargo run"
  endif
  if stridx(file,".cs")>-1
    exec "w"
    exec "! clear && dotnet run"
  elseif stridx(file,".cpp")>-1
    exec "w"
    exec "! clear && g++ % && ./a.out"
  elseif stridx(file,".c")>-1
    exec "w"
    exec "! clear && gcc % && ./a.out"
  endif
  if stridx(file,".h")>-1
    exec "! cd /Users/songting/Documents/helllo-objc-cmd/ && xcodebuild -scheme helllo-objc-cmd && /Users/songting/Library/Developer/Xcode/DerivedData/Build/Products/Debug/helllo-objc-cmd"
    "exec w
    "exec ! clear && gcc % -o objc -ObjC -framework Foundation && ./objc
  endif
  if stridx(file,".m")>-1
    exec "! cd /Users/songting/Documents/language-objc/ && xcodebuild -scheme language-objc && /Users/songting/Library/Developer/Xcode/DerivedData/language-objc-bqwlhheilvrdagfvfshkqubimrol/Build/Products/Debug/language-objc"
    "exec w
    "exec ! clear && gcc % -o objc -ObjC -framework Foundation && ./objc
  endif
endfunc

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" mappings

nmap <Leader><Leader>     <Plug>(coc-definition)
nmap <Leader>]            :<C-u>bp<CR>
nmap <Leader>i            <Plug>(coc-implementation)
nmap <Leader>r            <Plug>(coc-references)

nnoremap <silent> <space><space> :<C-u>Rg<CR>
nnoremap <silent> <space>c :<C-u>CocFzfList<CR>
nnoremap <silent> <space>o       :<C-u>CocFzfList outline<CR>
nnoremap <silent> <space>p       :<C-u>CocFzfListResume<CR>
"nnoremap <silent> <space>g      :<C-u>GFiles<CR>
nnoremap <silent> <space>g      :<C-u>GFiles?<CR>
nnoremap <silent> <space>l      :<C-u>Lines<CR>
nnoremap <silent> <space>b      :<C-u>Buffers<CR>
nmap gc <Plug>(coc-git-commit)
nnoremap <Leader>l :CocList LeetcodeProblems<CR>
nnoremap <Leader>r :CocCommand leetcode.run<CR>
nnoremap <Leader>s :CocCommand leetcode.submit<CR>
nnoremap <Leader>h :CocCommand leetcode.comments<CR>
" flutter
nnoremap <silent> <space>e      :<C-u>CocCommand flutter.emulators<CR>
nnoremap <silent> <space>r      :<C-u>CocCommand flutter.run<<CR>


autocmd ColorScheme * call Highlight()

function! Highlight() abort
  hi Conceal ctermfg=239 guifg=#504945
  hi CocSearch ctermfg=12 guifg=#18A3FF
endfunction
hi CocMenuSel ctermbg=237 guibg=#13354A
autocmd ColorScheme * hi CocMenuSel ctermbg=237 guibg=#13354A
