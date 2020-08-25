" Tell YCM where to find the plugin. Add to any existing values.
let g:ycm_java_jdtls_extension_path = [
  \ '/home/cosmin/.vim/pack/vimspector/opt/vimspector/gadgets/linux'
  \ ]

let s:jdt_ls_debugger_port = 0
function! s:StartDebugging()
  if s:jdt_ls_debugger_port <= 0
    " Get the DAP port
    let s:jdt_ls_debugger_port = youcompleteme#GetCommandResponse(
      \ 'ExecuteCommand',
      \ 'vscode.java.startDebugSession' )
    echom "Got port" s:jdt_ls_debugger_port

    if s:jdt_ls_debugger_port == ''
       echom "Unable to get DAP port - is JDT.LS initialized?"
       let s:jdt_ls_debugger_port = 0
       return
     endif
  endif

  echom "Using port" s:jdt_ls_debugger_port

  " Start debugging with the DAP port
  call vimspector#LaunchWithSettings( { 'DAPPort': s:jdt_ls_debugger_port } )
endfunction

nnoremap <Leader><F6> :call <SID>StartDebugging()<CR>
