" =============================================================================
" Filename: autoload/lightline/tab.vim
" Author: itchyny
" License: MIT License
" Last Change: 2016/05/07 22:31:02.
" =============================================================================

let s:save_cpo = &cpo
set cpo&vim

function! lightline#tab#filename(n) abort
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let _ = expand('#'.buflist[winnr - 1].':t')
  return _ !=# '' ? _ : '[No Name]'
endfunction

function! lightline#tab#modified(n) abort
  let winnr = tabpagewinnr(a:n)
  return gettabwinvar(a:n, winnr, '&modified') ? '+' : gettabwinvar(a:n, winnr, '&modifiable') ? ' ' : '-'
endfunction

function! lightline#tab#readonly(n) abort
  let winnr = tabpagewinnr(a:n)
  return gettabwinvar(a:n, winnr, '&readonly') ? 'RO' : ''
endfunction

function! lightline#tab#tabnum(n) abort
  return a:n
endfunction

function! lightline#tab#buffilename(n) abort
  let _ = fnamemodify(bufname(a:n), ':t')
  return _ !=# '' ? _ : '[No Name]'
endfunction

function! lightline#tab#bufmodified(n) abort
  return getbufvar(a:n, '&modified') ? '+' : getbufvar(a:n, '&modifiable') ? ' ' : '-'
endfunction

function! lightline#tab#bufreadonly(n) abort
  return getbufvar(a:n, '&readonly') ? 'RO' : ''
endfunction

function! lightline#tab#buftabnum(n) abort
  return a:n
endfunction

function! lightline#tab#smartfilename(n) abort
  if g:lightline_use_buftab
    return lightline#tab#buffilename(a:n)
  else
    return lightline#tab#filename(a:n)
  endif
endfunction

function! lightline#tab#smartmodified(n) abort
  if g:lightline_use_buftab
    return lightline#tab#bufmodified(a:n)
  else
    return lightline#tab#modified(a:n)
  endif
endfunction

function! lightline#tab#smartreadonly(n) abort
  if g:lightline_use_buftab
    return lightline#tab#bufreadonly(a:n)
  else
    return lightline#tab#readonly(a:n)
  endif
endfunction

function! lightline#tab#smarttabnum(n) abort
  if g:lightline_use_buftab
    return lightline#tab#buftabnum(a:n)
  else
    return lightline#tab#tabnum(a:n)
  endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
