let g:startify_bookmarks = [
  \ {'c': '~/.config/nvim/init.vim'},
  \ {'v': '~/devel/visionlib'},
  \ {'u': '~/UnityProjects/vlUnitySDK-example'}
  \ ]

let g:startify_lists = [
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'files',     'header': ['   MRU']            },
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'commands',  'header': ['   Commands']       },
  \ ]
