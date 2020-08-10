```
docker run -itd --name nim-develop ubuntu:18.04

docker exec -it nim-develop /bin/bash

apt update

apt install -y curl git
apt install -y clang gcc
echo | apt install -y sudo

groupadd -g 1000 aine
useradd -m -g aine -u 1000 aine
chsh -s /bin/bash aine
echo "aine:aine_pwd"|chpasswd
echo "aine ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

#https://github.com/neovim/neovim/releases/tag/v0.4.4

cd /usr/local/src

curl -fsSLO https://github.com/neovim/neovim/releases/download/v0.4.4/nvim.appimage

chmod 755 nvim.appimage 
./nvim.appimage --appimage-extract
chmod -R 755 squashfs-root/

ln -fsr /usr/local/src/squashfs-root/usr/bin/nvim /usr/local/bin/nvim 
ln -fsr /usr/local/src/squashfs-root/usr/bin/nvim /usr/local/bin/nvi

su aine

cd $HOME

#https://qiita.com/tamago3keran/items/cdfd66b627b3686846d2

mkdir -p ~/.config/nvim/
touch ~/.config/nvim/init.vim

#https://github.com/junegunn/vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

cat <<EOS > ~/.config/nvim/init.vim
call plug#begin('~/.vim/plugged')

"LSP
Plug 'prabirshrestha/asyncomplete.vim'

"LSPのNIMプラグイン
"https://github.com/alaviss/nim.nvim
Plug 'alaviss/nim.nvim'

"りんたー
"https://medium.com/@moinmoti/nim-on-neovim-ec3cf44dd82c
Plug 'dense-analysis/ale'

" Initialize plugin system
call plug#end()

"リンター設定
let g:ale_linters = {
\   'nim': ['nimlsp', 'nimcheck'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'nim': ['nimpretty'],
\}
let g:ale_linters_explicit = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✖✖'
let g:ale_sign_warning = '⚠⚠'
highlight ALEErrorSign guifg=Red
highlight ALEWarningSign guifg=Yellow

"nimのLSPコード補完設定
au User asyncomplete_setup call asyncomplete#register_source({
    \ 'name': 'nim',
    \ 'whitelist': ['nim'],
    \ 'completor': {opt, ctx -> nim#suggest#sug#GetAllCandidates({start, candidates -> asyncomplete#complete(opt['name'], ctx, start, candidates)})}
    \ })
EOS


#https://qiita.com/jiro4989/items/6cf94cec054e50f66dbf
#プロンプトあるので、yesと答える
curl https://nim-lang.org/choosenim/init.sh -sSf | sh

echo 'export PATH=$HOME/.nimble/bin:$PATH'  >>$HOME/.bashrc

source $HOME/.bashrc

choosenim stable

#プロンプトあるので、yesと答える
#https://github.com/PMunch/nimlsp
nimble install nimlsp


#nvimのコマンドラインモードでPlugInstall実行
nvim

#動作確認
touch a.nim
nvim a.nim

cat <<EOS >a.nim
import algorithm

var a = [1,2,3,4,5]

echo a

echo a.reversed
EOS

nim c a.nim

./a
#[1, 2, 3, 4, 5]
#@[5, 4, 3, 2, 1]


```



