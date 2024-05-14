return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      { "mfussenegger/nvim-dap" },
      { "nvim-neotest/nvim-nio" }
    },
    init = function()
      local dap = require("dap")

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
    end
  }
}
