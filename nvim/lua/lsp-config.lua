local lsp = require('lsp-zero')
local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')

lsp.preset('recommended')

-- Function to create parameter snippets
local function create_param_snippets(params)
	local snippets = {}
	for i, param in ipairs(params) do
		table.insert(snippets, string.format("${%d:%s}", i, param.name))
	end
	return table.concat(snippets, ', ')
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	mapping = cmp.mapping.preset.insert({
		-- Disable default Tab behavior
		-- Use Enter to trigger completion menu interaction
		['<CR>'] = cmp.mapping({
			i = function(fallback)
				if cmp.visible() then
					cmp.confirm({ select = true })
				else
					fallback()
				end
			end,
		}),

		-- Custom mapping to enter completion menu
		['<C-Space>'] = cmp.mapping(function(fallback)
			if not cmp.visible() then
				cmp.complete()
			else
				cmp.close()
			end
		end, { 'i', 's' }),

		-- Navigate through menu with Tab once it's open
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { 'i', 's' }),
	}),

	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
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
				luasnip = "[LuaSnip]",
			},
		})
	},
})

-- Function to add parameter snippets for function completions
local function add_param_snippets(completion)
	if completion.kind == cmp.lsp.CompletionItemKind.Function then
		local params = vim.lsp.util.parse_snippet(completion.labelDetails.detail or '')
		if #params > 0 then
			completion.insertText = completion.label .. '(' .. create_param_snippets(params) .. ')${0}'
			completion.insertTextFormat = cmp.lsp.InsertTextFormat.Snippet
		else
			completion.insertText = completion.label .. '()${0}'
			completion.insertTextFormat = cmp.lsp.InsertTextFormat.Snippet
		end
	end
	return completion
end

-- Override the completion handler
local orig_complete_item = cmp.core.complete_item
cmp.core.complete_item = function(self, ...)
	local completion = orig_complete_item(self, ...)
	if completion then
		return add_param_snippets(completion)
	end
	return completion
end

-- Setup lspconfig
local capabilities = require('cmp_nvim_lsp').default_capabilities()
lsp.setup()

-- Enable LSP signature help
require('lsp_signature').setup({
	bind = true,
	handler_opts = {
		border = "rounded"
	}
})
