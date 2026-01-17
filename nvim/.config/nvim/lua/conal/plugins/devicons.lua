return {
  "echasnovski/mini.icons",
  version = false,
  config = function()
    local mini_icons = require("mini.icons")
    mini_icons.setup()
    -- Replace nvim-web-devicons with mini.icons
    mini_icons.mock_nvim_web_devicons()
  end,
}
