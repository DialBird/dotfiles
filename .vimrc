" keisuke docker dotfiles
"
" if you use dein
au!
source ~/.vimrc_dein

"------------------------------------------------------
" option
"------------------------------------------------------
set autoindent smartindent
set autoread
set backspace=indent,eol,start
" for editing crontab
set backupskip=/tmp/*,/private/tmp/*
set completeopt=menuone
set expandtab
set hidden
set hlsearch
set noeb vb t_vb=
set noerrorbells
set noswapfile
set number
set pumheight=10
set scrolloff=5
set tabstop=2 shiftwidth=2 softtabstop=0

"------------------------------------------------------
" mapping
"------------------------------------------------------
nnoremap j gj
nnoremap k gk
nnoremap <CR> G
vnoremap <CR> G
nnoremap <esc><esc> :noh<CR>
let mapleader = "\<Space>"
nnoremap <Leader>e :echo expand("%")<CR>
nnoremap <Leader>snn :set nonumber<CR>
nnoremap <Leader>snm :set number<CR>
nnoremap <Leader>sv :source ~/.vimrc<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader><Leader>c :e++enc=cp932<CR>
nnoremap <Leader><Leader>s :e++enc=sjis<CR>
nnoremap <Leader><Leader>u :e++enc=urf8<CR>
vnoremap <Leader>k :s/_\(.\)/\u\1/g<CR>
inoremap <silent> jj <ESC>

" dein
nnoremap <Leader>du :call dein#update()<CR>
nnoremap <Leader>dc :call map(dein#check_clean(), "delete(v:val, 'rf')")<CR>
nnoremap <Leader>dr :call dein#recache_runtimepath()<CR>

"------------------------------------------------------
" color
" syntaxはなんか正規表現とかのエラーが出る場合にはコメントアウトする(プラグイン以降はもんだいなし)
"------------------------------------------------------
syntax on 
colorscheme lucario
let &colorcolumn=join(range(81,999),",")
hi ColorColumn ctermbg=235
hi Visual ctermbg=33

" Without ColorScheme Plugins
" colorscheme murphy
" hi LineNr ctermfg=239
" hi Comment ctermfg=244
" hi SignColumn ctermfg=9
" hi VertSplit ctermfg=7
" hi StatusLine ctermfg=7
" hi StatusLineNC ctermfg=7
" VimFiler
hi vimfilerNormalFile ctermfg=15
hi vimfilerClosedFile ctermfg=46
hi vimfilerNonMark ctermfg=46
hi vimfilerMarkedFile ctermfg=11

"------------------------------------------------------
" indent config
"------------------------------------------------------
augroup fileTypeIndent
  au!
  " au BufNewFile,BufRead *.c setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END

"------------------------------------------------------
" EasyMotion
"------------------------------------------------------
nmap <Leader><CR> <Plug>(easymotion-prefix)
vmap <Leader><CR> <Plug>(easymotion-prefix)

"------------------------------------------------------
" NeoSnippets
"------------------------------------------------------
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
let g:neosnippet#snippets_directory = '~/.cache/dein/repos/github.com/Shougo/neosnippet-snippets/neosnippets/'

"------------------------------------------------------
" Ale
"------------------------------------------------------
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '=='
let g:ale_fix_on_save = 1
let g:ale_linters = {'html': []}
let b:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'python': ['autopep8'],
      \ 'ruby': ['rubocop']
      \ }
let b:ale_javascript_eslint_executable = './node_modules/.bin/eslint'

"------------------------------------------------------
" Ligntline
"------------------------------------------------------
set laststatus=2
let g:lightline = {}

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }
let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }

"------------------------------------------------------
" Vim FZF
"------------------------------------------------------
set rtp+=/usr/local/opt/fzf
nnoremap <C-f> :FZFFileList<CR>
command! FZFFileList call fzf#run({
      \ 'source': 'find . -type d \( -name .git -o -name ruby -o -name tmp -o -name log \) -prune -o ! -name .DS_Store',
      \ 'sink': 'e',
      \ 'down': '40%'})
nnoremap <C-h> :History<CR>

"------------------------------------------------------
" Vim Easy Align
"------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"------------------------------------------------------
" Vim Ack
"------------------------------------------------------
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
