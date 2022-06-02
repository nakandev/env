" Ref:https://lambdalisue.hatenablog.com/entry/2013/06/23/071344

" # 必須設定
" release autogroup in MyAutoCmd
augroup MyAutoCmd
  autocmd!
augroup END

let mapleader = ','  " <Leader>をデフォルトの\から,に変更

" # 推奨設定
" ## 検索関係
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch           " インクリメンタルサーチ
set wrapscan            " 最後まで行ったら最初に戻る
set hlsearch            " 検索マッチテキストをハイライト (2013-07-03 14:30 修正）

" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" ## 編集関係
set shiftround          " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set infercase           " 補完時に大文字小文字を区別しない
set hidden              " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く
set showmatch           " 対応する括弧などをハイライト表示する
set matchtime=3         " 対応括弧のハイライト表示を3秒にする
set virtualedit=onemore " カーソルを行末に移動可能にする
set virtualedit+=block  " ブロック選択で文字がない場所にカーソル移動可能にする
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" 対応括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>

" バックスペースでなんでも消せるようにする
set backspace=indent,eol,start

"" クリップボードをデフォルトのレジスタとして指定。後にYankRingを使うので
"" 'unnamedplus'が存在しているかどうかで設定を分ける必要がある
"if has('unnamedplus')
"    " set clipboard& clipboard+=unnamedplus " 2013-07-03 14:30 unnamed 追加
"    set clipboard& clipboard+=unnamedplus,unnamed 
"else
"    " set clipboard& clipboard+=unnamed,autoselect 2013-06-24 10:00 autoselect 削除
"    set clipboard& clipboard+=unnamed
"endif

" Swapファイル/Backupファイル:絶対残しておくべき
" set nowritebackup
" set nobackup
" set noswapfile
set swapfile
set directory=~/.vim/tmp
set backup
set backupdir=~/.vim/tmp

" ## 表示関係
set t_Co=256
colorscheme default
set background=dark
" highlight ColorColumn ctermbg=234

set list                " 不可視文字の可視化
set number              " 行番号の表示
set laststatus=2        " ステータスラインを常に表示
set wrap                " 長いテキストの折り返し
set textwidth=0         " 自動的に改行が入るのを無効化
set colorcolumn=80,100,120  " その代わり80,100,120文字目にラインを入れる

" 前時代的スクリーンベルを無効化
set t_vb=
set novisualbell

" デフォルト不可視文字は美しくないのでUnicodeで綺麗に
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↙

" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" ## マクロおよびキー設定
" 配置が遠いキーの代替キー
" ノーマルモード(ESC)
noremap <C-o> <Esc>
noremap! <C-o> <Esc>

tnoremap <Esc> <C-\><C-n>
tnoremap <C-o> <C-\><C-n>

" <C-hjkl> でカーソル移動
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-n> <BackSpace>
inoremap <C-p> <Delete>
" 補完(前方検索)キー代替
inoremap <C-y> <C-p>

" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk


" vを二回で行末まで選択
vnoremap v $h

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

" s + ? で複数ウィンドウ簡単操作
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

" t + ? でXX操作
noremap t <nop>

" m + ? でXX操作
noremap m <nop>

" <Space> + ? でXX操作
"noremap <Space>h ^
"noremap <Space>l $

" ウィンドウサイズ変更
" => winresizerで実施(C-Eでリサイズモード)
"      hjkl  : リサイズ
"      Enter : 確定
"      q     : キャンセル

" T + ? で各種設定をトグル
nnoremap [toggle] <Nop>
nmap T [toggle]
nnoremap <silent> [toggle]s :setl spell!<CR>:setl spell?<CR>
nnoremap <silent> [toggle]l :setl list!<CR>:setl list?<CR>
nnoremap <silent> [toggle]t :setl expandtab!<CR>:setl expandtab?<CR>
nnoremap <silent> [toggle]w :setl wrap!<CR>:setl wrap?<CR>

" vim 起動時のみカレントディレクトリを開いたファイルの親ディレクトリに指定
autocmd MyAutoCmd VimEnter * call s:ChangeCurrentDir('', '')
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction

" ~/.vimrc.localが存在する場合のみ設定を読み込む
let s:local_vimrc = expand('~/.vimrc.local')
if filereadable(s:local_vimrc)
    execute 'source ' . s:local_vimrc
endif

" ################################
" vim-plug
" ################################
call plug#begin('~/.vim/plugged')

Plug 'kana/vim-submode'  " キー入力 AB AB AB を ABBB でできるようにする
Plug 'tpope/vim-surround'
"Plug 'davidhalter/jedi-vim'  " 重いので無効
Plug 'simeji/winresizer'
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
"Plug 'vim-syntastic/syntastic'  " 表示がおかしくなるので無効
Plug 'nvie/vim-flake8'
Plug 'rhysd/vim-clang-format'  " C/C++コード整形
Plug 'kana/vim-operator-user'  " Pluginを選択領域に対し適用できるようにする
Plug 'tyru/caw.vim'  " コメントアウト

call plug#end()

" ==== nerdtree
map <C-n> :NERDTreeToggle<CR>
" ==== vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_auto_colors=0
highlight IndentGuidesOdd ctermbg=234 guibg=Gray
highlight IndentGuidesEven ctermbg=235
highlight ColorColumn ctermbg=234 guibg=Gray
" ==== vim-flake8
autocmd BufWritePost *.py call Flake8()  " 保存時にflake8を実行
"let g:flake8_max_line_length=80  # moved to ~/.config/flake8
"let g:flake8_max_complexity=20
" ==== vim-clang-format
autocmd FileType c,cpp,objc map <buffer><Leader>f <Plug>(operator-clang-format)
let g:clang_format#code_style = 'google'
let g:clang_format#style_options = {
\ "AlignConsecutiveAssignments": "true",
\ "Cpp11BracedListStyle": "true",
\ "DerivePointerAlignment": "false",
\ "IndentCaseLabels": "true",
\ "IndentWidth": 2,
\ "KeepEmptyLinesAtTheStartOfBlocks": "true",
\ "PointerAlignment": "Right",
\ "SpacesBeforeTrailingComments": 2,
\ "Standard": "Cpp11",
\ "TabWidth": 2,
\ "UseTab": "Never"
\ }
" ==== caw.vim
nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)
nmap <Leader>C <Plug>(caw:zeropos:toggle)
vmap <Leader>C <Plug>(caw:zeropos:toggle)
" ==== vim-submode
" <C-f><C-hjkl> でカーソル移動(ページ上下、行頭行末)
noremap  <C-f> <nop>
noremap! <C-f> <nop>
noremap  <C-f><C-h> <Home>
noremap! <C-f><C-h> <Home>
noremap  <C-f><C-l> <End>
noremap! <C-f><C-l> <End>
call submode#enter_with('cursormove', 'inv', '', '<C-f><C-j>', '<PageDown>')
call submode#map('cursormove', 'inv', '', '<C-j>', '<PageDown>')
call submode#enter_with('cursormove', 'inv', '', '<C-f><C-k>', '<PageUp>')
call submode#map('cursormove', 'inv', '', '<C-k>', '<PageUp>')

