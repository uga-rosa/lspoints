function lspoints#_notify(method, params)
  let method = a:method
  let params = a:params
  call denops#plugin#wait_async('lspoints', {->denops#notify('lspoints', method, params)})
endfunction

function s:notify_attach(name, options, bufnr)
  call denops#notify('lspoints', 'start', [a:name, a:options])
  call denops#notify('lspoints', 'attach', [a:name, a:bufnr])
endfunction

function lspoints#attach(name, options = {})
  let bufnr = bufnr()
  let name = a:name
  let options = a:options
  call denops#plugin#wait_async('lspoints', {->s:notify_attach(name, options, bufnr)})
endfunction

function lspoints#load_extensions(pathes)
  call lspoints#_notify('loadExtensions', [a:pathes])
endfunction
