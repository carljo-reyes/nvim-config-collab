local ls = require("luasnip")
local fmt = require('luasnip.extras.fmt').fmt;
local s = ls.snippet
local f = ls.function_node

local function get_date()
    return os.date("%F %I:%M %p");
end

local function filename_base()
    local filename = vim.fn.expand('%:t:r')
    return filename
end


ls.add_snippets("java", {
    ls.parser.parse_snippet("globe",
[[/**
 * Globe FinTech Innovations, Inc.
 * Copyright (c) 2004-2025 All Rights Reserved.
 */
]]),

    ls.parser.parse_snippet("testFoo",
[[/**
 * ${package_name}
 * 
 */
]]),

    s("gclass", fmt([[/**
 * @author Carljo Rommel Reyes
 * @version $Id: {}.java, v 0.1 {} zcarljo-r.reyes $$
*/
]], { f(filename_base), f(get_date) }))

})

