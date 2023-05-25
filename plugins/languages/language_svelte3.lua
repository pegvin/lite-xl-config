-- mod-version:3
local syntax = require "core.syntax"

syntax.add {
	name = "Svelte3",
	files = { "%.svelte?$" },
	block_comment = { "<!--", "-->" },
	patterns = {
		{ pattern = { "<!%-%-", "%-%->" },     type = "comment"  },
		{ pattern = { '"', '"', '\\' },        type = "string"   },
		{ pattern = { "'", "'", '\\' },        type = "string"   },
		{ pattern = { '%f[^>][^<]', '%f[<]' }, type = "normal"   },
		{ pattern = "0x[%da-fA-F]+",           type = "number"   },
		{ pattern = "-?%d+[%d%.]*f?",          type = "number"   },
		{ pattern = "-?%.?%d+f?",              type = "number"   },
		{ pattern = "%f[^<]![%a_][%w_]*",      type = "keyword2" },
		{ pattern = "%f[^<][%a_][%w_]*",       type = "function" },
		{ pattern = "%f[^<]/[%a_][%w_]*",      type = "function" },
		{ pattern = "[%a_][%w_]*",             type = "keyword"  },
		{ pattern = "[/<>=]",                  type = "operator" },
		{
			pattern = { "<%s*[sS][cC][rR][iI][pP][tT]%f[%s>].- lang=\"ts\"%f[%s>].->", "<%s*/%s*[sS][cC][rR][iI][pP][tT]%s*>" },
			syntax = ".ts",
			type = "function"
		},
		{
			pattern = { "<%s*[sS][cC][rR][iI][pP][tT]%f[%s>].->", "<%s*/%s*[sS][cC][rR][iI][pP][tT]%s*>" },
			syntax = ".js",
			type = "function"
		},
		{
			pattern = { "<%s*[sS][tT][yY][lL][eE]%f[%s>].- type=\"text/scss\"%f[%s>].->", "<%s*/%s*[sS][tT][yY][lL][eE]%s*>" },
			syntax = ".scss",
			type = "function"
		},
		{
			pattern = { "<%s*[sS][tT][yY][lL][eE]%f[%s>].- type=\"text/sass\"%f[%s>].->", "<%s*/%s*[sS][tT][yY][lL][eE]%s*>" },
			syntax = ".sass",
			type = "function"
		},
		{
			pattern = {
				"<%s*[sS][tT][yY][lL][eE]%f[%s>].->",
				"<%s*/%s*[sS][tT][yY][lL][eE]%s*>"
			},
			syntax = ".css",
			type = "function"
		},
	},
	symbols = {},
}

