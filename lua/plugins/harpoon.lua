-- basic telescope configuration
local conf = require("telescope.config").values
local themes = require("telescope.themes")

local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

return{

    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
        local harpoon = require("harpoon")
        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add file" })
        vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })
        vim.keymap.set("n", "<leader>fm", function() toggle_telescope(harpoon:list()) end,
            { desc = "Open harpoon window" })
        -- Toggle previous & next buffers stored within Harpoon list  -- Direct file jumps
        vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
        vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end)

        end
}

