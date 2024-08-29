--plugin

return {
	{
		'norcalli/nvim-colorizer.lua'
	},
  	-- bufferline
	{
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
	--HOP
	{
    	'smoka7/hop.nvim',
    	version = "*",
    	opts = {
        	keys = 'etovxqpdygfblzhckisuran'
    	}
	},
	--LUALINE
	{
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
	-- Telescope (Fuzzy Finder)
    {
        'nvim-telescope/telescope.nvim',
        lazy = true,
        dependencies = {
            {'nvim-lua/plenary.nvim'},
        }
    },
	-- Alpha (Dashboard)
    {
		'goolord/alpha-nvim',
		lazy = true,
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function ()
			require'alpha'.setup(require'alpha.themes.startify'.config)
		end
    },
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
    },
	--indentscope
	{
		'echasnovski/mini.indentscope', version = '*' 
	},
	-- Nvimtree (File Explorer)
    {
        'nvim-tree/nvim-tree.lua',
		lazy = true,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
    },
	--Mini.Clue
	{
		{ 'echasnovski/mini.clue', version = '*' },
	},
	{
    	'windwp/nvim-autopairs',
    	event = "InsertEnter",
    	opts = {}
	},
	--LSP, CMP, SNIP
	{
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
			{ 'onsails/lspkind-nvim'},
			{'ray-x/lsp_signature.nvim'},
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional

            -- snippets
			{'hrsh7th/vim-vsnip'},
        }
    },
	--ADD PLUGINS HERE
}

