--plugins

return {
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
	}
	--ADD PLUGINS HERE
}

