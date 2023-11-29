" 插件
let g:python3_host_prog = '/usr/local/bin/python3'
call plug#begin('~/.vim/plugged')
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release', 'commit': '89cd42aea4cb91cac40fe96b756d43a34b442a64'}
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

if $NVM_BIN != ""
  let g:coc_node_path = '$NVM_BIN/node'
endif

