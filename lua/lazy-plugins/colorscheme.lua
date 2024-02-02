local function make_transparent(hlgroup, c)
    hlgroup.bg = c.none
    hlgroup.fg = c.none
end

return {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
        transparent = true,
        on_highlights = function(hl, c)
            make_transparent(hl.NeoTreeNormal, c)
            make_transparent(hl.NeoTreeNormalNC, c)
            make_transparent(hl.NormalSB, c)
        end
    },
    init = function()
        vim.cmd [[colo tokyonight]]
    end
}
