return {
  -- Theme inspired by Atom
  'catppuccin/nvim',
  priority = 1000,
  name = "catppuccin",
  config = function()
    require('catppuccin').setup {
      flavour = "macchiato",
      transparent_background = true,
    }
    require("catppuccin").load()
  end,
}
