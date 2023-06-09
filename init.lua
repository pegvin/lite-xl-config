local core = require "core"
local keymap = require "core.keymap"
local config = require "core.config"
local style = require "core.style"
local command = require "core.command"
local lspconfig = require "plugins.lsp.config"

------------------------------ Themes ----------------------------------------

-- light theme:
core.reload_module("colors.jb-fleet")

--------------------------- Key bindings -------------------------------------

-- Scroll Using Alt + Up/Down Arrow
keymap.add({ ["ctrl+up"] = function() command.perform("root:scroll", 1) end }, true)
keymap.add({ ["ctrl+down"] = function() command.perform("root:scroll", -1) end }, true)

-- Move Lines Up/Down Using Ctrl + Up/Down Arrow
keymap.add({ ["ctrl+shift+up"] = "doc:move-lines-up" }, true)
keymap.add({ ["ctrl+shift+down"] = "doc:move-lines-down" }, true)

-- Create Multiple Cursors Using Ctrl + Alt + Up/Down Arrow
keymap.add({ ["ctrl+alt+up"] = "doc:create-cursor-previous-line" }, true)
keymap.add({ ["ctrl+alt+down"] = "doc:create-cursor-next-line" }, true)

------------------------------ Plugins ----------------------------------------

config.plugins.detectindent = true
config.plugins.trimwhitespace = false
config.plugins.restore_sidebar_width = true
config.plugins.indentguide.highlightActiveScope = false

------------------------------ LSP ----------------------------------------
lspconfig.clangd.setup()
config.plugins.lsp.mouse_hover = true
config.plugins.lsp.show_diagnostics = true
config.plugins.lsp.stop_unneeded_servers = true
config.plugins.lsp.mouse_hover_delay = 100
config.plugins.lsp.more_yielding = false

command.perform("evergreen:toggle-highlighting", true);

-- Font Preview Plugin
config.plugins.fontpreview.size = 34
config.plugins.fontpreview.enabled = true
config.plugins.fontpreview.editable = false
config.plugins.fontpreview.default_text = { "The quick brown fox jumped over the lazy dog!" }

------------------------------- Fonts ----------------------------------------

-- customize fonts:
style.font = renderer.font.load(USERDIR .. "/fonts/CascadiaMono.ttf", 18 * SCALE)
style.code_font = renderer.font.load(USERDIR .. "/fonts/CascadiaMono.ttf", 24 * SCALE)
--
-- DATADIR is the location of the installed Lite XL Lua code, default color
-- schemes and fonts.
-- USERDIR is the location of the Lite XL configuration directory.
--
-- font names used by lite:
-- style.font          : user interface
-- style.big_font      : big text in welcome screen
-- style.icon_font     : icons
-- style.icon_big_font : toolbar icons
-- style.code_font     : code
--
-- the function to load the font accept a 3rd optional argument like:
--
-- {antialiasing="grayscale", hinting="full", bold=true, italic=true, underline=true, smoothing=true, strikethrough=true}
--
-- possible values are:
-- antialiasing: grayscale, subpixel
-- hinting: none, slight, full
-- bold: true, false
-- italic: true, false
-- underline: true, false
-- smoothing: true, false
-- strikethrough: true, false

---------------------------- Miscellaneous -------------------------------------

-- modify list of files to ignore when indexing the project:
config.ignore_files = {
	-- folders
	"^%.svn/",        "^%.git/",   "^%.hg/",        "^CVS/", "^%.Trash/", "^%.Trash%-.*/",
	"^node_modules/", "^%.cache/", "^__pycache__/",
	-- files
	"%.pyc$",         "%.pyo$",       "%.exe$",        "%.dll$",   "%.obj$", "%.o$",
	"%.a$",           "%.lib$",       "%.so$",         "%.dylib$", "%.ncb$", "%.sdf$",
	"%.suo$",         "%.pdb$",       "%.idb$",        "%.class$", "%.psd$", "%.db$",
	"^desktop%.ini$", "^%.DS_Store$", "^%.directory$",
	"%.d$" -- .d files generated by c/c++ compilers for makefile, might need to comment this to see the d-lang files
}

