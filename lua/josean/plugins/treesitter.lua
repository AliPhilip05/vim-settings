return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter")
    local parsers = {
      "json",
      "javascript",
      "typescript",
      "tsx",
      "yaml",
      "html",
      "css",
      "prisma",
      "markdown",
      "markdown_inline",
      "svelte",
      "graphql",
      "bash",
      "lua",
      "vim",
      "dockerfile",
      "gitignore",
      "query",
      "vimdoc",
      "c",
    }

    treesitter.setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })
    treesitter.install(parsers, { summary = true })

    local ts_group = vim.api.nvim_create_augroup("user_treesitter", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      group = ts_group,
      callback = function(args)
        local filetype = vim.bo[args.buf].filetype
        local lang = vim.treesitter.language.get_lang(filetype)
        if not lang then
          return
        end

        local ok = pcall(vim.treesitter.start, args.buf, lang)
        if ok then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })

    require("nvim-ts-autotag").setup({
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
    })
  end,
}
