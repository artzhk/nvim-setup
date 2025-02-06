local M = {}

M.filetypes = {
	"javascript",
	"typescript",
	"typescriptreact",
	"javascriptreact",
	"vue",
}

function M.init_options(volar)
	assert(type(volar) == "boolean", "volar parameter has to be a boolean")
	if volar == true then
		return {
			plugins = {
				name = "@vue/typescript-plugin",
				location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
				languages = { "javascript", "typescript", "vue" },
			},
		}
	end

	return {
		plugins = {},
	}
end

return M
