require "nvchad.options"

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
local opt = vim.opt
opt.foldmethod = "indent"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.clipboard = "unnamedplus"

vim.cmd[[ au FileType vim setlocal fo-=c fo-=r fo-=o ]]
vim.cmd[[ set nowrap ]]

--vim.filetype.add({
--  extension = {
--    fp = "glsl",
--    fs = "glsl",
--    vp = "glsl",
--  }
--})

vim.filetype.add({
  extension = {
    script = "lua",
    gui_script = "lua",
  }
})

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
--
vim.opt.splitkeep = "screen"
