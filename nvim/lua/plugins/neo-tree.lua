return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    opts = {
      window = {
        mappings = {
          ["<C-b>"] = "close_window",
        },
      },
      filesystem = {
        filtered_items = {
          visible = true, -- show hidden files by default
        },
      },
    },
  }
}
