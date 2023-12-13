return {

  {
    "navarasu/onedark.nvim",

    -- "LazyVim/LazyVim",
    -- Theme inspired by Atom
    config = function()
      require('onedark').setup {
        -- Main options --
        style = 'deep', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'

        -- toggle theme style ---
        toggle_style_key = nil,                                                              -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
        toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

        -- Change code style ---
        -- Options are italic, bold, underline, none
        -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
        code_style = {
          comments = 'italic',
          -- keywords = 'none',
          -- functions = 'none',
          -- strings = 'none',
          -- variables = 'none'
        },

        -- Lualine options --

        -- Custom Highlights --
        colors = {
          -- bright_orange = "#ff8800",    -- define a new color
          -- -- green = '#00ffaa',            -- redefine an existing color
          -- dark_green = '#475a39'
        }, -- Override default colors
        highlights = {
          -- ["Comment"] = { fg = 'green', fmt = 'none' },
          -- ["@Comment"] = { fg = 'green', fmt = 'none' },
          -- ["@function"] = {fg = '#0000ff', sp = '$cyan', fmt = 'underline,italic'},
          -- ["@function.builtin"] = {fg = '#0059ff'}
        }, -- Override highlight groups

        -- Plugins Config --
        -- diagnostics = {
        --   darker = true,     -- darker colors for diagnostic
        --   undercurl = true,  -- use undercurl instead of underline for diagnostics
        --   background = true, -- use background color for virtual text
        -- },
      }
      require('onedark').load()
    end,
  },
}
