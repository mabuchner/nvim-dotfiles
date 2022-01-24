set noshowmode

let g:lightline = {}

let g:lightline.colorscheme =  'nord'

let g:lightline.component_expand = {
\  'lsp_warnings': 'lightline#lsp#warnings',
\  'lsp_errors': 'lightline#lsp#errors',
\  'lsp_info': 'lightline#lsp#info',
\  'lsp_hints': 'lightline#lsp#hints',
\  'lsp_ok': 'lightline#lsp#ok',
\  'lsp_status': 'lightline#lsp#status',
\ }

let g:lightline.component_type = {
\  'lsp_warnings': 'warning',
\  'lsp_errors': 'error',
\  'lsp_info': 'info',
\  'lsp_hints': 'hints',
\  'lsp_ok': 'left',
\ }

let g:lightline.component_function = {
\  'fileformat': 'LightlineFileformat',
\  'filetype': 'LightlineFiletype',
\  'gitbranch': 'FugitiveHead'
\ }

let g:lightline.active = {
\  'left': [
\    ['mode', 'paste'],
\    ['gitbranch', 'readonly', 'filename', 'modified']
\  ],
\  'right': [
\    ['lineinfo'],
\    ['fileformat', 'fileencoding', 'filetype'],
\    ['lsp_info', 'lsp_hints', 'lsp_errors', 'lsp_warnings', 'lsp_ok'],
\    ['lsp_status']
\  ]
\ }

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? &fileencoding : ''
endfunction
