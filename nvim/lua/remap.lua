local builtin = require("telescope.builtin")

local prefixed = {
  mode = "n",
  prefix = "<LEADER>",
  ["<SPACE>"] = {
    function()
      vim.cmd("bel sp | term")
      vim.api.nvim_feedkeys("A", "n", false)
    end,
    "Open Terminal in Split"
  },
  d = {
    name = "Debugger",
    b = { function() require("dap").toggle_breakpoint() end, "Toggle Breakpoint" },
    d = {
      function()
        require("dapui").setup()
        require("dap").continue()
        require("dapui").open()
      end, "Start Debugging"
    },
    q = {
      function()
        require("dap").terminate()
        require("dapui").close()
      end,
      "Quit Session"
    },
    r = { function() require("dap").run_to_cursor() end, "Run to Cursor" },
    B = { function() require("dap").clear_breakpoints() end, "Clear Breakpoints" },
    C = {
      function()
        vim.ui.input({ prompt = "Condition: " }, function(condition)
          if condition then
            require("dap").set_breakpoint(condition)
          end
        end)
      end,
      "Conditional Breakpoint"
    },
    R = { function() require("dap").restart_frame() end, "Restart Frame" }
  },
  f = {
    name = "Files",
    b = { builtin.buffers, "Find Buffers" },
    f = { builtin.find_files, "Find Files" },
    g = { builtin.find_files, "Find Git Files" },
    s = { builtin.live_grep, "Grep" },
    F = {
      function()
        builtin.find_files({
          search_dirs = {
            vim.fn.input("Directory: ", "", "file")
          }
        })
      end,
      "Find Files with Path"
    },
    S = {
      function()
        builtin.live_grep({
          search_dirs = {
            vim.fn.input("Directory: ", "", "file")
          }
        })
      end,
      "Grep with Path"
    }
  },
  g = {
    name = "Git",
    p = { ":GitGutterPreviewHunk<CR>", "Preview Hunk" },
    u = { ":GitGutterUndoHunk<CR>", "Undo Hunk" },
    d = { ":GitGutterDiffOrig<CR>", "Diff" }
  },
  h = { ":HopWord<CR>", "Hop Word" },
  l = {
    name = "LSP",
    a = { vim.lsp.buf.code_action, "Code Action" },
    r = { vim.lsp.buf.rename, "Rename" }
  },
  u = {
    ":Lazy update<CR>:MasonUpdate<CR>:TSUpdate<CR>",
    "Update"
  },
  x = {
    name = "C++",
    h = {
      ":ClangdSwitchSourceHeader<CR>",
      "Switch Source-Header"
    },
    m = {
      ":TSCppDefineClassFunc<CR>:ClangdSwitchSourceHeader<CR>",
      "Define Method"
    },
    M = {
      ":TSCppDefineClassFunc<CR>",
      "Define Method Inline"
    }
  }
}

local normal = {
  mode = "n",
  ["<C-h>"] = { "<C-w>h", "Window Left" },
  ["<C-j>"] = { "<C-w>j", "Window Down" },
  ["<C-k>"] = { "<C-w>k", "Window Up" },
  ["<C-l>"] = { "<C-w>l", "Window Right" },
  ["<LEADER>p"] = { ":b#<CR>", "Previous Buffer" },
  g = {
    name = "LSP",
    d = { vim.lsp.buf.definition, "Definition" },
    i = { vim.lsp.buf.implementation, "Implementation" },
    l = { vim.diagnostic.open_float, "Floating Diagnostic" },
    o = { vim.lsp.buf.type_definition, "Type Definition" },
    r = { vim.lsp.buf.references, "References" },
    s = { vim.lsp.buf.signature_help, "Signature" },
    D = { vim.lsp.buf.declaration, "Declaration" }
  },
  K = { vim.lsp.buf.hover, "Info Hover" },
  Q = { "<NOP>" }
}

local visual = {
  mode = "v",
  s = { ":sort<CR>", "Sort Alphabetically" },
  x = {
    name = "C++",
    m = {
      ":TSCppDefineClassFunc<CR>:ClangdSwitchSourceHeader<CR>",
      "Define Method"
    },
    M = {
      ":TSCppDefineClassFunc<CR>",
      "Define Method Inline"
    }
  }
}

vim.keymap.set("t", "<ESC>", "<C-\\><C-n>:bd!<CR>")

require("which-key").register(prefixed)
require("which-key").register(normal)
require("which-key").register(visual)
