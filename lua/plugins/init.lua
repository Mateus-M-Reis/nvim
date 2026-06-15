return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- { import = "nvchad.blink.lazyspec" }, -- test new blink

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = { preserve_window_proportions = false },
      git = {
        ignore = false,
      }
    },
    actions = {
      open_file = {
        resize_window = false,
      }
    }
  },

  {
    "nvim-treesitter/nvim-treesitter",
    --build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css",
        "glsl",
        --"gdscript", "gdshader"
      },

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      injections = {
        enable = true,
      },
    },
  },

  --{
  --  "williamboman/mason.nvim",
  --  opts = {
  --    ensure_installed = {
  --      "lua-language-server",
  --      "bash-language-server",
  --      -- data science
  --      "pyright",
  --      "python-lsp-server",
  --      -- web dev
  --      "html-lsp",
  --      "css-lsp",
  --      -- data formats
  --      "json-lsp",
  --      -- games
  --      "glsl_analyzer",
  --      "gdtoolkit",
  --    },
  --  },
  --},

  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    lazy = false,
    ---@module 'render-markdown'
    opts = {},
  },

  {
    "Exafunction/windsurf.nvim", lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({
        virtual_text = {
          enabled = true,
          default_filetype_enabled = true,
          map_keys = true,
          key_bindings = {
            accept = "<C-a>", accept_word = "<C-w>", accept_line = "<C-r>", clear = "<C-z>", next = ">C-n>", prev = "<C-p>"
          },
        }
      })
    end
  },

  {
    "gruvw/strudel.nvim",
    build = "npm ci",
    lazy = false,
    config = function()
      require("strudel").setup({
        ui = {
          --hide_menu_panel = true,
          --hide_top_bar = true,
          --hide_error_display = true,
          --hide_code_editor = true,
        }
      })
    end,
  },

  --{ "monkoose/DoNe", lazy = false },

  --{
  --  "lommix/godot.nvim",
  --  lazy = true,
  --  cmd = { "GodotDebug", "GodotBreakAtCursor", "GodotStep", "GodotQuit", "GodotContinue" },
  --},

  --{ "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },

  --{
  --  'Mathijs-Bakker/godotdev.nvim',
  --  dependencies = { 'nvim-lspconfig', 'nvim-dap', 'nvim-dap-ui', 'nvim-treesitter' },
  --  config = function()
  --    require("godotdev").setup({
  --      autostart_editor_server = true
  --    })
  --  end
  --},
}
