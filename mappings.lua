-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<D-v>"] = {'"+P', desc = "Paste"},
    ["U"] = {"<C-r>", desc = "Redo"},
    ["<D-z>"] = {"u", desc = "Undo"},
    ["<D-Z>"] = {"<C-r>", desc = "Redo"},

    -- window management
    ["<leader>sv"] = {"<C-w>v", desc = "split window vertically"},
    ["<leader>sh"] = {"<C-w>s", desc = "split window horizontally"},
    ["<leader>se"] = {"<C-w>=", desc = "make split windows equal width & height"},
    ["<leader>sx"] = {":close<CR>", desc = "close current split window"},
    ["dd"] = {'"_dd', desc = "Delete without save in buffer"}
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["<D-v>"] = {'<C-\\><C-o>"+p', desc = "Paste"},
  },
  v = {
    ["<D-c>"] = {'"+y', desc = "Copy"},
    ["<D-v>"] = {'"+P', desc = "Paste"},
    ["d"] = {'"_d', desc = "Delete without save in buffer"}
  },
  c = {
    ["<D-v>"] = {'<C-R>+', desc = "Paste"},
  },
  i = {
    ["<D-v>"] = {'<C-r><C-o>+', desc = "paste"},
    ["<D-z>"] = {"<Esc>ui", desc = "Undo"},
    ["<D-Z>"] = {"<Esc><C-r>i", desc = "Redo"},
  }
}
