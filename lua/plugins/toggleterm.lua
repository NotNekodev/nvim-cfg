return {
	"akinsho/toggleterm.nvim",
	config = function ()
		require('toggleterm').setup{
			autoscroll = true,
			direction = 'float'
		}
	end
}
