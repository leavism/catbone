local lush = require("lush")
local hsl = lush.hsl
local hsluv = lush.hsluv
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	local pink = hsl(316, 72, 86)
	local red = hsl(343, 81, 75)
	local maroon = hsl(350, 65, 77)
	local peach = hsl(23, 92, 75)
	local yellow = hsl(41, 86, 83)
	local green = hsl(115, 54, 76)
	local sapphire = hsl(199, 76, 69)
	local blue = hsl(217, 92, 76)
	local lavender = hsl(232, 97, 85)

	local text = hsl(226, 64, 88)
	local subtext1 = hsl(227, 35, 80)
	local subtext0 = hsl(228, 24, 72)
	local overlay2 = hsl(228, 17, 64)
	local overlay0 = hsl(231, 11, 47)
	local base = hsl(240, 21, 15)
	local mantle = hsl(240, 21, 12)
	local crust = hsl(240, 23, 9)

	local surface1 = hsl(234, 13, 31)
	local surface0 = hsl(237, 16, 23)

	return {
		Normal({ fg = text, bg = base }),

		-- UI Elements
		EndOfBuffer({ fg = surface1 }),
		NonText({ fg = surface1 }),
		Whitespace({ fg = surface1 }),
		SpecialKey({ fg = surface1, gui = "italic" }),

		-- Comments (base definition)
		Comment({ fg = Normal.bg.de(25).li(35).ro(-15), gui = "italic" }),

		-- Line numbers and signs
		LineNr({ fg = Comment.fg }),
		LineNrAbove({ LineNr }),
		LineNrBelow({ LineNr }),
		SignColumn({ fg = surface1 }),
		CursorLineNr({ fg = subtext1, gui = "bold" }),

		-- Status and UI
		StatusLine({ fg = text, bg = mantle }),
		StatusLineNC({ fg = surface1, bg = mantle }),
		WinSeparator({ fg = crust }),
		VertSplit({ fg = crust }),
		TabLine({ fg = overlay0, bg = crust }),
		TabLineFill({ bg = mantle }),
		TabLineSel({ gui = "bold" }),

		-- Cursor and selection
		Cursor({ fg = base, bg = red }),
		TermCursor({ Cursor }),
		CursorIM({ Cursor }),
		CursorLine({ bg = Normal.bg.lighten(10) }),
		CursorColumn({ bg = CursorLine.bg }),
		Visual({ bg = surface1, fg = text, gui = "bold" }),
		VisualNOS({ Visual }),

		-- Search
		Search({ fg = mantle, bg = blue }),
		IncSearch({ fg = mantle, bg = sapphire, gui = "bold" }),
		CurSearch({ fg = mantle, bg = green }),

		-- Base syntax groups that will be linked to TreeSitter
		Statement({ fg = subtext0.de(40) }),
		Conditional({ Statement }),
		Repeat({ Statement }),
		Operator({ Statement }),
		Exception({ Statement }),
		Label({ Statement }),
		Keyword({ Statement }),

		-- Types
		Type({ fg = text }),
		StorageClass({ fg = blue }),
		Structure({ fg = blue }), -- struct, union, enum, etc.
		Typedef({ fg = blue }), -- A typedef

		-- Constants and literals
		Constant({ fg = overlay2, gui = "italic" }),
		Character({ Constant }),
		Number({ fg = overlay2 }),
		Float({ Number }),
		Boolean({ gui = "italic" }),

		-- Strings
		String({ fg = maroon, gui = "italic" }),

		-- Functions and identifiers
		Function({ fg = "#cdd6f4" }),
		Identifier({ fg = "#cdd6f4" }),

		-- Preprocessor
		PreProc({ gui = "bold" }),
		Include({ PreProc }),
		Define({ PreProc }),
		Macro({ PreProc }),
		PreCondit({ PreProc }),

		-- Special
		Special({ gui = "bold" }),
		SpecialChar({ Special }),
		Tag({ Special }),
		Delimiter({ fg = overlay2 }),
		SpecialComment({ fg = overlay0 }),
		Debug({ Special }),

		-- Errors and diagnostics
		Error({ fg = red }),
		ErrorMsg({ Error }),
		WarningMsg({ fg = peach }),

		-- Diagnostics
		DiagnosticError({ fg = red }),
		DiagnosticWarn({ fg = peach }),
		DiagnosticInfo({ fg = yellow }),
		DiagnosticHint({ fg = pink }),
		DiagnosticOk({ fg = green }),
		DiagnosticUnnecessary({ fg = peach }),

		-- Virtual text
		DiagnosticVirtualTextError({ fg = red, bg = "#32283a" }),
		DiagnosticVirtualTextWarn({ fg = peach, bg = "#33313a" }),
		DiagnosticVirtualTextInfo({ fg = yellow, bg = "#283040" }),
		DiagnosticVirtualTextHint({ fg = pink, bg = "#29313e" }),

		-- Underlines
		DiagnosticUnderlineError({ gui = "undercurl", sp = red }),
		DiagnosticUnderlineWarn({ gui = "undercurl", sp = peach }),
		DiagnosticUnderlineInfo({ gui = "undercurl", sp = yellow }),
		DiagnosticUnderlineHint({ gui = "undercurl", sp = green }),

		-- Diff colors
		DiffAdd({ bg = "#364143" }),
		DiffChange({ bg = "#25293c" }),
		DiffDelete({ bg = "#443244" }),
		DiffText({ fg = "#cdd6f4", bg = "#3e4b6b" }),

		-- Popup menus
		Pmenu({ fg = overlay2, bg = mantle }),
		PmenuSel({ gui = "bold", bg = surface0 }),
		PmenuSbar({ bg = surface0 }),
		PmenuThumb({ bg = overlay0 }),
		NormalFloat({ fg = text, bg = mantle }),
		FloatBorder({ fg = blue, bg = mantle }),

		-- TreeSitter groups linked to base syntax groups
		-- Variables
		sym("@variable")({ Identifier }),
		sym("@variable.builtin")({ gui = "italic" }),
		sym("@variable.parameter")({ Identifier }),
		sym("@variable.member")({ Identifier }),

		-- Constants
		sym("@constant")({ Constant }),
		sym("@constant.builtin")({ Boolean }),
		sym("@constant.macro")({ Special }),

		-- Modules and strings
		sym("@module")({ gui = "italic" }),
		sym("@string")({ String }),
		sym("@string.escape")({ Special }),
		sym("@string.regexp")({ String }),

		-- Characters and numbers
		sym("@character")({ Character }),
		sym("@number")({ Number }),
		sym("@boolean")({ Boolean }),

		-- Functions
		sym("@function")({ Function }),
		sym("@function.builtin")({ Special }),
		sym("@function.macro")({ PreProc }),
		sym("@constructor")({ Special }),

		-- Keywords - all link to base keyword groups
		sym("@keyword")({ Keyword }),
		sym("@keyword.conditional")({ Conditional }),
		sym("@keyword.repeat")({ Repeat }),
		sym("@keyword.return")({ Keyword }),
		sym("@keyword.exception")({ Exception }),
		sym("@keyword.operator")({ Operator }),
		sym("@keyword.function")({ Keyword }),

		-- Operators and punctuation
		sym("@operator")({ Operator }),
		sym("@punctuation")({ fg = "#9399b2" }),
		sym("@punctuation.delimiter")({ Delimiter }),
		sym("@punctuation.bracket")({ fg = "#9399b2" }),
		sym("@punctuation.special")({ Special }),

		-- Comments - link to base Comment
		sym("@comment")({ Comment }),
		sym("@comment.documentation")({ Comment }),
		sym("@comment.error")({ fg = "#1e1e2e", bg = "#f38ba8" }),
		sym("@comment.warning")({ fg = "#1e1e2e", bg = "#f9e2af" }),
		sym("@comment.note")({ fg = "#1e1e2e", bg = "#89b4fa" }),
		sym("@comment.todo")({ fg = "#1e1e2e", bg = "#f2cdcd" }),

		-- Types
		sym("@type")({ Type }),
		sym("@type.builtin")({ Type }),
		sym("@type.qualifier")({ StorageClass }),

		-- Properties and attributes
		sym("@property")({ Identifier }),
		sym("@attribute")({ PreProc }),
		sym("@label")({ Label }),

		-- Markup
		sym("@markup")({ fg = "#cdd6f4" }),
		sym("@markup.strong")({ gui = "bold" }),
		sym("@markup.italic")({ gui = "italic" }),
		sym("@markup.strikethrough")({ gui = "strikethrough" }),
		sym("@markup.underline")({ gui = "underline" }),
		sym("@markup.heading")({ gui = "bold" }),
		sym("@markup.link")({ gui = "underline" }),
		sym("@markup.link.url")({ gui = "underline,italic" }),
		sym("@markup.raw")({ gui = "italic" }),
		sym("@markup.math")({ gui = "italic" }),
		sym("@markup.quote")({ gui = "italic" }),

		-- Tags
		sym("@tag")({ Tag }),
		sym("@tag.builtin")({ Special }),
		sym("@tag.attribute")({ gui = "italic" }),
		sym("@tag.delimiter")({ Delimiter }),

		-- Rest of the configuration remains the same...
		Folded({ fg = "#89b4fa", bg = "#45475a" }),
		FoldColumn({ fg = "#6c7086" }),

		SpellBad({ gui = "undercurl", sp = "#f38ba8" }),
		SpellCap({ gui = "undercurl", sp = "#f9e2af" }),
		SpellLocal({ gui = "undercurl", sp = "#89b4fa" }),
		SpellRare({ gui = "undercurl", sp = "#a6e3a1" }),

		Directory({ fg = "#89b4fa" }),
		Title({ fg = "#89b4fa", gui = "bold" }),
		MoreMsg({ fg = "#89b4fa" }),
		Question({ fg = "#89b4fa" }),
		ModeMsg({ fg = "#cdd6f4", gui = "bold" }),
		MatchParen({ fg = "#fab387", bg = "#45475a", gui = "bold" }),
		Conceal({ fg = "#7f849c" }),
		ColorColumn({ bg = surface0 }),
		QuickFixLine({ fg = "#cdd6f4", bg = "#45475a", gui = "bold" }),

		-- Completion menu
		BlinkCmpMenu({ Pmenu }),
		BlinkCmpMenuBorder({ fg = "#89b4fa", bg = "#181825" }),
		BlinkCmpMenuSelection({ gui = "bold", bg = "#45475a" }),
		BlinkCmpDoc({ NormalFloat }),
		BlinkCmpDocBorder({ FloatBorder }),
		BlinkCmpScrollBarGutter({ bg = "#45475a" }),
		BlinkCmpScrollBarThumb({ bg = "#6c7086" }),
		BlinkCmpGhostText({ fg = "#45475a" }),
		BlinkCmpLabel({ fg = "#9399b2" }),
		BlinkCmpLabelMatch({ fg = "#cdd6f4", gui = "bold" }),
		BlinkCmpLabelDeprecated({ fg = "#6c7086", gui = "strikethrough" }),
		BlinkCmpKind({ fg = "#89b4fa" }),
		BlinkCmpSource({ fg = "#6c7086" }),

		-- Git signs
		GitSignsAdd({ fg = "#a6e3a1" }),
		GitSignsChange({ fg = "#f9e2af" }),
		GitSignsDelete({ fg = "#f38ba8" }),

		-- LSP
		LspReferenceRead({ bg = "#45475a" }),
		LspReferenceText({ bg = "#45475a" }),
		LspReferenceWrite({ bg = "#45475a" }),
		LspInlayHint({ fg = "#6c7086", bg = "#2a2b3c" }),
		LspCodeLens({ fg = "#6c7086" }),
		LspSignatureActiveParameter({ gui = "bold", bg = surface0 }),

		-- Terminal
		TermCursorNC({ fg = "#1e1e2e", bg = "#9399b2" }),

		WildMenu({ bg = "#6c7086" }),
		Substitute({ fg = "#f5c2e7", bg = "#45475a" }),

		Todo({ fg = "#1e1e2e", bg = "#f2cdcd", gui = "bold" }),

		Italic({ gui = "italic" }),
		Bold({ gui = "bold" }),
		Underlined({ gui = "underline" }),

		Added({ fg = "nvimlightgreen" }),
		Removed({ fg = "nvimlightred" }),
		Changed({ fg = "nvimlightcyan" }),

		NvimInternalError({ fg = "red", bg = "red" }),
	}
end)
return theme
