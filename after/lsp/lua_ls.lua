return {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
      workspace = { library = { vim.env.VIMRUNTIME } },
    },
  },
}
