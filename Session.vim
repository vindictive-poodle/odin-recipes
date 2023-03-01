let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Documents/odin-recipes
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 index.html
badd +9 recipes/darjeeling.html
badd +9 recipes/earlgrey.html
badd +1 styles/style.css
badd +98 ~/.config/nvim/lua/user/keymaps.lua
badd +1 ~/Documents/odin-recipes/recipes/puer.html
badd +28 recipes/white.html
argglobal
%argdel
edit index.html
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 40 + 41) / 83)
exe 'vert 1resize ' . ((&columns * 91 + 91) / 183)
exe '2resize ' . ((&lines * 39 + 41) / 83)
exe 'vert 2resize ' . ((&columns * 91 + 91) / 183)
exe 'vert 3resize ' . ((&columns * 91 + 91) / 183)
argglobal
balt styles/style.css
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 14 - ((13 * winheight(0) + 20) / 40)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 14
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("styles/style.css", ":p")) | buffer styles/style.css | else | edit styles/style.css | endif
if &buftype ==# 'terminal'
  silent file styles/style.css
endif
balt index.html
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 38 - ((8 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 38
normal! 017|
wincmd w
argglobal
if bufexists(fnamemodify("recipes/white.html", ":p")) | buffer recipes/white.html | else | edit recipes/white.html | endif
if &buftype ==# 'terminal'
  silent file recipes/white.html
endif
balt ~/Documents/odin-recipes/recipes/puer.html
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 9 - ((8 * winheight(0) + 40) / 80)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 9
normal! 05|
wincmd w
2wincmd w
exe '1resize ' . ((&lines * 40 + 41) / 83)
exe 'vert 1resize ' . ((&columns * 91 + 91) / 183)
exe '2resize ' . ((&lines * 39 + 41) / 83)
exe 'vert 2resize ' . ((&columns * 91 + 91) / 183)
exe 'vert 3resize ' . ((&columns * 91 + 91) / 183)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
