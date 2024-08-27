local lsp = require('lsp-zero')
local cmp = require('cmp')
local lspkind = require('lspkind')
local types = require('cmp.types')

lsp.preset('recommended')

-- Function to create parameter placeholders
local function create_param_placeholders(params)
    local placeholders = {}
    for i, param in ipairs(params) do
        table.insert(placeholders, string.format("${%d:%s}", i, param.label))
    end
    return table.concat(placeholders, ', ')
end

-- Function to check if cursor is within function arguments
local function cursor_in_function_args()
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local before_cursor = line:sub(1, col)
    local after_cursor = line:sub(col + 1)
    return before_cursor:match("%(.*$") and after_cursor:match("^.*%)")
end

-- Function to move to next/previous parameter
local function jump_to_placeholder(direction)
    local jump_cmd = direction == 'next' and [[<C-j>]] or [[<C-k>]]
    return vim.api.nvim_replace_termcodes(jump_cmd, true, true, true)
end

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif cursor_in_function_args() then
                vim.fn.feedkeys(jump_to_placeholder('next'), '')
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif cursor_in_function_args() then
                vim.fn.feedkeys(jump_to_placeholder('prev'), '')
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    }, {
        { name = 'buffer' },
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
            menu = {
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                vsnip = "[VSnip]",
            },
        })
    },
    window = {
        completion = cmp.config.window.bordered({
            side_padding = 1,
            winhighlight = "Normal:Normal,CursorLine:PmenuSel,Search:None",
            scrollbar = false,
            col_offset = -3,
            side = 'right',
        }),
    },
})

-- Override the completion handler to insert function signatures
local orig_complete_item = cmp.core.complete_item
cmp.core.complete_item = function(self, ...)
    local item = orig_complete_item(self, ...)
    if item and item.kind == types.lsp.CompletionItemKind.Function then
        local params = vim.lsp.util.parse_snippet(item.labelDetails.detail or '')
        if #params > 0 then
            item.insertText = item.label .. '(' .. create_param_placeholders(params) .. ')${0}'
            item.insertTextFormat = types.lsp.InsertTextFormat.Snippet
        else
            item.insertText = item.label .. '()${0}'
            item.insertTextFormat = types.lsp.InsertTextFormat.Snippet
        end
    end
    return item
end

-- Setup lspconfig
local capabilities = require('cmp_nvim_lsp').default_capabilities()
lsp.setup()

-- Enable LSP signature help
require('lsp_signature').setup({
    bind = true,
    handler_opts = {
        border = "rounded"
    },
    hint_enable = false,  -- Disable the hint as we're handling placeholders ourselves
})

-- Set up custom keybindings for vsnip
vim.api.nvim_set_keymap('i', '<C-j>', [[<Plug>(vsnip-jump-next)]], {silent = true})
vim.api.nvim_set_keymap('s', '<C-j>', [[<Plug>(vsnip-jump-next)]], {silent = true})
vim.api.nvim_set_keymap('i', '<C-k>', [[<Plug>(vsnip-jump-prev)]], {silent = true})
vim.api.nvim_set_keymap('s', '<C-k>', [[<Plug>(vsnip-jump-prev)]], {silent = true})
