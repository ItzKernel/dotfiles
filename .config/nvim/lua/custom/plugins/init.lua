-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'norcalli/nvim-colorizer.lua' },
  {
    'chocycat/reitti.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    event = 'VeryLazy',
    cmd = { 'WorkspaceAdd', 'WorkspaceRemove', 'WorkspaceList', 'WorkspaceRestore', 'WorkspaceSave' },
    keys = {
      {
        '<leader>wA',
        function()
          require('reitti').add_workspace(nil, nil)
        end,
        { desc = 'Add current directory to workspaces' },
      },
      {
        '<leader>wp',
        function()
          require('reitti.telescope').pick()
        end,
        { desc = 'Open workspace picker' },
      },
    },
    opts = {},
  },
}
