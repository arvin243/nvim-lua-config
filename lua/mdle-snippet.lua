return {
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  version = "v2.*",
  config = function()
    local ls = require("luasnip")
    local lssnip = ls.snippet
    local lsfunc = ls.function_node

    ls.add_snippets("all", {
      lssnip("dt", lsfunc(function() return os.date("%Y-%m-%d") end, {})),
      lssnip("ts10", lsfunc(function() return tostring(os.time()) end, {})),
      lssnip("ts13", lsfunc(function() return tostring(os.time() * 1000) end, {})),
    })
  end
}
