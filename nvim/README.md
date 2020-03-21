
### install plug
https://github.com/junegunn/vim-plug
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### install python package
```
pip install neovim pynvim python-language-server pycodestyle pylint jedi
```

### install nodejs package
```
npm install -g neovim bash-language-server dockerfile-language-server-nodejs
```

### install coc extensions
```
nvim -c 'CocInstall -sync coc-json coc-tsserver coc-java coc-python coc-highlight coc-lists coc-git coc-xml coc-vimlsp coc-markdownlint|q'
```

