{
  programs.vim = {
    enable = true;
    settings = {
      # Spaces instead of tabs
      expandtab = true;
      shiftwidth = 4;
      tabstop = 4;
      history = 50;
      ignorecase = true;
      number = true;
    };
    extraConfig = ''
      filetype indent on
      " allow backspacing over everything in insert mode
      set backspace=indent,eol,start
      " Always  set auto indenting on
      set autoindent
      " select when using the mouse
      set selectmode=mouse
      " do not keep a backup files
      set nobackup
      set nowritebackup
      " show the cursor position all the time
      set ruler
      " show (partial) commands
      set showcmd
      " do incremental searches (annoying but handy);
      set incsearch
      " Set status line
      set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*
      " Always display a status line at the bottom of the window
      set laststatus=2
      " showmatch: Show the matching bracket for the last ')'?
      set showmatch
      syntax on
      set hlsearch
    '';
  };
}
