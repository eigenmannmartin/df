local options = {
	lsp_fallback = true,
	formatters_by_ft = {
		["lua"] = { "stylua" },
		["python"] = { "black" },
    ["go"] = { "goimports", "gofmt" },
		["javascript"] = { "prettier" },
		["javascriptreact"] = { "prettier" },
		["typescript"] = { "prettier" },
		["typescriptreact"] = { "prettier" },
		["vue"] = { "prettier" },
		["css"] = { "prettier" },
		["scss"] = { "prettier" },
		["less"] = { "prettier" },
		["html"] = { "prettier" },
		["json"] = { "prettier" },
		["jsonc"] = { "prettier" },
		["yaml"] = { "prettier" },
		["markdown"] = { "prettier" },
		["markdown.mdx"] = { "prettier" },
		["graphql"] = { "prettier" },
		["handlebars"] = { "prettier" },
	},
}

require("conform").setup(options)
