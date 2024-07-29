--plugins

return {
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
	{
		{ 'echasnovski/mini.clue', version = '*' },
	},
	--ADD PLUGINS HERE
}

