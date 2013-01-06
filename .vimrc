syntax on
"set number
set nowrap

map <Up> k
map <Down> j
map <Left> h
map <Right> l
map <Home> 0
map <End> $
map <PageUp> 30k
map <PageDown> 31j


if ! has("gui_running") 
    set t_Co=256 
endif 
" feel free to choose :set background=light for a different style 
set background=dark 
colors peaksea 
