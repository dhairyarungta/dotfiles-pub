return {
  "nvim-telescope/telescope.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")
    
    telescope.setup({
      defaults = {
        -- path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })
    
    telescope.load_extension("fzf")
    
    local keymap = vim.keymap
    
    -- File navigation
    keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
    keymap.set("n", "<leader>fd", builtin.lsp_document_symbols, { desc = "Find document symbols" })
    keymap.set("n", "<leader>fw", builtin.lsp_workspace_symbols, { desc = "Find workspace symbols" })
    keymap.set("n", "<C-q>", builtin.git_files, { desc = "Find git ls-files, respects .gitignore" })
    
    -- Git branch management
    keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git branches picker" })
    keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git commits picker" })
    keymap.set("n", "<leader>gC", builtin.git_bcommits, { desc = "Git buffer commits picker" })
    keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git status picker" })
    keymap.set("n", "<leader>gS", builtin.git_stash, { desc = "Git stash picker" })
  end,
}
