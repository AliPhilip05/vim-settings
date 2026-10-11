return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 35,
        relativenumber = true,
      },
      -- Keep the tree in step with the current file and working directory.
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      sync_root_with_cwd = true,
      -- Change folder arrow icons.
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "",
              arrow_open = "",
            },
          },
        },
      },
      -- Avoid choosing another window when opening a file from the tree.
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })

    vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", {
      desc = "Toggle file explorer",
    })
    vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", {
      desc = "Find current file in explorer",
    })
    vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", {
      desc = "Collapse file explorer",
    })
    vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", {
      desc = "Refresh file explorer",
    })
  end,
}
