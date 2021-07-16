require'nvim-treesitter.configs'.setup {
    ensure_installed = {'java', 'javascript', 'typescript', 'elixir'},
    highlight = {
        enable = true,              -- false will disable the whole extension
    },
}

require'nvim-treesitter.configs'.setup {
    playground = {
        enable = true,
        disable = {},
        updateTime = 25,
        persist_queries = false
    }
}

-- TELESCOPE
require('telescope').setup{
    defaults = {
        mappings = {
        }
    }
}

require('telescope').load_extension('coc')
-- require('telescope').load_extension('fzf')

-- BUFFERLINE
--require('bufferline').setup{}

require('todo-comments').setup {}

require('trouble').setup{}

require('which-key').setup{}

--require('lualine').setup {}

local mappings = {}

mappings.curr_buffer = function()
    local opts = require('telescope.themes').get_ivy({
            layout_config={
                height=10
            },
            --previewer=false,
            --winblend=10
        })
    require('telescope.builtin').current_buffer_fuzzy_find(opts)
end

mappings.find_files = function()
    local opts = require('telescope.themes').get_ivy({
            layout_config={
                height=10
            }
        })
    require('telescope.builtin').find_files(opts)
end

mappings.document_symbols = function()
    local opts = require('telescope.themes').get_dropdown({
            layout_config={
                height=10
            },
            previewer=false
        })
    require('telescope').load_extension('coc').document_symbols(opts)
end

return mappings
