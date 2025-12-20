return {
  'mfussenegger/nvim-dap',
  config = function()
    local dap = require('dap')

    -- set up adapter
    dap.adapters.delve = {
      type = 'server',
      port = 10025,

      executable = {
        command = 'dlv',
        args = { 'dap', '--listen', '127.0.0.1:10025' },
      }
    }

    dap.configurations.go = {
      {
        type = 'delve',
        request = 'launch',
        name = 'Launch go program',
        program = '${file}'
      }
    }

    dap.adapters.coreclr = {
      type = 'executable',
      command = '/home/cynthia/.local/bin/netcoredbg',
      args = { '--interpreter=vscode' }
    }

    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
          return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
        end,
      },
    }
  end
}
