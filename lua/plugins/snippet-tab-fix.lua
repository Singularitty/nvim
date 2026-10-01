-- Fix: <Tab> jumping all over the file.
-- AstroNvim enables LuaSnip "history", so finished snippets stay jumpable and
-- <Tab> (blink.cmp: select_next -> snippet_forward) teleports the cursor back
-- into old snippet placeholders. Only allow jumping inside the snippet you're
-- actually in, and leave it as soon as you exit it.
---@type LazySpec
return {
  "L3MON4D3/LuaSnip",
  opts = {
    history = false,
    keep_roots = false,
    link_roots = false,
    link_children = false,
    exit_roots = true,
    region_check_events = "CursorMoved,CursorHold,InsertEnter",
    delete_check_events = "TextChanged,InsertLeave",
  },
  init = function()
    vim.api.nvim_create_autocmd("ModeChanged", {
      desc = "Unlink LuaSnip snippet when leaving it",
      pattern = { "s:n", "i:*" },
      callback = function(ev)
        local ok, luasnip = pcall(require, "luasnip")
        if ok and luasnip.session.current_nodes[ev.buf] and not luasnip.session.jump_active then
          luasnip.unlink_current()
        end
      end,
    })
  end,
}
