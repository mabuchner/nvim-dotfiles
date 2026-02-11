" Disable arrow keys
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

" Move vertically by visual line
" (only if no count was given)
nnoremap j gj
nnoremap k gk
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

augroup npm
  autocmd!
  autocmd FileType javascript nnoremap <buffer><leader>mm :!npm run build
  autocmd FileType javascript nnoremap <buffer><leader>mt :!npm run test
augroup END

augroup clang-format
  autocmd!
  autocmd FileType c,cpp,cs,javascript,objc,objcpp noremap <buffer><C-K> :py3file /usr/local/opt/llvm/share/clang/clang-format.py<cr>
  autocmd FileType c,cpp,cs,javascript,objc,objcpp inoremap <buffer><C-K> <c-o>:py3file /usr/local/opt/llvm/share/clang/clang-format.py<cr>
augroup END

augroup make
  autocmd!
  autocmd FileType c,cpp,objc,objcpp,cmake nnoremap <buffer><leader>mm :Make --build build
  autocmd FileType c,cpp,objc,objcpp,cmake nnoremap <buffer><leader>mt :Make --target test --build build
  autocmd FileType c,cpp,objc,objcpp,cmake nnoremap <buffer><leader>mi :Make --target install --build build
augroup END

