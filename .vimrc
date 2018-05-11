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
" Unite
"------------------------------------------------------
nmap <Leader>u [unite]
nnoremap <silent> [unite]b :Unite buffer<CR>
nnoremap <silent> [unite]f :Unite file<CR>
nnoremap <silent> [unite]m :Unite file_mru<CR>
nnoremap <silent> [unite]s :VimFiler -split -simple -winwidth=35 -no-quit
call unite#custom#alias('file', 'delete', 'vimfiler__delete')

"------------------------------------------------------
" Syntastic
"------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" let g:syntastic_ruby_checkers = ['rubocop']
" let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = 'x'
let g:syntastic_style_error_symbol = 'x'
let g:syntastic_warning_symbol = 'x'
let g:syntastic_style_warning_symbol = 'x'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColum
