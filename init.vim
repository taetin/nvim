" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let $DATA = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME

" {{{ dein
let s:dein_dir = expand('$DATA/dein')

if &runtimepath !~# '/dein.vim'
    let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

    " Auto Download
    if !isdirectory(s:dein_repo_dir)
        call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
    endif

    execute 'set runtimepath^=' . s:dein_repo_dir
endif


" dein.vim settings

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    let s:toml_dir = expand('$CONFIG/dein')

    call dein#load_toml(s:toml_dir . '/plugins.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
    call dein#install()
endif
" }}}
nmap <silent> <C-e> :NERDTreeToggle<CR>

" denite
let g:denite_enable_start_insert=1
let g:denite_source_history_yank_enable =1
let g:denite_source_file_mru_limit = 200
nnoremap <C-t> :<C-u>Denite buffer<CR>
nnoremap <silent> ,ur :<C-u>Denite file_rec<CR>
nnoremap <silent> ,um :<C-u>Denite file_mru <CR>
nnoremap <silent> ,urc :<C-u>Denite file_rec:app/controllers/<CR><Space>
nnoremap <silent> ,urm :<C-u>Denite file_rec:app/models/ <CR><Space>
nnoremap <silent> ,urv :<C-u>Denite file_rec:app/views/ <CR><Space>
nnoremap <silent> ,urs :<C-u>Denite file_rec:app/assets/stylesheets/ <CR>
nnoremap <silent> ,urj :<C-u>Denite file_rec:app/assets/javascripts/ <CR>


" 行番号
set number
" 入力補完
set nocompatible
set wildmenu
" tab -> space*2
set expandtab
set tabstop=2
set shiftwidth=2
" クリップボード連携
set clipboard+=unnamed
" python2
let g:python_host_prog  = 'your py2'
" python3
let g:python3_host_prog = 'your py3'
" ruby
let g:ruby_host_prog = 'your rb'
" node
let g:node_host_prog = 'your node'
" NERDTree width
let g:NERDTreeWinSize = 40
" NERDTreeをデフォルト表示
autocmd vimenter * NERDTree
