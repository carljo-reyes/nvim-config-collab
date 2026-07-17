local cmd = require("cal.mapping").cmd
local map = require("cal.mapping").map

map("n", "q", cmd("bd"))
map("n", "cc", cmd("Git commit -v"), {
  buffer = 0,
  silent = true,
  desc = "commit",
})
