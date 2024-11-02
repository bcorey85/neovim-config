
return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        -- REQUIRED
        harpoon:setup()
        -- REQUIRED

        -- Keymap to add a file to Harpoon
        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end)

        -- Basic Telescope configuration
        local conf = require("telescope.config").values
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

        -- Keymap to toggle the Telescope picker for Harpoon
        vim.keymap.set("n", "<C-s>", function() toggle_telescope(harpoon:list()) end,
            { desc = "Open harpoon window" })

        -- Select specific files from Harpoon
        vim.keymap.set("n", "<C-n>", function()
            harpoon:list():select(1)
        end)
        vim.keymap.set("n", "<C-e>", function()
            harpoon:list():select(2)
        end)
        vim.keymap.set("n", "<C-i>", function()
            harpoon:list():select(3)
        end)
        vim.keymap.set("n", "<C-o>", function()
            harpoon:list():select(4)
        end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-S-P>", function()
            harpoon:list():prev()
        end)
        vim.keymap.set("n", "<C-S-N>", function()
            harpoon:list():next()
        end)
    end,
}
