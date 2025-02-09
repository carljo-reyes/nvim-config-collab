local ls = require("luasnip")
local fmt = require('luasnip.extras.fmt').fmt;
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node


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
 * Copyright (c) 2004-2024 All Rights Reserved.
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

