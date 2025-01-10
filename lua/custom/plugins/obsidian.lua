return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = 'Obsidian Vault',
        path = '~/Documents/Obsidian Vault',
      },
    },

    notes_subdir = '01_Inbox',

    daily_notes = {
      folder = '03_Daily',
    },

    attachments = {
      img_folder = '02_Assets',
    },
  },

  keys = {
    {
      '<leader>ot',
      function()
        local offset = vim.fn.input 'Enter offset (in days): '
        if offset ~= '' then
          vim.api.nvim_command('ObsidianToday' .. offset)
        else
          vim.api.nvim_command 'ObsidianToday'
        end
      end,
      desc = 'Open daily note',
      --{ noremap = true, silent = true, desc = 'Open daily note' },
    },
    {
      '<leader>of',
      '<cmd>ObsidianFollowLink<CR>',
      desc = 'Follow link under cursor',
    },
    {
      '<leader>os',
      function()
        local query = vim.fn.input 'Enter query: '
        if query ~= '' then
          vim.api.nvim_command('ObsidianSearch ' .. query)
        else
          vim.api.nvim_command 'ObsidianSearch'
        end
      end,
      desc = 'Search notes',
    },
  },
}
