execute pathogen#infect()
colorscheme solarized
set background=dark
" set tw=79
set shell=bash
set laststatus=2
set hidden
set mouse=
syntax on
set hlsearch
set history=500
set undolevels=500
set smartcase
set wildmenu
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildignorecase
set nohlsearch
set nobackup 
set ruler             
set showcmd            
set gcr=a:blinkon0
set incsearch           
set autoindent
filetype plugin indent on
set tabstop=4 shiftwidth=4 expandtab
set nowrap
set noerrorbells
set number
set relativenumber
set visualbell
set ai
set smarttab
set cursorline
set smartindent
set scrolloff=17
set sm
set backspace=2
set t_Co=256
highlight StatusLine ctermfg=blue ctermbg=yellow
nmap <F9> 1G=G
nmap <F2> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=0
let mapleader=","
nnoremap <F8> :call ToggleMouse()<CR>
function! ToggleMouse()
    if &mouse == 'a'
        set mouse=
        echo "Mouse usage disabled"
    else
        set mouse=a
        echo "Mouse usage enabled"
    endif
endfunction
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_left_alt_sep = '|'
let g:airline_right_alt_sep = '|'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='solarized'

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>t :enew<cr>

" Move to the next buffer
nmap <leader>n :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>w :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>l :ls<CR>

nmap <leader>p :CtrlPCmdPalette<cr>

" Setup some default ignores
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
            \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
            \  }

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

autocmd BufWritePost .vimrc,_vimrc source $MYVIMRC
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>

hi StatusLine ctermbg=black 

augroup sourcesession
        autocmd!
        autocmd VimEnter * nested
        \ if !argc() && empty(v:this_session) && filereadable('Session.vim') |
        \   source Session.vim |
        \ endif
augroup END

let g:ctrlsf_auto_close = 0
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END


cnoremap w!! w !sudo tee % >/dev/null
map Q gq
