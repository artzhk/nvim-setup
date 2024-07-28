return {
	"OmniSharp/Omnisharp-vim",
	dependencies = { "nickspoons/vim-sharpenup" },
  config = function ()
    vim.g.OmniSharp_highlighting = 0
  end
}
