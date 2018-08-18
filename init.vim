set rtp^=/usr/share/vim/vimfiles/

let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif " Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#clear_state()
  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir        = expand('~/.config/nvim/rc')
  let s:toml            = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

    " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,            {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  if dein#check_install()
     call dein#install()
  endif
  call dein#end()
endif

if dein#check_install()
    call dein#install()
endif

imap <C-f> <Plug>(neosnippet_expand_or_jump)
smap <C-f> <Plug>(neosnippet_expand_or_jump)

set lazyredraw
set number
set encoding=utf-8
set fileencoding=utf-8
set showmatch
set clipboard+=unnamedplus
set noswapfile
set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=2 " 画面上でタブ文字が占める幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=2 " smartindentで増減する幅et noequalalways

noremap <C-e> :close<CR>
noremap <SPACE>, :noh<CR>

noremap s> <C-w>>
noremap s< <C-w><
noremap s[ <C-w>+
noremap s] <C-w>-
noremap th gT
noremap tl gt

noremap ; :
noremap <Tab> gg
noremap X :w<CR>
noremap <C-o> ma<C-o>
tnoremap <ESC> <C-\><C-n>
syntax on
autocmd BufWritePre * :%s/\s\+$//ge
autocmd BufNewFile,BufRead *.vue set filetype=html
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END
augroup Markdown
  autocmd!
  autocmd Filetype markdown noremap <F1> :!markdown2confluence % \| pbcopy<CR>
augroup END

hi clear SpellBad
hi SpellBad cterm=underline
hi clear SpellCap
hi SpellCap cterm=underline,bold
:highlight LineNr ctermfg=1
au BufNewFile,BufRead *.tag setf pug
colorscheme default
hi Cursorline ctermfg=0 ctermbg=130 gui=bold,reverse guifg=Sienna4 guibg=White
autocmd BufRead,BufNewFile .xonshrc setfiletype python
