return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  commit = "e76cb03",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    
    -- REQUIRED
    harpoon:setup({
          settings = {
        save_on_toggle = false,
        sync_on_ui_close = true,
        key = function()
            return vim.loop.cwd()
        end,
      },
    })
    
    -- REQUIRED
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    
    vim.keymap.set("n", "<C-g>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<C-d>", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<C-s>", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<C-a>", function() harpoon:list():select(4) end)
    
    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>hj", function() harpoon:list():prev() end, 
      { desc = "Go to previous harpoon file" })
    vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end, 
      { desc = "Go to next harpoon file" })

    vim.keymap.set("n", "<leader>hx", function() harpoon:list():remove(selected_entry) end, 
      { desc = "Remove current file from harpoon" })
    vim.keymap.set("n", "<leader>hc", function() harpoon:list():clear() end, 
      { desc = "Clear all harpoon files" })

     vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

      -- basic telescope configuration
--    local conf = require("telescope.config").values
--    local function toggle_telescope(harpoon_files)
--        local file_paths = {}
--        for _, item in ipairs(harpoon_files.items) do
--            table.insert(file_paths, item.value)
--        end
--
--        require("telescope.pickers").new({}, {
--            prompt_title = "Harpoon",
--            finder = require("telescope.finders").new_table({
--                results = file_paths,
--            }),
--            previewer = conf.file_previewer({}),
--            sorter = conf.generic_sorter({}),
--        }):find()
--    end
--
--    vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
--        { desc = "Open harpoon window" })

    harpoon:extend({
      UI_CREATE = function(cx)
        vim.keymap.set("n", "<C-v>", function()
          harpoon.ui:select_menu_item({ vsplit = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "<C-x>", function()
          harpoon.ui:select_menu_item({ split = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "<C-t>", function()
          harpoon.ui:select_menu_item({ tabedit = true })
        end, { buffer = cx.bufnr })

        -- Add Ctrl+C to close the harpoon menu
        vim.keymap.set("n", "<C-c>", function()
          vim.cmd("q")
        end, { buffer = cx.bufnr })
      end,
    })
  end,
}
