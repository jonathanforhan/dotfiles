return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      { "mfussenegger/nvim-dap" },
      { "nvim-neotest/nvim-nio" }
    },
    init = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dap.adapters.cppdbg = {
        id = "cppdbg",
        type = "executable",
        command = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/OpenDebugAD7"
      }

      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "cppdbg",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopAtEntry = true,
          args = function()
            local args = {}
            local str = vim.fn.input("Program args: ", "", "file")

            for arg in str:gmatch("%S+") do
              table.insert(args, arg)
            end
            return args
          end
        }
      }

      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp

      local function dap_start()
        dapui.setup()
        dap.continue()
        dapui.open()
      end

      local function dap_quit()
        dap.terminate()
        dapui.close()
      end

      local function conditional_breakpoint()
        vim.ui.input({ prompt = "Condition: " }, function(condition)
          if condition then
            dap.set_breakpoint(condition)
          end
        end)
      end

      vim.keymap.set("n", "<LEADER>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<LEADER>dd", dap_start, { desc = "Start Debugging" })
      vim.keymap.set("n", "<LEADER>dq", dap_quit, { desc = "Quit Session" })
      vim.keymap.set("n", "<LEADER>dr", dap.run_to_cursor, { desc = "Run to Cursor" })
      vim.keymap.set("n", "<LEADER>dB", dap.clear_breakpoints, { desc = "Clear Breakpoints" })
      vim.keymap.set("n", "<LEADER>dC", conditional_breakpoint, { desc = "Conditional Breakpoint" })
      vim.keymap.set("n", "<LEADER>dR", dap.restart_frame, { desc = "Restart Frame" })
    end
  }
}
