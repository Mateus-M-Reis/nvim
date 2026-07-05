require "nvchad.mappings"
local term = require("nvchad.term")

local nomap = vim.keymap.del
nomap({"n", "t"}, "<A-i>")
nomap({"n", "t"}, "<A-h>")
nomap("n", "<C-n>")

local map = vim.keymap.set
local replace = vim.api.nvim_replace_termcodes

--map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({"n", "i", "v"}, "<C-s>", "<cmd> w <cr>",                                       {desc = "General ﬚  save file"})
map("n",             "<F3>",  "<cmd> w <CR>",                                       {desc = "General ﬚  save file" })
map("n",             "lç",    "<cmd> w <CR>",                                       {desc = "General ﬚  save file" })
map("n",             "<F2>",  "<cmd> qa <CR>",                                      {desc = "General close all files"})
map("n",             "<F4>",  "<cmd> q <CR>",                                       {desc = "General quit" })
map("n",             "<A-ç>", "<cmd> q <CR>",                                       {desc = "General ﬚  save file"})
map("t",             "<A-ç>", replace("<C-c> exit<CR> exit<CR><C-\\><C-N>:q<CR>", true, true, true), { desc = "Term close term" })
map("n",             "<F9>", "<cmd> source Session.vim <CR>",                       {desc = "General load session" })
map("n",             "ç",     "<cmd> :lua vim.diagnostic.open_float() <CR>",        {desc = "General show floating diagnostics"})
map({"n", "v"},      "\\",    "<C-\\><C-N>:NvimTreeToggle<CR>",                     {desc = "General toggle nvim-tree"})

-- Tab/Buf
map("n", "<A-n>", "<cmd> tabnext <CR>",                                     {desc = "Tab/Buf next tab" })
map("n", "<A-p>", "<cmd> tabprev <CR>",                                     {desc = "Tab/Buf prev tab"})
map("n", "<A-N>", "<cmd> lua require('nvchad.tabufline').move_buf(1)<CR>",  {desc = "Tab/Buf move buffer left"})
map("n", "<A-P>", "<cmd> lua require('nvchad.tabufline').move_buf(-1)<CR>", {desc = "Tab/Buf move buffer right"})

local mterm = function (pos, id, cmd)
  return function ()
    if id == "1" then
      term.toggle { pos = pos, id = id, cmd = cmd, float_opts = { width = 1.0, height = 0.33, row = 0.7 } }
    elseif id == "2" then
      term.toggle { pos = pos, id = id, cmd = cmd, float_opts = { width = 0.75, height = 0.66, col = 0.25 } }
    elseif id == "3" then
      term.toggle { pos = pos, id = id, cmd = cmd, float_opts = { width = 0.49, height = 1.0, col = 0.5 } }
    elseif id == "4" then
      term.toggle { pos = pos, id = id, cmd = cmd, float_opts = { width = 0.9, height = 0.9 } }
    else
      term.toggle { pos = pos, id = id, cmd = cmd}
    end
  end
end
-- Term
map({ "n", "t", "i" },      "<A-h>", mterm("float", "1"),                               { desc = "Term toggle f"   })
map({ "n", "t", "i" },      "<A-j>", mterm("float", "2"),                               { desc = "Term toggle F"   })
map({ "n", "t", "i" },      "<A-k>", mterm("float", "3"),                               { desc = "Term toggle v"   })
map({ "n", "t", "i" },      "<A-l>", mterm("float", "4"),                               { desc = "Term toggle hf"  })
map({ "n", "t", "i" },      "<A-;>", mterm("sp",    "h"),                               { desc = "Term toggle h"   })
map({ "n", "t", "i" },      "<A-:>", mterm("vsp",   "v"),                               { desc = "Term toggle v"   })
--map({ "t", "t", "i" },      "<C-t>", replace("<C-\\><C-N>", true, true, true),          { desc = "Term normal mode"})

-- cli apps
map("n", "<leader>ll", mterm("float", "4", "lazygit && exit"), { desc = "lazygit"})
map("n", "<leader>lo", mterm("float", "4", "opencode && exit"), { desc = "lazygit"})
map("n", "<leader>lb", mterm("float", "2", "btop && exit"), { desc = "lazygit"})
map("n", "<leader>lm", mterm("float", "2", "mc && exit"), { desc = "lazygit"})

-- lovr
local lovr = "~/.local/bin/lovr-x86_64.AppImage"
map("n", "<BS>", mterm("float", "1", lovr .. " ./ && exit"     ), { desc = "lovr" })
map("n", "<A-BS>", mterm("float", "1", lovr .. " dev/lodr ./ && exit"), { desc = "lovr hot-reload" })

---- love
--local love = "~/.local/bin/love-11.5-x86_64.AppImage"
----local feather = "feather run --love ~/.local/bin/love-11.5-x86_64.AppImage"
--map("n", "<BS>", mterm("float", "1", love .. " ./"   ), { desc = "love" })
----map("n", "<A-BS>", mterm("float", "1", feather .. " ./"), { desc = "love autoreloading" })

-- defold
--map("n", "<F5>", "<Cmd>DoNe build<CR>", { desc = "defold start" })
--map("n", "<A-BS>", "<Cmd>DoNe reload<CR>", { desc = "defold hot-reload" })

-- music
local strudel = require("strudel")
map("n", "<leader>sl", strudel.launch,     { desc = "Launch Strudel" })
map("n", "<leader>sq", strudel.quit,       { desc = "Quit Strudel" })
map("n", "<leader>st", strudel.toggle,     { desc = "Strudel Toggle Play/Stop" })
map("n", "<leader>su", strudel.update,     { desc = "Strudel Update" })
map("n", "<leader>ss", strudel.stop,       { desc = "Strudel Stop Playback" })
map("n", "<leader>sb", strudel.set_buffer, { desc = "Strudel set current buffer" })
map("n", "<leader>sx", strudel.execute,    { desc = "Strudel set current buffer and update" })
