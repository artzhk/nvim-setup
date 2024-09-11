local M = {}

M.cmd = { "vue-language-server", "--stdio" }
M.filetypes = { "typescript", "javascript", "vue", "json" }

M.init_options = {
	vue = {
		hybridMode = false,
	},
	typescript = {
		tsdk = "/Users/artem/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib/tsserverlibrary",
	},
	languageFeatures = {
		references = true,
		definition = true,
		typeDefinition = true,
		callHierarchy = true,
		hover = true,
		rename = true,
		renameFileRefactoring = true,
		signatureHelp = true,
		codeAction = true,
		workspaceSymbol = true,
		completion = {
			defaultTagNameCase = "both",
			defaultAttrNameCase = "kebabCase",
			getDocumentNameCasesRequest = false,
			getDocumentSelectionRequest = false,
		},
		schemaRequestService = true,
		diagnostics = true,
	},
	documentFeatures = {
		selectionRange = true,
		foldingRange = true,
		linkedEditingRange = true,
		documentSymbol = true,
		documentColor = true,
		documentFormatting = {
			defaultPrintWidth = 100,
		},
	},
}

return M
