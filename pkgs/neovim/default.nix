{ config, pkgs, ... }:

{

  programs.neovim.enable = true;

  programs.neovim.plugins = with pkgs; [
    vimPlugins.a-vim
    vimPlugins.ale
    vimPlugins.ctrlp-vim
    # gina?
    vimPlugins.lightline-vim
    vimPlugins.rainbow_parentheses-vim
    vimPlugins.rust-vim
    vimPlugins.tagbar
    vimPlugins.undotree
    vimPlugins.vim-better-whitespace
    vimPlugins.vim-bufferline
    # vim-bundle-mako
    # vim-editorconfig
    # vim-epage
    vimPlugins.vim-gutentags
    # vim-hybrid
    vimPlugins.vim-indent-guides
    # vim-indexedsearch
    vimPlugins.vim-signify
    vimPlugins.vim-toml
    vimPlugins.vim-vinegar
    # wildfire

    # New
    vimPlugins.vim-nix
    vimPlugins.vim-addon-nix
  ];

  programs.neovim.extraConfig = ''
  set hidden "Buffers don't have to be saved and remember undo stuff

  """""""""""""""""""""""""""""""""""""""""""""""
  " Appearance
  """""""""""""""""""""""""""""""""""""""""""""""
  set lazyredraw  "Stop VIM from being redraw happy

  set nowrap
  set lbr " wraps at words instead of at characters

  set list

  set noerrorbells
  set novisualbell

  set diffopt+=iwhite,icase

  if has("gui_running")
    "color hybrid
    "set background=dark
    set background=light
    "color Dark

    set spell
    set number
    set cursorline
    set guioptions-=m "remove menu bar
    set guioptions-=T "remove toolbar

    " run maximized
    if has("unix")
       "this command doesn't work on unix for some reason
    else
       au GUIEnter * simalt ~x
    endif

  endif

  """""""""""""""""""""""""""""""""""""""""""""""
  " Status Line
  """""""""""""""""""""""""""""""""""""""""""""""
  set showcmd  "Show (partial) command in status line.
  set wildmode=list:longest
  set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.d,objects

  " Lightline:
  set noshowmode
  let g:lightline = {
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'gina#component#repo#branch'
        \ },
        \ }

  """""""""""""""""""""""""""""""""""""""""""""""
  " Search
  """""""""""""""""""""""""""""""""""""""""""""""
  set hls
  set showmatch "Show matching brackets.
  set smartcase "Do smart case matching
  set incsearch "Incremental search

  if executable('rg.bat')
      set grepprg=rg\ --vimgrep
      set grepformat=%f:%l:%c:%m
  elseif executable('pt.bat')
      set grepprg=pt\ --nogroup\ --nocolor
      set grepformat=%f:%l:%c:%m
  endif

  """""""""""""""""""""""""""""""""""""""""""""""
  " Navigation
  """""""""""""""""""""""""""""""""""""""""""""""

  nnoremap <Space> :

  " Toggle tag list
  map <F3> :TagbarToggle<CR>
  " Switch between header and source file
  map <F4> :A<CR>
  " Display undo tree
  nnoremap <F5> :UndotreeToggle<CR>

  let g:gutentags_ctags_tagfile = '.tags'

  " Home key alternates between begin of line and begin of text
  function! SmartHome()
    let s:col = col(".")
    normal! ^
    if s:col == col(".")
      normal! 0
    endif
  endfunction
  nnoremap <silent> <Home> :call SmartHome()<CR>
  inoremap <silent> <Home> <C-O>:call SmartHome()<CR>

  """""""""""""""""""""""""""""""""""""""""""""""
  " Programming
  """""""""""""""""""""""""""""""""""""""""""""""

  syntax on
  filetype plugin on
  filetype indent on

  " Persistent undo
  if has("persistent_undo")
     set undofile
  endif

  " Emphasize inconsistent indentation
  highlight EvilSpace ctermbg=darkred guibg=darkred
  au Syntax * syn match EvilSpace /\(^\t*\)\@<!\t\+/ " tabs not preceeded by tabs

  autocmd VimEnter * :IndentGuidesEnable

  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadChevrons

  "Strip trailing whitespace
  autocmd BufWritePost * :StripWhitespace

  " make Python syntax highlighting highlight more things
  let python_highlight_numbers = 1
  let python_highlight_builtins = 1
  " PyEv - Will evaluate the current line
  let python_highlight_exceptions = 1

  let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_enter = 0
  let g:ale_rust_cargo_use_check = 1
  let g:ale_rust_cargo_check_all_targets = 1

  let g:rustfmt_autosave = 1

  let g:wildfire_objects = {
      \ "*" : ["iw", "i'", 'i"', "i)", "i]", "i}", "ip"],
      \ "c,cpp" : ["iw", "i'", 'i"', "i)", "i]", "i}", "a}"],
      \ "python" : ["iw", "i'", 'i"', "i)", "i]", "ip"],
      \ "html,xml" : ["iw", "is", "ip", "it", "at"],
  \ }
  '';
}
