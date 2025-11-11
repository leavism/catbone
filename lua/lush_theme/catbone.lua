local lush = require("lush")
local hsl = lush.hsl
local hsluv = lush.hsluv
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	local rosewater = hsl(10, 56, 91)
	local flamingo = hsl(0, 59, 88)
	local pink = hsl(316, 72, 86)
	local mauve = hsl(267, 84, 81)
	local red = hsl(343, 81, 75)
	local maroon = hsl(350, 65, 77)
	local peach = hsl(23, 92, 75)
	local yellow = hsl(41, 86, 83)
	local green = hsl(115, 54, 76)
	local teal = hsl(170, 57, 73)
	local sky = hsl(189, 71, 73)
	local sapphire = hsl(199, 76, 69)
	local blue = hsl(217, 92, 76)
	local lavender = hsl(232, 97, 85)

	local text = hsl(226, 64, 88)
	local subtext1 = hsl(227, 35, 80)
	local subtext0 = hsl(228, 24, 72)
	local overlay2 = hsl(228, 17, 64)
	local overlay1 = hsl(230, 13, 55)
	local overlay0 = hsl(231, 11, 47)
	local base = hsl(240, 21, 15)
	local mantle = hsl(240, 21, 12)
	local crust = hsl(240, 23, 9)

	local surface2 = hsl(233, 12, 39)
	local surface1 = hsl(234, 13, 31)
	local surface0 = hsl(237, 16, 23)

	return {
		-- Notes
		-- Snacks.lazygit integration uses these links
		--   theme = {
		--   [241]                      = { fg = "Special" },
		--   activeBorderColor          = { fg = "MatchParen", bold = true },
		--   cherryPickedCommitBgColor  = { fg = "Identifier" },
		--   cherryPickedCommitFgColor  = { fg = "Function" },
		--   defaultFgColor             = { fg = "Normal" },
		--   inactiveBorderColor        = { fg = "FloatBorder" },
		--   optionsTextColor           = { fg = "Function" },
		--   searchingActiveBorderColor = { fg = "MatchParen", bold = true },
		--   selectedLineBgColor        = { bg = "Visual" }, -- set to `default` to have no background colour
		--   unstagedChangesColor       = { fg = "DiagnosticError" },
		-- },

		Normal({ fg = text, bg = base }),

		-- UI Elements
		EndOfBuffer({ fg = surface1 }),
		NonText({ fg = surface1 }),
		Whitespace({ fg = surface1 }),
		SpecialKey({ fg = surface1, gui = "italic" }),

		-- Comments (base definition)
		Comment({ fg = overlay1, gui = "italic" }),

		-- Line numbers and signs
		LineNr({ fg = Comment.fg }),
		LineNrAbove({ LineNr }),
		LineNrBelow({ LineNr }),
		SignColumn({ fg = surface1 }),
		CursorLineNr({ fg = subtext1, gui = "bold" }),

		-- Status and UI
		StatusLine({ fg = text, bg = mantle }),
		StatusLineNC({ fg = surface1, bg = mantle }),
		StatusLineTerm({ StatusLine }), -- StatusLineTerm xxx links to StatusLine
		StatusLineTermNC({ StatusLineNC }), -- StatusLineTermNC xxx links to StatusLineNC
		WinSeparator({ fg = crust }),
		VertSplit({ fg = crust }),
		TabLine({ fg = overlay0, bg = crust }),
		TabLineFill({ bg = mantle }),
		TabLineSel({ gui = "bold" }),

		-- Cursor and selection
		Cursor({ fg = base, bg = red }),
		TermCursor({ Cursor }),
		CursorIM({ Cursor }),
		CursorLine({ bg = surface0 }),
		CursorColumn({ bg = CursorLine.bg }),
		Visual({ bg = surface1, fg = text, gui = "bold" }),
		VisualNOS({ Visual }),

		-- Search
		Search({ fg = mantle, bg = blue }),
		IncSearch({ fg = mantle, bg = sapphire, gui = "bold" }),
		CurSearch({ fg = mantle, bg = green }),

		-- Base syntax groups that will be linked to TreeSitter
		Statement({ fg = text.da(20).de(50) }),
		Conditional({ Statement }),
		Repeat({ Statement }),
		Operator({ fg = teal }),
		Exception({ Statement }),
		Label({ Statement }),
		Keyword({ Statement }),

		-- Types
		Type({ fg = subtext0 }),
		StorageClass({ fg = blue }),
		Structure({ fg = blue }), -- struct, union, enum, etc.
		Typedef({ fg = blue }), -- A typedef

		-- Constants and literals
		Constant({ fg = subtext1, gui = "italic" }),
		Character({ Constant }),
		Number({ fg = subtext1 }),
		Float({ Number }),
		Boolean({ gui = "italic" }),

		-- Strings
		String({ fg = green }),

		-- Functions and identifiers
		Identifier({ fg = text }), -- Any variable name
		Function({ fg = text }), -- Function name (also: methods for classes)

		-- Preprocessor
		PreProc({ fg = subtext1, gui = "bold" }),
		Include({ PreProc }),
		Macro({ fg = red }),
		PreCondit({ fg = Conditional.fg.li(30) }),
		sym("@keyword.directive")({ PreProc }),

		Define({ fg = peach }),
		cDefine({ Define }),
		sym("@keyword.directive.define")({ Define }), -- @keyword.directive xxx links to PreProc

		-- Special
		Special({ fg = pink }), -- Any special symbol
		SpecialChar({ Special }), -- Special character in a constant
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
		DiagnosticInfo({ fg = sky }),
		DiagnosticHint({ fg = pink }),
		DiagnosticOk({ fg = green }),
		DiagnosticUnnecessary({ DiagnosticWarn }),

		-- Underlines
		DiagnosticUnderlineError({ gui = "undercurl", sp = red }),
		DiagnosticUnderlineWarn({ gui = "undercurl", sp = peach }),
		DiagnosticUnderlineInfo({ gui = "undercurl", sp = sky }),
		DiagnosticUnderlineHint({ gui = "undercurl", sp = green }),

		DiagnosticFloatingError({ DiagnosticError }),
		DiagnosticFloatingWarn({ DiagnosticWarn }),
		DiagnosticFloatingInfo({ DiagnosticInfo }),
		DiagnosticFloatingHint({ DiagnosticHint }),
		DiagnosticFloatingOk({ DiagnosticOk }),

		-- Virtual text
		DiagnosticVirtualTextError({ fg = red, bg = red.de(60).da(81) }),
		DiagnosticVirtualTextWarn({ fg = peach, bg = peach.de(60).da(81) }),
		DiagnosticVirtualTextInfo({ fg = sky, bg = sky.de(60).da(81) }),
		DiagnosticVirtualTextHint({ fg = pink, bg = pink.de(60).da(81) }),
		DiagnosticVirtualTextOk({ gui = "italic", bg = green.de(60).da(81), fg = DiagnosticOk.fg }),

		DiagnosticVirtualLinesError({ DiagnosticError }),
		DiagnosticVirtualLinesWarn({ DiagnosticWarn }),
		DiagnosticVirtualLinesInfo({ DiagnosticInfo }),
		DiagnosticVirtualLinesHint({ DiagnosticHint }),
		DiagnosticVirtualLinesOk({ DiagnosticOk }),

		DiagnosticSignError({ DiagnosticError }), -- DiagnosticSignError xxx guifg=#f38ba8
		DiagnosticSignWarn({ DiagnosticWarn }), -- DiagnosticSignWarn xxx guifg=#f9e2af
		DiagnosticSignInfo({ DiagnosticInfo }), -- DiagnosticSignInfo xxx guifg=#89dceb
		DiagnosticSignHint({ DiagnosticHint }), -- DiagnosticSignHint xxx guifg=#94e2d5
		DiagnosticSignOk({ DiagnosticOk }), -- DiagnosticSignOk xxx guifg=#a6e3a1
		DiagnosticUnnecessary({ Comment }), -- DiagnosticUnnecessary xxx links to Comment
		DiagnosticDeprecated({ gui = "strikethrough", sp = "nvimlightred" }), -- DiagnosticDeprecated xxx cterm=strikethrough gui=strikethrough guisp=NvimLightRed
		DiagnosticUnderlineOk({ gui = "underline", sp = green }), -- DiagnosticUnderlineOk xxx cterm=underline gui=underline guisp=#a6e3a1

		LspDiagnosticsUnderlineHint({ gui = "undercurl", sp = teal }), -- LspDiagnosticsUnderlineHint xxx cterm=undercurl gui=undercurl guisp=#94e2d5
		LspDiagnosticsUnderlineInformation({ gui = "undercurl", sp = sky }), -- LspDiagnosticsUnderlineInformation xxx cterm=undercurl gui=undercurl guisp=#89dceb
		LspDiagnosticsUnderlineWarning({ gui = "undercurl", sp = yellow }), -- LspDiagnosticsUnderlineWarning xxx cterm=undercurl gui=undercurl guisp=#f9e2af
		LspDiagnosticsUnderlineError({ gui = "undercurl", sp = red }), -- LspDiagnosticsUnderlineError xxx cterm=undercurl gui=undercurl guisp=#f38ba8
		LspDiagnosticsVirtualTextHint({ gui = "italic", fg = teal }), -- LspDiagnosticsVirtualTextHint xxx cterm=italic gui=italic guifg=#94e2d5
		LspDiagnosticsVirtualTextInformation({ gui = "italic", fg = sky }), -- LspDiagnosticsVirtualTextInformation xxx cterm=italic gui=italic guifg=#89dceb
		LspDiagnosticsVirtualTextWarning({ gui = "italic", fg = yellow }), -- LspDiagnosticsVirtualTextWarning xxx cterm=italic gui=italic guifg=#f9e2af
		LspDiagnosticsVirtualTextError({ gui = "italic", fg = red }), -- LspDiagnosticsVirtualTextError xxx cterm=italic gui=italic guifg=#f38ba8
		LspDiagnosticsHint({ fg = teal }), -- LspDiagnosticsHint xxx guifg=#94e2d5
		LspDiagnosticsInformation({ fg = sky }), -- LspDiagnosticsInformation xxx guifg=#89dceb
		LspDiagnosticsWarning({ fg = yellow }), -- LspDiagnosticsWarning xxx guifg=#f9e2af
		LspDiagnosticsError({ fg = red }), -- LspDiagnosticsError xxx guifg=#f38ba8
		LspDiagnosticsDefaultHint({ fg = teal }), -- LspDiagnosticsDefaultHint xxx guifg=#94e2d5
		LspDiagnosticsDefaultInformation({ fg = sky }), -- LspDiagnosticsDefaultInformation xxx guifg=#89dceb
		LspDiagnosticsDefaultWarning({ fg = yellow }), -- LspDiagnosticsDefaultWarning xxx guifg=#f9e2af
		LspDiagnosticsDefaultError({ fg = red }), -- LspDiagnosticsDefaultError xxx guifg=#f38ba8

		-- Diff colors
		DiffAdd({ bg = "#364143" }),
		DiffChange({ bg = "#25293c" }),
		DiffDelete({ bg = "#443244" }),
		DiffText({ fg = text, bg = "#3e4b6b" }),
		diffIndexLine({ fg = teal }), -- diffIndexLine  xxx guifg=#94e2d5
		diffLine({ fg = overlay0 }), -- diffLine       xxx guifg=#6c7086
		diffFile({ fg = blue }), -- diffFile       xxx guifg=#89b4fa
		diffNewFile({ fg = peach }), -- diffNewFile    xxx guifg=#fab387
		diffOldFile({ fg = yellow }), -- diffOldFile    xxx guifg=#f9e2af
		diffChanged({ fg = blue }), -- diffChanged    xxx guifg=#89b4fa
		diffRemoved({ fg = red }), -- diffRemoved    xxx guifg=#f38ba8
		diffAdded({ fg = green }), -- diffAdded      xxx guifg=#a6e3a1

		-- Popup menus
		Pmenu({ fg = overlay2, bg = mantle }),
		PmenuSel({ gui = "bold", bg = surface0 }),
		PmenuSbar({ bg = surface0 }),
		PmenuThumb({ bg = overlay0 }),
		NormalFloat({ fg = text, bg = mantle }),
		FloatTitle({ fg = subtext1, bg = mantle }),
		FloatBorder({ fg = blue, bg = mantle }),
		FloatShadow({ fg = overlay0 }), -- FloatShadow    xxx guifg=#6c7086
		FloatShadowThrough({ bg = "nvimdarkgrey4", blend = 100 }), -- FloatShadowThrough xxx ctermbg=0 guibg=NvimDarkGrey4 blend=100

		-- TreeSitter groups linked to base syntax groups
		-- Variables
		TreesitterContextBottom({ gui = "underline", sp = surface0 }), -- TreesitterContextBottom xxx cterm=underline gui=underline guisp=#313244
		TreesitterContextLineNumber({ bg = mantle, fg = surface1 }), -- TreesitterContextLineNumber xxx guifg=#45475a guibg=#181825

		sym("@variable")({ Identifier }),
		sym("@variable.builtin")({ gui = "italic" }),
		sym("@variable.parameter")({ fg = lavender }),
		sym("@variable.parameter.builtin")({ Special }), -- @variable.parameter.builtin xxx links to Special
		sym("@variable.parameter.bash")({ fg = green }), -- @variable.parameter.bash xxx guifg=#a6e3a1
		sym("@variable.member")({ Identifier }),
		sym("@variable.member.nix")({ fg = blue }), -- @variable.member.nix xxx guifg=#89b4fa

		-- Constants
		sym("@constant")({ Constant }),
		sym("@constant.builtin")({ Boolean }),
		sym("@constant.macro")({ Macro }), -- @constant.macro xxx links to Macro
		sym("@constant.java")({ fg = teal }), -- @constant.java xxx guifg=#94e2d5
		sym("@constant.builtin")({ fg = peach }), -- @constant.builtin xxx guifg=#fab387

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
		sym("@keyword.directive")({ PreProc }), -- @keyword.directive xxx links to PreProc
		sym("@keyword.directive.css")({ Keyword }), -- @keyword.directive.css xxx links to Keyword
		sym("@keyword.conditional")({ Conditional }),
		sym("@keyword.repeat")({ Repeat }),
		sym("@keyword.return")({ fg = mauve }),
		sym("@keyword.exception")({ Exception }),
		sym("@keyword.operator")({ Operator }),
		sym("@keyword.function")({ Keyword }),
		sym("@keyword.storage")({ Keyword }), -- @keyword.storage xxx links to Keyword
		sym("@keyword.coroutine")({ Keyword }), -- @keyword.coroutine xxx links to Keyword
		sym("@keyword.type")({ Keyword }), -- @keyword.type  xxx links to Keyword
		sym("@keyword.modifier")({ Keyword }), -- @keyword.modifier xxx links to Keyword
		sym("@keyword.exception")({ Exception }), -- @keyword.exception xxx links to Exception
		sym("@keyword.debug")({ Exception }), -- @keyword.debug xxx links to Exception
		sym("@keyword.import")({ Include }), -- @keyword.import xxx links to Include
		sym("@keyword.import.cpp")({ fg = yellow }), -- @keyword.import.cpp xxx guifg=#f9e2af
		sym("@keyword.import.c")({ fg = yellow }), -- @keyword.import.c xxx guifg=#f9e2af
		sym("@keyword.export")({ fg = mauve }), -- @keyword.export xxx guifg=#cba6f7
		sym("@keyword.operator")({ fg = mauve }), -- @keyword.operator xxx guifg=#cba6f7
		sym("@keyword.function")({ fg = mauve }), -- @keyword.function xxx guifg=#cba6f7
		sym("@keyword.conditional.ternary")({ Conditional }), -- @keyword.conditional.ternary xxx links to Operator
		sym("@keyword.conditional")({ Conditional }), -- @keyword.conditional xxx links to Conditional
		sym("@keyword.repeat")({ Repeat }), -- @keyword.repeat xxx links to Repeat

		-- Operators and punctuation
		sym("@operator")({ Operator }),
		sym("@punctuation")({ fg = overlay2 }),
		sym("@punctuation.delimiter")({ Delimiter }),
		sym("@punctuation.bracket")({ fg = overlay2 }),
		sym("@punctuation.special")({ Special }),

		-- Comments - link to base Comment
		sym("@comment")({ Comment }),
		sym("@comment.documentation")({ Comment }),
		sym("@comment.error")({ fg = base, bg = red }),
		sym("@comment.warning")({ fg = base, bg = yellow }),
		sym("@comment.note")({ fg = base, bg = blue }),
		sym("@comment.todo")({ fg = base, bg = flamingo }),
		sym("@comment.hint")({ bg = blue, fg = base }), -- @comment.hint  xxx guifg=#1e1e2e guibg=#89b4fa
		sym("@comment.warning.gitcommit")({ fg = yellow }), -- @comment.warning.gitcommit xxx guifg=#f9e2af

		-- Types
		sym("@type")({ Type }),
		sym("@type.builtin")({ Type }),
		sym("@type.qualifier")({ StorageClass }),

		-- Properties and attributes
		sym("@property")({ Identifier }),
		sym("@attribute")({ PreProc }),
		sym("@label")({ Label }),

		-- Markup
		sym("@markup")({ fg = text }),
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

		rainbow1({ fg = red }),
		rainbow2({ fg = peach }),
		rainbow3({ fg = yellow }),
		rainbow4({ fg = green }),
		rainbow5({ fg = sapphire }),
		rainbow6({ fg = lavender }),
		sym("@markup.heading.markdown")({ gui = "bold" }), -- @markup.heading.markdown xxx cterm=bold gui=bold
		sym("@markup.heading.1.markdown")({ rainbow1 }),
		sym("@markup.heading.2.markdown")({ rainbow2 }),
		sym("@markup.heading.3.markdown")({ rainbow3 }),
		sym("@markup.heading.4.markdown")({ rainbow4 }),
		sym("@markup.heading.5.markdown")({ rainbow5 }),
		sym("@markup.heading.6.markdown")({ rainbow6 }),
		sym("@markup.heading.1.delimiter.vimdoc")({ gui = "underdouble,nocombine", bg = "bg", fg = "bg", sp = "fg" }), -- @markup.heading.1.delimiter.vimdoc xxx cterm=underdouble,nocombine gui=underdouble,nocombine guifg=bg guibg=bg guisp=fg
		sym("@markup.heading.2.delimiter.vimdoc")({ gui = "underline,nocombine", bg = "bg", fg = "bg", sp = "fg" }), -- @markup.heading.2.delimiter.vimdoc xxx cterm=underline,nocombine gui=underline,nocombine guifg=bg guibg=bg guisp=fg
		sym("@markup.list")({ fg = teal }), -- @markup.list   xxx guifg=#94e2d5
		sym("@markup.link.label")({ fg = lavender }), -- @markup.link.label xxx guifg=#b4befe
		sym("@markup.link.label.html")({ fg = text }), -- @markup.link.label.html xxx guifg=#cdd6f4
		sym("@markup.list.unchecked")({ fg = overlay1 }), -- @markup.list.unchecked xxx guifg=#7f849c
		sym("@markup.list.checked")({ fg = green }), -- @markup.list.checked xxx guifg=#a6e3a1
		sym("@markup.environment")({ fg = pink }), -- @markup.environment xxx guifg=#f5c2e7
		sym("@markup.environment.name")({ fg = blue }), -- @markup.environment.name xxx guifg=#89b4fa

		markdownH1({ rainbow1 }), -- markdownH1     xxx links to rainbow1
		markdownH2({ rainbow2 }), -- markdownH2     xxx links to rainbow2
		markdownH3({ rainbow3 }), -- markdownH3     xxx links to rainbow3
		markdownH4({ rainbow4 }), -- markdownH4     xxx links to rainbow4
		markdownH5({ rainbow5 }), -- markdownH5     xxx links to rainbow5
		markdownH6({ rainbow6 }), -- markdownH6     xxx links to rainbow6
		markdownLinkText({ gui = "underline", fg = blue }), -- markdownLinkText xxx cterm=underline gui=underline guifg=#89b4fa
		markdownCodeBlock({ fg = flamingo }), -- markdownCodeBlock xxx guifg=#f2cdcd
		markdownCode({ fg = flamingo }), -- markdownCode   xxx guifg=#f2cdcd
		markdownHeadingDelimiter({ gui = "bold", fg = peach }), -- markdownHeadingDelimiter xxx cterm=bold gui=bold guifg=#fab387

		sym("@text.title.1.markdown")({ rainbow1 }), -- @text.title.1.markdown xxx links to rainbow1
		sym("@text.title.2.markdown")({ rainbow2 }), -- @text.title.2.markdown xxx links to rainbow2
		sym("@text.title.3.markdown")({ rainbow3 }), -- @text.title.3.markdown xxx links to rainbow3
		sym("@text.title.4.markdown")({ rainbow4 }), -- @text.title.4.markdown xxx links to rainbow4
		sym("@text.title.5.markdown")({ rainbow5 }), -- @text.title.5.markdown xxx links to rainbow5
		sym("@text.title.6.markdown")({ rainbow6 }), -- @text.title.6.markdown xxx links to rainbow6

		RenderMarkdownH1({ fg = red }), -- RenderMarkdownH1 xxx guifg=#f38ba8
		RenderMarkdownH1Bg({ bg = "#32283a" }), -- RenderMarkdownH1Bg xxx guibg=#32283a
		RenderMarkdownH2({ fg = peach }), -- RenderMarkdownH2 xxx guifg=#fab387
		RenderMarkdownH2Bg({ bg = "#332c36" }), -- RenderMarkdownH2Bg xxx guibg=#332c36
		RenderMarkdownH3({ fg = yellow }), -- RenderMarkdownH3 xxx guifg=#f9e2af
		RenderMarkdownH3Bg({ bg = "#33313a" }), -- RenderMarkdownH3Bg xxx guibg=#33313a
		RenderMarkdownH4({ fg = green }), -- RenderMarkdownH4 xxx guifg=#a6e3a1
		RenderMarkdownH4Bg({ bg = "#2b3139" }), -- RenderMarkdownH4Bg xxx guibg=#2b3139
		RenderMarkdownH5({ fg = sapphire }), -- RenderMarkdownH5 xxx guifg=#74c7ec
		RenderMarkdownH5Bg({ bg = "#262e40" }), -- RenderMarkdownH5Bg xxx guibg=#262e40
		RenderMarkdownH6({ fg = lavender }), -- RenderMarkdownH6 xxx guifg=#b4befe
		RenderMarkdownH6Bg({ bg = "#2c2d42" }), -- RenderMarkdownH6Bg xxx guibg=#2c2d42
		RenderMarkdownInfo({ fg = sky }), -- RenderMarkdownInfo xxx guifg=#89dceb
		RenderMarkdownCodeInline({ bg = surface0 }), -- RenderMarkdownCodeInline xxx guibg=#313244
		RenderMarkdownTableRow({ fg = lavender }), -- RenderMarkdownTableRow xxx guifg=#b4befe
		RenderMarkdownBullet({ fg = sky }), -- RenderMarkdownBullet xxx guifg=#89dceb
		RenderMarkdownCode({ bg = mantle }), -- RenderMarkdownCode xxx guibg=#181825
		RenderMarkdownTableHead({ fg = blue }), -- RenderMarkdownTableHead xxx guifg=#89b4fa
		RenderMarkdownSuccess({ fg = green }), -- RenderMarkdownSuccess xxx guifg=#a6e3a1
		RenderMarkdownError({ fg = red }), -- RenderMarkdownError xxx guifg=#f38ba8
		RenderMarkdownWarn({ fg = yellow }), -- RenderMarkdownWarn xxx guifg=#f9e2af
		RenderMarkdownHint({ fg = teal }), -- RenderMarkdownHint xxx guifg=#94e2d5

		-- Tags
		sym("@tag")({ Tag }),
		sym("@tag.builtin")({ Special }),
		sym("@tag.attribute")({ gui = "italic" }),
		sym("@tag.delimiter")({ Delimiter }),

		-- Rest of the configuration remains the same...
		Folded({ fg = blue, bg = surface1 }),
		FoldColumn({ fg = overlay0 }),

		SpellBad({ gui = "undercurl", sp = red }),
		SpellCap({ gui = "undercurl", sp = yellow }),
		SpellLocal({ gui = "undercurl", sp = blue }),
		SpellRare({ gui = "undercurl", sp = green }),

		Directory({ fg = blue }),
		Title({ fg = blue, gui = "bold" }),
		MoreMsg({ fg = blue }),
		Question({ fg = blue }),
		ModeMsg({ fg = text, gui = "bold" }),
		MatchParen({ fg = peach, bg = base, gui = "bold" }),

		Conceal({ fg = overlay1 }),
		ColorColumn({ g = surface0 }),
		QuickFixLine({ fg = text, bg = surface1, gui = "bold" }),

		-- Git signs
		GitSignsAdd({ fg = green }),
		GitSignsChange({ fg = yellow }),
		GitSignsDelete({ fg = red }),

		FzfLuaTabMarker({ fg = yellow }), -- FzfLuaTabMarker xxx guifg=#f9e2af
		FzfLuaTabTitle({ fg = sky }), -- FzfLuaTabTitle xxx guifg=#89dceb
		FzfLuaFzfMatch({ fg = blue }), -- FzfLuaFzfMatch xxx guifg=#89b4fa
		FzfLuaFzfPrompt({ fg = blue }), -- FzfLuaFzfPrompt xxx guifg=#89b4fa
		FzfLuaPathColNr({ fg = blue }), -- FzfLuaPathColNr xxx guifg=#89b4fa
		FzfLuaPathLineNr({ fg = green }), -- FzfLuaPathLineNr xxx guifg=#a6e3a1
		FzfLuaBufName({ fg = mauve }), -- FzfLuaBufName  xxx guifg=#cba6f7
		FzfLuaBufNr({ fg = yellow }), -- FzfLuaBufNr    xxx guifg=#f9e2af
		FzfLuaLiveSym({ fg = peach }), -- FzfLuaLiveSym  xxx guifg=#fab387
		FzfLuaBufFlagCur({ fg = peach }), -- FzfLuaBufFlagCur xxx guifg=#fab387
		FzfLuaHeaderText({ fg = peach }), -- FzfLuaHeaderText xxx guifg=#fab387
		FzfLuaHeaderBind({ fg = yellow }), -- FzfLuaHeaderBind xxx guifg=#f9e2af
		FzfLuaTitle({ FloatTitle }), -- FzfLuaTitle    xxx links to FloatTitle
		FzfLuaBorder({ FloatBorder }), -- FzfLuaBorder   xxx links to FloatBorder
		FzfLuaNormal({ NormalFloat }), -- FzfLuaNormal   xxx links to NormalFloat
		FzfLuaDirPart({ NonText }), -- FzfLuaDirPart  xxx links to NonText
		FzfLuaBufFlagAlt({ fg = blue }), -- FzfLuaBufFlagAlt xxx guifg=#89b4fa

		-- LSP
		LspReferenceRead({ bg = surface1 }),
		LspReferenceText({ bg = surface1 }),
		LspReferenceWrite({ bg = surface1 }),
		LspInlayHint({ fg = overlay0, bg = "#2a2b3c" }),
		LspCodeLens({ fg = overlay0 }),
		LspSignatureActiveParameter({ gui = "bold", bg = surface0 }),
		LspCodeLensSeparator({ LspCodeLens }), -- LspCodeLensSeparator xxx links to LspCodeLens
		LspReferenceTarget({ LspReferenceText }), -- LspReferenceTarget xxx links to LspReferenceText
		LspInfoBorder({ FloatBorder }), -- LspInfoBorder  xxx links to FloatBorder
		sym("@lsp.type.parameter")({ sym("@variable.parameter") }), -- @lsp.type.parameter xxx links to @variable.parameter
		sym("@lsp.type.namespace")({ sym("@module") }), -- @lsp.type.namespace xxx links to @module
		sym("@lsp.type.regexp")({ sym("@string.regexp") }), -- @lsp.type.regexp xxx links to @string.regexp
		sym("@lsp.type.property")({ sym("@property") }), -- @lsp.type.property xxx links to @property
		sym("@lsp.typemod.function.defaultLibrary")({ sym("@function.builtin") }), -- @lsp.typemod.function.defaultLibrary xxx links to @function.builtin
		sym("@lsp.typemod.function.builtin")({ sym("@function.builtin") }), -- @lsp.typemod.function.builtin xxx links to @function.builtin
		sym("@lsp.type.enumMember")({ fg = teal }), -- @lsp.type.enumMember xxx guifg=#94e2d5
		sym("@lsp.mod.deprecated")({ DiagnosticDeprecated }), -- @lsp.mod.deprecated xxx links to DiagnosticDeprecated
		sym("@lsp.type.property.nix")({ fg = blue }), -- @lsp.type.property.nix xxx guifg=#89b4fa

		-- Terminal
		TermCursorNC({ fg = base, bg = overlay2 }),

		WildMenu({ bg = overlay0 }),
		Substitute({ fg = pink, bg = surface1 }),

		Todo({ fg = base, bg = flamingo, gui = "bold" }),

		Italic({ gui = "italic" }),
		Bold({ gui = "bold" }),
		Underlined({ gui = "underline" }),
		Quote({ sym("@markup.strong") }), -- Quote          xxx links to @markup.strong

		Added({ fg = "nvimlightgreen" }),
		Removed({ fg = "nvimlightred" }),
		Changed({ fg = "nvimlightcyan" }),

		-- Indent guides
		SnacksIndentScope({ fg = overlay1 }),
		SnacksIndent({ fg = surface1 }),
		SnacksIndentBlank({ fg = SnacksIndent.fg }),
		IblScope({ fg = SnacksIndentScope.fg }),
		IblIndent({ fg = SnacksIndent.fg }),
		MiniIndentscopeSymbol({ fg = SnacksIndentScope.fg }),

		-- Add this line somewhere in the return table
		SnacksDim({ fg = overlay0 }),

		SnacksNotifierFooterError({ DiagnosticError }), -- SnacksNotifierFooterError xxx links to DiagnosticError
		SnacksNotifierFooterWarn({ DiagnosticWarn }), -- SnacksNotifierFooterWarn xxx links to DiagnosticWarn
		SnacksNotifierFooterInfo({ DiagnosticInfo }), -- SnacksNotifierFooterInfo xxx links to DiagnosticInfo
		SnacksNotifierFooterDebug({ DiagnosticHint }), -- SnacksNotifierFooterDebug xxx links to DiagnosticHint
		SnacksNotifierFooterTrace({ DiagnosticHint }), -- SnacksNotifierFooterTrace xxx links to DiagnosticHint
		SnacksNotifierTrace({ fg = rosewater }), -- SnacksNotifierTrace xxx guifg=#f5e0dc
		SnacksNotifierIconTrace({ fg = rosewater }), -- SnacksNotifierIconTrace xxx guifg=#f5e0dc
		SnacksNotifierTitleTrace({ gui = "italic", fg = rosewater }), -- SnacksNotifierTitleTrace xxx cterm=italic gui=italic guifg=#f5e0dc
		SnacksNotifierTitleError({ gui = "italic", fg = red }), -- SnacksNotifierTitleError xxx cterm=italic gui=italic guifg=#f38ba8
		SnacksNotifierTitleWarn({ gui = "italic", fg = yellow }), -- SnacksNotifierTitleWarn xxx cterm=italic gui=italic guifg=#f9e2af
		SnacksNotifierTitleDebug({ gui = "italic", fg = peach }), -- SnacksNotifierTitleDebug xxx cterm=italic gui=italic guifg=#fab387
		SnacksNotifierTitleInfo({ gui = "italic", fg = blue }), -- SnacksNotifierTitleInfo xxx cterm=italic gui=italic guifg=#89b4fa
		SnacksNotifierBorderError({ fg = red }), -- SnacksNotifierBorderError xxx guifg=#f38ba8
		SnacksNotifierBorderWarn({ fg = yellow }), -- SnacksNotifierBorderWarn xxx guifg=#f9e2af
		SnacksNotifierBorderDebug({ fg = peach }), -- SnacksNotifierBorderDebug xxx guifg=#fab387
		SnacksNotifierBorderTrace({ fg = rosewater }), -- SnacksNotifierBorderTrace xxx guifg=#f5e0dc
		SnacksNotifierBorderInfo({ fg = blue }), -- SnacksNotifierBorderInfo xxx guifg=#89b4fa
		SnacksNotifierError({ fg = red }), -- SnacksNotifierError xxx guifg=#f38ba8
		SnacksNotifierWarn({ fg = yellow }), -- SnacksNotifierWarn xxx guifg=#f9e2af
		SnacksNotifierInfo({ fg = blue }), -- SnacksNotifierInfo xxx guifg=#89b4fa
		SnacksNotifierDebug({ fg = peach }), -- SnacksNotifierDebug xxx guifg=#fab387
		SnacksNotifierIconError({ fg = red }), -- SnacksNotifierIconError xxx guifg=#f38ba8
		SnacksNotifierIconWarn({ fg = yellow }), -- SnacksNotifierIconWarn xxx guifg=#f9e2af
		SnacksNotifierIconDebug({ fg = peach }), -- SnacksNotifierIconDebug xxx guifg=#fab387
		SnacksNotifierIconInfo({ fg = blue }), -- SnacksNotifierIconInfo xxx guifg=#89b4fa

		MiniFilesDirectory({ Directory }), -- MiniFilesDirectory xxx links to Directory
		MiniFilesCursorLine({ CursorLine }), -- MiniFilesCursorLine xxx links to CursorLine
		MiniFilesNormal({ NormalFloat }), -- MiniFilesNormal xxx links to NormalFloat
		MiniFilesBorder({ FloatBorder }), -- MiniFilesBorder xxx links to FloatBorder
		MiniFilesTitle({ FloatTitle }), -- MiniFilesTitle xxx links to FloatTitle
		MiniFilesBorderModified({ DiagnosticFloatingWarn }), -- MiniFilesBorderModified xxx links to DiagnosticFloatingWarn
		MiniFilesFile({ fg = text }), -- MiniFilesFile  xxx guifg=#cdd6f4
		MiniFilesTitleFocused({ gui = "bold", bg = mantle, fg = subtext0 }), -- MiniFilesTitleFocused xxx cterm=bold gui=bold guifg=#a6adc8 guibg=#181825

		MiniIconsRed({ fg = red }), -- MiniIconsRed
		MiniIconsOrange({ fg = peach }), -- MiniIconsOrange
		MiniIconsCyan({ fg = teal }), -- MiniIconsCyan
		MiniIconsPurple({ fg = lavender }), -- MiniIconsPurple xxx guifg=#cba6f7
		MiniIconsYellow({ fg = yellow }), -- MiniIconsYellow xxx guifg=#f9e2af
		MiniIconsAzure({ fg = sapphire }), -- MiniIconsAzure xxx guifg=#74c7ec
		MiniIconsGrey({ fg = text }), -- MiniIconsGrey  xxx guifg=#cdd6f4
		MiniIconsBlue({ fg = blue }), -- MiniIconsBlue  xxx guifg=#89b4fa
		MiniIconsGreen({ fg = green }), -- MiniIconsGreen xxx guifg=#a6e3a1

		MiniStatuslineModeReplace({ gui = "bold", bg = red, fg = base }), -- MiniStatuslineModeReplace xxx cterm=bold gui=bold guifg=#1e1e2e guibg=#f38ba8
		MiniStatuslineModeOther({ gui = "bold", bg = teal, fg = base }), -- MiniStatuslineModeOther xxx cterm=bold gui=bold guifg=#1e1e2e guibg=#94e2d5
		MiniStatuslineModeNormal({ gui = "bold", bg = blue, fg = mantle }), -- MiniStatuslineModeNormal xxx cterm=bold gui=bold guifg=#181825 guibg=#89b4fa
		MiniStatuslineModeInsert({ gui = "bold", bg = green, fg = base }), -- MiniStatuslineModeInsert xxx cterm=bold gui=bold guifg=#1e1e2e guibg=#a6e3a1
		MiniStatuslineModeCommand({ gui = "bold", bg = peach, fg = base }), -- MiniStatuslineModeCommand xxx cterm=bold gui=bold guifg=#1e1e2e guibg=#fab387
		MiniStatuslineModeVisual({ gui = "bold", bg = mauve, fg = base }), -- MiniStatuslineModeVisual xxx cterm=bold gui=bold guifg=#1e1e2e guibg=#cba6f7
		MiniStatuslineInactive({ bg = mantle, fg = blue }), -- MiniStatuslineInactive xxx guifg=#89b4fa guibg=#181825
		MiniStatuslineFilename({ bg = mantle, fg = text }), -- MiniStatuslineFilename xxx guifg=#cdd6f4 guibg=#181825
		MiniStatuslineFileinfo({ bg = surface1, fg = subtext1 }), -- MiniStatuslineFileinfo xxx guifg=#bac2de guibg=#45475a
		MiniStatuslineDevinfo({ bg = surface1, fg = subtext1 }), -- MiniStatuslineDevinfo xxx guifg=#bac2de guibg=#45475a

		MiniTrailspace({ bg = red }), -- MiniTrailspace xxx guibg=#f38ba8
		MiniTestPass({ gui = "bold", fg = green }), -- MiniTestPass   xxx cterm=bold gui=bold guifg=#a6e3a1
		MiniSurround({ bg = pink, fg = surface1 }), -- MiniSurround   xxx guifg=#45475a guibg=#f5c2e7

		MiniJump2dSpotUnique({ gui = "bold", bg = base, fg = sky }), -- MiniJump2dSpotUnique xxx cterm=bold gui=bold guifg=#89dceb guibg=#1e1e2e
		MiniJump2dSpotAhead({ bg = "#191926", fg = teal }), -- MiniJump2dSpotAhead xxx guifg=#94e2d5 guibg=#191926
		MiniJump2dSpot({ gui = "bold,underline", bg = base, fg = peach }), -- MiniJump2dSpot xxx cterm=bold,underline gui=bold,underline guifg=#fab387 guibg=#1e1e2e
		MiniJump2dDim({ fg = overlay0 }), -- MiniJump2dDim  xxx guifg=#6c7086
		MiniJump({ bg = pink, fg = overlay2 }), -- MiniJump       xxx guifg=#9399b2 guibg=#f5c2e7

		MiniStarterQuery({ fg = green }), -- MiniStarterQuery xxx guifg=#a6e3a1
		MiniStarterSection({ fg = flamingo }), -- MiniStarterSection xxx guifg=#f2cdcd
		MiniStarterItemPrefix({ fg = pink }), -- MiniStarterItemPrefix xxx guifg=#f5c2e7
		MiniStarterItemBullet({ fg = blue }), -- MiniStarterItemBullet xxx guifg=#89b4fa
		MiniStarterItem({ fg = text }), -- MiniStarterItem xxx guifg=#cdd6f4
		MiniStarterInactive({ gui = "italic", fg = surface2 }), -- MiniStarterInactive xxx cterm=italic gui=italic guifg=#585b70
		MiniStarterHeader({ fg = blue }), -- MiniStarterHeader xxx guifg=#89b4fa
		MiniStarterFooter({ gui = "italic", fg = yellow }), -- MiniStarterFooter xxx cterm=italic gui=italic guifg=#f9e2af

		MiniHipatternsTodo({ gui = "bold", bg = teal, fg = base }), -- MiniHipatternsTodo xxx cterm=bold gui=bold guifg=#1e1e2e guibg=#94e2d5
		MiniHipatternsNote({ gui = "bold", bg = sky, fg = base }), -- MiniHipatternsNote xxx cterm=bold gui=bold guifg=#1e1e2e guibg=#89dceb
		MiniHipatternsHack({ gui = "bold", bg = yellow, fg = base }), -- MiniHipatternsHack xxx cterm=bold gui=bold guifg=#1e1e2e guibg=#f9e2af
		MiniHipatternsFixme({ gui = "bold", bg = red, fg = base }), -- MiniHipatternsFixme xxx cterm=bold gui=bold guifg=#1e1e2e guibg=#f38ba8

		MiniDepsTitleUpdate({ bg = green, fg = base }), -- MiniDepsTitleUpdate xxx guifg=#1e1e2e guibg=#a6e3a1
		MiniDepsTitleError({ bg = red, fg = base }), -- MiniDepsTitleError xxx guifg=#1e1e2e guibg=#f38ba8
		MiniDepsChangeAdded({ diffAdded }), -- MiniDepsChangeAdded xxx links to diffAdded
		MiniDepsMsgBreaking({ DiagnosticWarn }), -- MiniDepsMsgBreaking xxx links to DiagnosticWarn
		MiniDepsTitle({ Title }), -- MiniDepsTitle  xxx links to Title
		MiniDepsTitleSame({ DiffText }), -- MiniDepsTitleSame xxx links to DiffText
		MiniDepsInfo({ DiagnosticInfo }), -- MiniDepsInfo   xxx links to DiagnosticInfo
		MiniDepsHint({ DiagnosticHint }), -- MiniDepsHint   xxx links to DiagnosticHint
		MiniDepsPlaceholder({ Comment }), -- MiniDepsPlaceholder xxx links to Comment
		MiniDepsChangeRemoved({ diffRemoved }), -- MiniDepsChangeRemoved xxx links to diffRemoved

		MiniMapSymbolView({ Delimiter }), -- MiniMapSymbolView xxx links to Delimiter
		MiniMapSymbolCount({ Special }), -- MiniMapSymbolCount xxx links to Special
		MiniMapNormal({ NormalFloat }), -- MiniMapNormal  xxx links to NormalFloat
		MiniAnimateNormalFloat({ NormalFloat }), -- MiniAnimateNormalFloat xxx links to NormalFloat
		MiniCursorwordCurrent({ gui = "underline" }), -- MiniCursorwordCurrent xxx cterm=underline gui=underline
		MiniCursorword({ gui = "underline" }), -- MiniCursorword xxx cterm=underline gui=underline
		MiniCompletionActiveParameter({ gui = "underline" }), -- MiniCompletionActiveParameter xxx cterm=underline gui=underline
		MiniAnimateCursor({ gui = "reverse,nocombine" }), -- MiniAnimateCursor xxx cterm=reverse,nocombine gui=reverse,nocombine
		MiniTestFail({ gui = "bold", fg = red }), -- MiniTestFail   xxx cterm=bold gui=bold guifg=#f38ba8
		MiniTestEmphasis({ gui = "bold" }), -- MiniTestEmphasis xxx cterm=bold gui=bold

		MiniTablineModifiedVisible({ fg = red }), -- MiniTablineModifiedVisible xxx guifg=#f38ba8
		MiniTablineModifiedHidden({ fg = red }), -- MiniTablineModifiedHidden xxx guifg=#f38ba8
		MiniTablineModifiedCurrent({ gui = "bold,italic", fg = red }), -- MiniTablineModifiedCurrent xxx cterm=bold,italic gui=bold,italic guifg=#f38ba8
		MiniTablineHidden({ bg = mantle, fg = text }), -- MiniTablineHidden xxx guifg=#cdd6f4 guibg=#181825
		MiniTablineFill({ bg = base }), -- MiniTablineFill xxx guibg=#1e1e2e
		MiniTablineCurrent({ gui = "bold,underline,italic", bg = base, fg = text, sp = red }), -- MiniTablineCurrent xxx cterm=bold,underline,italic gui=bold,underline,italic guifg=#cdd6f4 guibg=#1e1e2e guisp=#f38ba8
		MiniTablineTabpagesection({ bg = base, fg = surface1 }), -- MiniTablineTabpagesection xxx guifg=#45475a guibg=#1e1e2e

		-- Whichkey
		WhichKeyIconRed({ MiniIconsRed }), -- WhichKeyIconRed xxx links to MiniIconsRed
		WhichKeyIconOrange({ MiniIconsOrange }), -- WhichKeyIconOrange xxx links to MiniIconsOrange
		WhichKeyIconCyan({ MiniIconsCyan }), -- WhichKeyIconCyan xxx links to MiniIconsCyan
		WhichKeyIconPurple({ MiniIconsPurple }), -- WhichKeyIconPurple xxx links to MiniIconsPurple
		WhichKeyIconYellow({ MiniIconsYellow }), -- WhichKeyIconYellow xxx links to MiniIconsYellow
		WhichKeyIconAzure({ MiniIconsAzure }), -- WhichKeyIconAzure xxx links to MiniIconsAzure
		WhichKeyIconGrey({ MiniIconsGrey }), -- WhichKeyIconGrey xxx links to MiniIconsGrey
		WhichKeyIconRed({ MiniIconsRed }), -- WhichKeyIconRed xxx links to MiniIconsRed
		WhichKeyIconBlue({ MiniIconsBlue }), -- WhichKeyIconBlue xxx links to MiniIconsBlue
		WhichKeyIconGreen({ MiniIconsGreen }), -- WhichKeyIconGreen xxx links to MiniIconsGreen
		WhichKeySeparator({ fg = overlay0 }), -- WhichKeySeparator xxx guifg=#6c7086
		WhichKeyDesc({ fg = mauve }), -- Shortcut descriptions
		WhichKeyGroup({ fg = blue }), -- WhichKeyGroup  xxx guifg=#89b4fa
		WhichKeyTitle({ FloatTitle }), -- WhichKeyTitle  xxx links to FloatTitle
		WhichKey({ NormalFloat }), -- WhichKey       xxx links to NormalFloat
		WhichKeyNormal({ NormalFloat }), -- WhichKeyNormal xxx links to NormalFloat
		WhichKeyBorder({ FloatBorder }), -- WhichKeyBorder xxx links to FloatBorder
		WhichKeyValue({ fg = overlay0 }), -- WhichKeyValue  xxx guifg=#6c7086
		WhichKeyIcon({ sym("@markup.link") }), -- WhichKeyIcon   xxx links to @markup.link
		WhichKeyTitle({ FloatTitle }), -- WhichKeyTitle  xxx links to FloatTitle
		WhichKey({ NormalFloat }), -- WhichKey       xxx links to NormalFloat
		WhichKeyNormal({ NormalFloat }), -- WhichKeyNormal xxx links to NormalFloat
		WhichKeyBorder({ FloatBorder }), -- WhichKeyBorder xxx links to FloatBorder

		-- File tree
		-- Snacks Picker is a file picker and file tree
		SnacksPickerAuGroup({ Type }), -- SnacksPickerAuGroup xxx links to Type
		SnacksPickerDiagnosticCode({ Special }), -- SnacksPickerDiagnosticCode xxx links to Special
		SnacksPickerTime({ Special }), -- SnacksPickerTime xxx links to Special
		SnacksPickerUndoSaved({ Special }), -- SnacksPickerUndoSaved xxx links to Special
		SnacksPickerSpecial({ Special }), -- SnacksPickerSpecial xxx links to Special
		SnacksPickerIconEvent({ Special }), -- SnacksPickerIconEvent xxx links to Special
		SnacksPickerManPage({ Special }), -- SnacksPickerManPage xxx links to Special
		SnacksPickerLspEnabled({ Special }), -- SnacksPickerLspEnabled xxx links to Special
		SnacksPickerIcon({ Special }), -- SnacksPickerIcon xxx links to Special
		SnacksPickerGitStatus({ Special }), -- SnacksPickerGitStatus xxx links to Special
		SnacksPickerGitDate({ Special }), -- SnacksPickerGitDate xxx links to Special
		SnacksPickerSpinner({ Special }), -- SnacksPickerSpinner xxx links to Special
		SnacksPickerKeymapLhs({ Special }), -- SnacksPickerKeymapLhs xxx links to Special
		SnacksPickerDir({ NonText }), -- SnacksPickerDir xxx links to NonText
		SnacksPickerKeymapRhs({ NonText }), -- SnacksPickerKeymapRhs xxx links to NonText
		SnacksPickerGitStatusUntracked({ NonText }), -- SnacksPickerGitStatusUntracked xxx links to NonText
		SnacksPickerPathIgnored({ NonText }), -- SnacksPickerPathIgnored xxx links to NonText
		SnacksPickerGitStatusIgnored({ NonText }), -- SnacksPickerGitStatusIgnored xxx links to NonText
		SnacksPickerUnselected({ NonText }), -- SnacksPickerUnselected xxx links to NonText
		SnacksPickerBufFlags({ NonText }), -- SnacksPickerBufFlags xxx links to NonText
		SnacksPickerTotals({ NonText }), -- SnacksPickerTotals xxx links to NonText
		SnacksPickerPathHidden({ NonText }), -- SnacksPickerPathHidden xxx links to NonText
		SnacksPickerDirectory({ Directory }), -- SnacksPickerDirectory xxx links to Directory
		SnacksPickerPickWin({ Search }), -- SnacksPickerPickWin xxx links to Search
		SnacksPickerSearch({ Search }), -- SnacksPickerSearch xxx links to Search
		SnacksPickerPickWinCurrent({ CurSearch }), -- SnacksPickerPickWinCurrent xxx links to CurSearch
		SnacksPickerTree({ LineNr }), -- SnacksPickerTree xxx links to LineNr
		SnacksPickerCol({ LineNr }), -- SnacksPickerCol xxx links to LineNr
		SnacksPickerGitType({ Title }), -- SnacksPickerGitType xxx links to Title
		SnacksPickerGitBranch({ Title }), -- SnacksPickerGitBranch xxx links to Title
		SnacksPickerGitBranchCurrent({ Number }), -- SnacksPickerGitBranchCurrent xxx links to Number
		SnacksPickerGitStatusUnmerged({ DiagnosticError }), -- SnacksPickerGitStatusUnmerged xxx links to DiagnosticError
		SnacksPickerGitDetached({ DiagnosticWarn }), -- SnacksPickerGitDetached xxx links to DiagnosticWarn
		SnacksPickerGitStatusModified({ DiagnosticWarn }), -- SnacksPickerGitStatusModified xxx links to DiagnosticWarn
		SnacksPickerGitCommit({ sym("@variable.builtin") }), -- SnacksPickerGitCommit xxx links to @variable.builtin
		SnacksPickerDimmed({ Conceal }), -- SnacksPickerDimmed xxx links to Conceal
		SnacksPickerInput({ NormalFloat }), -- SnacksPickerInput xxx links to NormalFloat
		SnacksPicker({ NormalFloat }), -- SnacksPicker   xxx links to NormalFloat
		SnacksPickerBorder({ FloatBorder }), -- SnacksPickerBorder xxx links to FloatBorder
		SnacksPickerIconFile({ Normal }), -- SnacksPickerIconFile xxx links to Normal
		SnacksPickerAuEvent({ Constant }), -- SnacksPickerAuEvent xxx links to Constant
		SnacksPickerGitIssue({ Number }), -- SnacksPickerGitIssue xxx links to Number
		SnacksPickerManSection({ Number }), -- SnacksPickerManSection xxx links to Number
		SnacksPickerRegister({ Number }), -- SnacksPickerRegister xxx links to Number
		SnacksPickerIdx({ Number }), -- SnacksPickerIdx xxx links to Number
		SnacksPickerBufNr({ Number }), -- SnacksPickerBufNr xxx links to Number
		SnacksPickerKeymapMode({ Number }), -- SnacksPickerKeymapMode xxx links to Number
		SnacksPickerLspUnavailable({ DiagnosticError }), -- SnacksPickerLspUnavailable xxx links to DiagnosticError
		SnacksPickerLinkBroken({ DiagnosticError }), -- SnacksPickerLinkBroken xxx links to DiagnosticError
		SnacksPickerLspDisabled({ DiagnosticWarn }), -- SnacksPickerLspDisabled xxx links to DiagnosticWarn
		SnacksPickerLspAttached({ DiagnosticWarn }), -- SnacksPickerLspAttached xxx links to DiagnosticWarn
		SnacksPickerLspAttachedBuf({ DiagnosticInfo }), -- SnacksPickerLspAttachedBuf xxx links to DiagnosticInfo
		SnacksPickerGitStatusStaged({ DiagnosticHint }), -- SnacksPickerGitStatusStaged xxx links to DiagnosticHint
		SnacksPickerGitStatusAdded({ Added }), -- SnacksPickerGitStatusAdded xxx links to Added
		SnacksPickerGitScope({ Italic }), -- SnacksPickerGitScope xxx links to Italic
		SnacksPickerToggle({ DiagnosticVirtualTextInfo }), -- SnacksPickerToggle xxx links to DiagnosticVirtualTextInfo
		SnacksPickerComment({ Comment }), -- SnacksPickerComment xxx links to Comment
		SnacksPickerDesc({ Comment }), -- SnacksPickerDesc xxx links to Comment
		SnacksPickerGitStatusDeleted({ Removed }), -- SnacksPickerGitStatusDeleted xxx links to Removed
		SnacksPickerDiagnosticSource({ Comment }), -- SnacksPickerDiagnosticSource xxx links to Comment
		SnacksPickerLink({ Comment }), -- SnacksPickerLink xxx links to Comment
		SnacksPickerIconVariable({ sym("@variable") }), -- SnacksPickerIconVariable xxx links to @variable
		SnacksPickerUndoCurrent({ sym("@variable.builtin") }), -- SnacksPickerUndoCurrent xxx links to @variable.builtin
		SnacksPickerKeymapNowait({ sym("@variable.builtin") }), -- SnacksPickerKeymapNowait xxx links to @variable.builtin
		SnacksPickerIconNull({ sym("@constant.builtin") }), -- SnacksPickerIconNull xxx links to @constant.builtin
		SnacksPickerIconPackage({ sym("@module") }), -- SnacksPickerIconPackage xxx links to @module
		SnacksPickerIconNamespace({ sym("@module") }), -- SnacksPickerIconNamespace xxx links to @module
		SnacksPickerIconModule({ sym("@module") }), -- SnacksPickerIconModule xxx links to @module
		SnacksPickerIconCategory({ sym("@module") }), -- SnacksPickerIconCategory xxx links to @module
		SnacksPickerAuPattern({ String }), -- SnacksPickerAuPattern xxx links to String
		SnacksPickerRow({ String }), -- SnacksPickerRow xxx links to String
		SnacksPickerIconProperty({ sym("@property") }), -- SnacksPickerIconProperty xxx links to @property
		SnacksPickerCmd({ Function }), -- SnacksPickerCmd xxx links to Function
		SnacksPickerCmdBuiltin({ sym("@constructor") }), -- SnacksPickerCmdBuiltin xxx links to @constructor
		SnacksPickerIconConstructor({ sym("@constructor") }), -- SnacksPickerIconConstructor xxx links to @constructor
		SnacksPickerDelim({ Delimiter }), -- SnacksPickerDelim xxx links to Delimiter
		SnacksPickerUndoAdded({ Added }), -- SnacksPickerUndoAdded xxx links to Added
		SnacksPickerUndoRemoved({ Removed }), -- SnacksPickerUndoRemoved xxx links to Removed
		SnacksPickerItalic({ Italic }), -- SnacksPickerItalic xxx links to Italic
		SnacksPickerIconEnumMember({ sym("@lsp.type.enumMember") }), -- SnacksPickerIconEnumMember xxx links to @lsp.type.enumMember
		SnacksPickerGitBreaking({ Error }), -- SnacksPickerGitBreaking xxx links to Error
		SnacksPickerBold({ Bold }), -- SnacksPickerBold xxx links to Bold
		SnacksPickerPrompt({ fg = flamingo }), -- SnacksPickerPrompt xxx guifg=#f2cdcd
		SnacksPickerMatch({ fg = blue }), -- SnacksPickerMatch xxx guifg=#89b4fa
		SnacksPickerSelected({ gui = "bold", bg = surface0, fg = text }), -- SnacksPickerSelected xxx cterm=bold gui=bold guifg=#cdd6f4 guibg=#313244
		SnacksPickerIconField({ sym("@variable.member") }), -- SnacksPickerIconField xxx links to @variable.member
		SnacksPickerIconArray({ sym("@punctuation.bracket") }), -- SnacksPickerIconArray xxx links to @punctuation.bracket

		-- NeoTree
		NeoTreeWinSeparator({ bg = base, fg = base }), -- NeoTreeWinSeparator xxx guifg=#1e1e2e guibg=#1e1e2e
		NeoTreeVertSplit({ bg = base, fg = base }), -- NeoTreeVertSplit xxx guifg=#1e1e2e guibg=#1e1e2e
		NeoTreeTabSeparatorInactive({ bg = base, fg = base }), -- NeoTreeTabSeparatorInactive xxx guifg=#1e1e2e guibg=#1e1e2e
		NeoTreeTabSeparatorActive({ bg = mantle, fg = mantle }), -- NeoTreeTabSeparatorActive xxx guifg=#181825 guibg=#181825
		NeoTreeTabInactive({ bg = base, fg = overlay0 }), -- NeoTreeTabInactive xxx guifg=#6c7086 guibg=#1e1e2e
		NeoTreeTabActive({ gui = "bold", bg = mantle, fg = lavender }), -- NeoTreeTabActive xxx cterm=bold gui=bold guifg=#b4befe guibg=#181825
		NeoTreeFilterTerm({ gui = "bold", fg = green }), -- NeoTreeFilterTerm xxx cterm=bold gui=bold guifg=#a6e3a1
		NeoTreeDimText({ fg = overlay1 }), -- NeoTreeDimText xxx guifg=#7f849c
		NeoTreeFileNameOpened({ fg = pink }), -- NeoTreeFileNameOpened xxx guifg=#f5c2e7
		NeoTreeTitleBar({ bg = blue, fg = mantle }), -- NeoTreeTitleBar xxx guifg=#181825 guibg=#89b4fa
		NeoTreeGitStaged({ fg = green }), -- NeoTreeGitStaged xxx guifg=#a6e3a1
		NeoTreeGitUntracked({ fg = mauve }), -- NeoTreeGitUntracked xxx guifg=#cba6f7
		NeoTreeGitUnstaged({ fg = red }), -- NeoTreeGitUnstaged xxx guifg=#f38ba8
		NeoTreeGitModified({ fg = yellow }), -- NeoTreeGitModified xxx guifg=#f9e2af
		NeoTreeGitIgnored({ fg = overlay0 }), -- NeoTreeGitIgnored xxx guifg=#6c7086
		NeoTreeGitDeleted({ fg = red }), -- NeoTreeGitDeleted xxx guifg=#f38ba8
		NeoTreeGitConflict({ fg = red }), -- NeoTreeGitConflict xxx guifg=#f38ba8
		NeoTreeModified({ fg = peach }), -- NeoTreeModified xxx guifg=#fab387
		NeoTreeRootName({ gui = "bold", fg = blue }), -- NeoTreeRootName xxx cterm=bold gui=bold guifg=#89b4fa
		NeoTreeIndentMarker({ fg = overlay0 }), -- NeoTreeIndentMarker xxx guifg=#6c7086
		NeoTreeExpander({ fg = overlay0 }), -- NeoTreeExpander xxx guifg=#6c7086
		NeoTreeNormal({ bg = mantle, fg = text }), -- NeoTreeNormal  xxx guifg=#cdd6f4 guibg=#181825
		NeoTreeDirectoryIcon({ fg = blue }), -- NeoTreeDirectoryIcon xxx guifg=#89b4fa
		NeoTreeDirectoryName({ fg = blue }), -- NeoTreeDirectoryName xxx guifg=#89b4fa
		NeoTreeFloatTitle({ FloatTitle }), -- NeoTreeFloatTitle xxx links to FloatTitle
		NeoTreeFloatBorder({ FloatBorder }), -- NeoTreeFloatBorder xxx links to FloatBorder
		NeoTreeNormalNC({ bg = mantle, fg = text }), -- NeoTreeNormalNC xxx guifg=#cdd6f4 guibg=#181825
		NeoTreeStatusLineNC({ bg = mantle, fg = mantle }), -- NeoTreeStatusLineNC xxx guifg=#181825 guibg=#181825
		NeoTreeSymbolicLinkTarget({ fg = pink }), -- NeoTreeSymbolicLinkTarget xxx guifg=#f5c2e7
		NeoTreeGitAdded({ fg = green }), -- NeoTreeGitAdded xxx guifg=#a6e3a1

		-- NvimTree
		NvimTreeOpenedFile({ fg = pink }), -- NvimTreeOpenedFile xxx guifg=#f5c2e7
		NvimTreeImageFile({ fg = text }), -- NvimTreeImageFile xxx guifg=#cdd6f4
		NvimTreeSpecialFile({ fg = flamingo }), -- NvimTreeSpecialFile xxx guifg=#f2cdcd
		NvimTreeGitDeleted({ fg = red }), -- NvimTreeGitDeleted xxx guifg=#f38ba8
		NvimTreeGitDirty({ fg = yellow }), -- NvimTreeGitDirty xxx guifg=#f9e2af
		NvimTreeStatuslineNc({ bg = mantle, fg = mantle }), -- NvimTreeStatuslineNc xxx guifg=#181825 guibg=#181825
		NvimTreeSymlink({ fg = pink }), -- NvimTreeSymlink xxx guifg=#f5c2e7
		NvimTreeRootFolder({ gui = "bold", fg = lavender }), -- NvimTreeRootFolder xxx cterm=bold gui=bold guifg=#b4befe
		NvimTreeWinSeparator({ bg = base, fg = base }), -- NvimTreeWinSeparator xxx guifg=#1e1e2e guibg=#1e1e2e
		NvimTreeIndentMarker({ fg = overlay0 }), -- NvimTreeIndentMarker xxx guifg=#6c7086
		NvimTreeEmptyFolderName({ fg = blue }), -- NvimTreeEmptyFolderName xxx guifg=#89b4fa
		NvimTreeOpenedFolderName({ fg = blue }), -- NvimTreeOpenedFolderName xxx guifg=#89b4fa
		NvimTreeNormal({ bg = mantle, fg = text }), -- NvimTreeNormal xxx guifg=#cdd6f4 guibg=#181825
		NvimTreeFolderName({ fg = blue }), -- NvimTreeFolderName xxx guifg=#89b4fa
		NvimTreeGitNew({ fg = blue }), -- NvimTreeGitNew xxx guifg=#89b4fa
		NvimTreeFolderIcon({ fg = blue }), -- NvimTreeFolderIcon xxx guifg=#89b4fa

		-- File pickers
		-- MiniPick
		MiniPickIconDirectory({ Directory }), -- MiniPickIconDirectory xxx links to Directory
		MiniPickPreviewRegion({ IncSearch }), -- MiniPickPreviewRegion xxx links to IncSearch
		MiniPickPromptPrefix({ bg = mantle, fg = flamingo }), -- MiniPickPromptPrefix xxx guifg=#f2cdcd guibg=#181825
		MiniPickPromptCaret({ bg = mantle, fg = flamingo }), -- MiniPickPromptCaret xxx guifg=#f2cdcd guibg=#181825
		MiniPickPrompt({ bg = mantle, fg = text }), -- MiniPickPrompt xxx guifg=#cdd6f4 guibg=#181825
		MiniPickMatchCurrent({ gui = "bold", bg = surface0, fg = flamingo }), -- MiniPickMatchCurrent xxx cterm=bold gui=bold guifg=#f2cdcd guibg=#313244
		MiniPickBorderText({ bg = mantle, fg = mauve }), -- MiniPickBorderText xxx guifg=#cba6f7 guibg=#181825
		MiniPickMatchRanges({ DiagnosticFloatingHint }), -- MiniPickMatchRanges xxx links to DiagnosticFloatingHint
		MiniPickHeader({ DiagnosticFloatingHint }), -- MiniPickHeader xxx links to DiagnosticFloatingHint
		MiniPickBorderBusy({ DiagnosticFloatingWarn }), -- MiniPickBorderBusy xxx links to DiagnosticFloatingWarn
		MiniPickBorder({ FloatBorder }), -- MiniPickBorder xxx links to FloatBorder
		MiniPickNormal({ NormalFloat }), -- MiniPickNormal xxx links to NormalFloat
		MiniPickPreviewLine({ CursorLine }), -- MiniPickPreviewLine xxx links to CursorLine
		MiniPickMatchMarked({ Visual }), -- MiniPickMatchMarked xxx links to Visual

		-- Telescope
		TelescopeNormal({ NormalFloat }), -- TelescopeNormal xxx links to NormalFloat
		TelescopePromptPrefix({ fg = flamingo }), -- TelescopePromptPrefix xxx guifg=#f2cdcd
		TelescopeMatching({ fg = blue }), -- TelescopeMatching xxx guifg=#89b4fa
		TelescopeSelection({ gui = "bold", bg = surface0, fg = flamingo }), -- TelescopeSelection xxx cterm=bold gui=bold guifg=#f2cdcd guibg=#313244
		TelescopeSelectionCaret({ bg = surface0, fg = flamingo }), -- TelescopeSelectionCaret xxx guifg=#f2cdcd guibg=#313244
		TelescopeBorder({ FloatBorder }), -- TelescopeBorder xxx links to FloatBorder
		TelescopeTitle({ FloatTitle }), -- TelescopeTitle xxx links to FloatTitle
		-- Dashboards
		DashboardIcon({ gui = "bold", fg = pink }), -- DashboardIcon  xxx cterm=bold gui=bold guifg=#f5c2e7
		DashboardDesc({ fg = blue }), -- DashboardDesc  xxx guifg=#89b4fa
		DashboardKey({ fg = peach }), -- DashboardKey   xxx guifg=#fab387
		DashboardFiles({ fg = lavender }), -- DashboardFiles xxx guifg=#b4befe
		DashboardProjectTitle({ fg = sky }), -- DashboardProjectTitle xxx guifg=#89dceb
		DashboardMruTitle({ fg = sky }), -- DashboardMruTitle xxx guifg=#89dceb
		DashboardFooter({ gui = "italic", fg = yellow }), -- DashboardFooter xxx cterm=italic gui=italic guifg=#f9e2af
		DashboardCenter({ fg = green }), -- DashboardCenter xxx guifg=#a6e3a1
		DashboardHeader({ fg = blue }), -- DashboardHeader xxx guifg=#89b4fa
		DashboardShortCut({ fg = pink }), -- DashboardShortCut xxx guifg=#f5c2e7

		SnacksDashboardDir({ NonText }), -- SnacksDashboardDir xxx links to NonText
		SnacksDashboardSpecial({ Special }), -- SnacksDashboardSpecial xxx links to Special
		SnacksDashboardNormal({ Normal }), -- SnacksDashboardNormal xxx links to Normal
		SnacksDashboardTitle({ Title }), -- SnacksDashboardTitle xxx links to Title
		SnacksDashboardKey({ fg = peach }), -- SnacksDashboardKey xxx guifg=#fab387
		SnacksDashboardIcon({ gui = "bold", fg = pink }), -- SnacksDashboardIcon xxx cterm=bold gui=bold guifg=#f5c2e7
		SnacksDashboardHeader({ fg = blue }), -- SnacksDashboardHeader xxx guifg=#89b4fa
		SnacksDashboardFooter({ gui = "italic", fg = yellow }), -- SnacksDashboardFooter xxx cterm=italic gui=italic guifg=#f9e2af
		SnacksDashboardFile({ fg = lavender }), -- SnacksDashboardFile xxx guifg=#b4befe
		SnacksDashboardDesc({ fg = blue }), -- SnacksDashboardDesc xxx guifg=#89b4fa
		SnacksWinBar({ Title }), -- SnacksWinBar   xxx links to Title

		SnacksNormalNC({ NormalFloat }), -- SnacksNormalNC xxx links to NormalFloat
		SnacksNormal({ NormalFloat }), -- SnacksNormal   xxx links to NormalFloat

		SnacksInputNormal({ Normal }), -- SnacksInputNormal xxx links to Normal
		SnacksInputTitle({ DiagnosticInfo }), -- SnacksInputTitle xxx links to DiagnosticInfo
		SnacksInputBorder({ DiagnosticInfo }), -- SnacksInputBorder xxx links to DiagnosticInfo
		SnacksInputIcon({ DiagnosticHint }), -- SnacksInputIcon xxx links to DiagnosticHint

		SnacksStatusColumnMark({ DiagnosticHint }), -- SnacksStatusColumnMark xxx links to DiagnosticHint

		SnacksBackdrop({ FloatShadow }), -- SnacksBackdrop xxx links to FloatShadow

		TermCursor({ bg = rosewater, fg = base }), -- TermCursor     xxx guifg=#1e1e2e guibg=#f5e0dc

		MiniDiffOverContext({ DiffChange }), -- MiniDiffOverContext xxx links to DiffChange
		MiniDiffOverAdd({ DiffAdd }), -- MiniDiffOverAdd xxx links to DiffAdd
		MiniDiffOverDelete({ DiffDelete }), -- MiniDiffOverDelete xxx links to DiffDelete
		MiniDiffOverChange({ DiffText }), -- MiniDiffOverChange xxx links to DiffText
		MiniDiffSignDelete({ fg = red }), -- MiniDiffSignDelete xxx guifg=#f38ba8
		MiniDiffSignChange({ fg = yellow }), -- MiniDiffSignChange xxx guifg=#f9e2af
		MiniDiffSignAdd({ fg = green }), -- MiniDiffSignAdd xxx guifg=#a6e3a1

		MiniOperatorsExchangeFrom({ IncSearch }), -- MiniOperatorsExchangeFrom xxx links to IncSearch

		MiniMapSymbolLine({ Title }), -- MiniMapSymbolLine xxx links to Title

		MiniNotifyTitle({ FloatTitle }), -- MiniNotifyTitle xxx links to FloatTitle
		MiniNotifyBorder({ FloatBorder }), -- MiniNotifyBorder xxx links to FloatBorder
		MiniNotifyNormal({ NormalFloat }), -- MiniNotifyNormal xxx links to NormalFloat

		MiniClueSeparator({ DiagnosticFloatingInfo }), -- MiniClueSeparator xxx links to DiagnosticFloatingInfo
		MiniClueNextKey({ DiagnosticFloatingHint }), -- MiniClueNextKey xxx links to DiagnosticFloatingHint
		MiniClueNextKeyWithPostkeys({ DiagnosticFloatingError }), -- MiniClueNextKeyWithPostkeys xxx links to DiagnosticFloatingError
		MiniClueBorder({ FloatBorder }), -- MiniClueBorder xxx links to FloatBorder
		MiniClueDescSingle({ NormalFloat }), -- MiniClueDescSingle xxx links to NormalFloat
		MiniClueTitle({ FloatTitle }), -- MiniClueTitle  xxx links to FloatTitle
		MiniClueDescGroup({ DiagnosticFloatingWarn }), -- MiniClueDescGroup xxx links to DiagnosticFloatingWarn

		NoiceLspProgressTitle({ NonText }), -- NoiceLspProgressTitle xxx links to NonText
		NoiceFormatLevelOff({ NonText }), -- NoiceFormatLevelOff xxx links to NonText
		NoiceFormatLevelTrace({ NonText }), -- NoiceFormatLevelTrace xxx links to NonText
		NoiceFormatLevelDebug({ NonText }), -- NoiceFormatLevelDebug xxx links to NonText
		NoiceFormatKind({ NonText }), -- NoiceFormatKind xxx links to NonText
		NoiceFormatEvent({ NonText }), -- NoiceFormatEvent xxx links to NonText
		NoiceHiddenCursor({ gui = "nocombine", blend = 100 }), -- NoiceHiddenCursor xxx cterm=nocombine gui=nocombine blend=100
		NoiceCmdlinePrompt({ Title }), -- NoiceCmdlinePrompt xxx links to Title
		NoiceLspProgressClient({ Title }), -- NoiceLspProgressClient xxx links to Title
		NoiceFormatTitle({ Title }), -- NoiceFormatTitle xxx links to Title
		NoiceFormatConfirmDefault({ Visual }), -- NoiceFormatConfirmDefault xxx links to Visual
		NoicePopupmenu({ Pmenu }), -- NoicePopupmenu xxx links to Pmenu
		NoicePopupmenuSelected({ PmenuSel }), -- NoicePopupmenuSelected xxx links to PmenuSel
		NoiceScrollbar({ PmenuSbar }), -- NoiceScrollbar xxx links to PmenuSbar
		NoiceScrollbarThumb({ PmenuThumb }), -- NoiceScrollbarThumb xxx links to PmenuThumb
		NoiceFormatConfirm({ CursorLine }), -- NoiceFormatConfirm xxx links to CursorLine
		NoiceFormatProgressTodo({ bg = "#2a2b3c", fg = subtext0 }), -- NoiceFormatProgressTodo xxx guifg=#a6adc8 guibg=#2a2b3c
		NoiceFormatProgressDone({ bg = "#3e5767", fg = subtext0 }), -- NoiceFormatProgressDone xxx guifg=#a6adc8 guibg=#3e5767
		NoiceMini({ fg = subtext0, blend = 0 }), -- NoiceMini      xxx guifg=#a6adc8 blend=0
		NoiceConfirmBorder({ fg = blue }), -- NoiceConfirmBorder xxx guifg=#89b4fa
		NoiceCmdlinePopupBorderSearch({ fg = yellow }), -- NoiceCmdlinePopupBorderSearch xxx guifg=#f9e2af
		NoiceCmdlinePopupTitleSearch({ NoiceCmdlinePopupBorderSearch }), -- NoiceCmdlinePopupTitleSearch xxx links to NoiceCmdlinePopupBorderSearch
		NoiceCmdlinePopupBorder({ fg = lavender }), -- NoiceCmdlinePopupBorder xxx guifg=#b4befe
		NoiceCmdlinePopupBorderCmdline({ NoiceCmdlinePopupBorder }), -- NoiceCmdlinePopupBorderCmdline xxx links to NoiceCmdlinePopupBorder
		NoiceCmdlinePopupBorderCalculator({ NoiceCmdlinePopupBorder }), -- NoiceCmdlinePopupBorderCalculator xxx links to NoiceCmdlinePopupBorder
		NoiceCmdlinePopupBorderFilter({ NoiceCmdlinePopupBorder }), -- NoiceCmdlinePopupBorderFilter xxx links to NoiceCmdlinePopupBorder
		NoiceCmdlinePopupBorderLua({ NoiceCmdlinePopupBorder }), -- NoiceCmdlinePopupBorderLua xxx links to NoiceCmdlinePopupBorder
		NoiceCmdlinePopupBorderHelp({ NoiceCmdlinePopupBorder }), -- NoiceCmdlinePopupBorderHelp xxx links to NoiceCmdlinePopupBorder
		NoiceCmdlinePopupBorderInput({ NoiceCmdlinePopupBorder }), -- NoiceCmdlinePopupBorderInput xxx links to NoiceCmdlinePopupBorder
		NoiceCmdlineIconSearch({ fg = yellow }), -- NoiceCmdlineIconSearch xxx guifg=#f9e2af
		NoiceCmdlineIcon({ gui = "italic", fg = sky }), -- NoiceCmdlineIcon xxx cterm=italic gui=italic guifg=#89dceb
		NoiceCmdlineIconCmdline({ NoiceCmdlineIcon }), -- NoiceCmdlineIconCmdline xxx links to NoiceCmdlineIcon
		NoiceCmdlineIconCalculator({ NoiceCmdlineIcon }), -- NoiceCmdlineIconCalculator xxx links to NoiceCmdlineIcon
		NoiceCmdlineIconFilter({ NoiceCmdlineIcon }), -- NoiceCmdlineIconFilter xxx links to NoiceCmdlineIcon
		NoiceCmdlineIconHelp({ NoiceCmdlineIcon }), -- NoiceCmdlineIconHelp xxx links to NoiceCmdlineIcon
		NoiceCmdlineIconLua({ NoiceCmdlineIcon }), -- NoiceCmdlineIconLua xxx links to NoiceCmdlineIcon
		NoiceCmdlineIconInput({ NoiceCmdlineIcon }), -- NoiceCmdlineIconInput xxx links to NoiceCmdlineIcon
		NoiceCmdline({ fg = text }), -- NoiceCmdline   xxx guifg=#cdd6f4
		NoiceFormatLevelError({ DiagnosticVirtualTextError }), -- NoiceFormatLevelError xxx links to DiagnosticVirtualTextError
		NoiceFormatLevelWarn({ DiagnosticVirtualTextWarn }), -- NoiceFormatLevelWarn xxx links to DiagnosticVirtualTextWarn
		NoiceFormatLevelInfo({ DiagnosticVirtualTextInfo }), -- NoiceFormatLevelInfo xxx links to DiagnosticVirtualTextInfo
		NoiceVirtualText({ DiagnosticVirtualTextInfo }), -- NoiceVirtualText xxx links to DiagnosticVirtualTextInfo
		NoiceCmdlinePopupTitle({ DiagnosticSignInfo }), -- NoiceCmdlinePopupTitle xxx links to DiagnosticSignInfo
		NoiceCompletionItemKindDefault({ Special }), -- NoiceCompletionItemKindDefault xxx links to Special
		NoiceFormatDate({ Special }), -- NoiceFormatDate xxx links to Special
		NoicePopupmenuMatch({ Special }), -- NoicePopupmenuMatch xxx links to Special
		NoiceConfirm({ Normal }), -- NoiceConfirm   xxx links to Normal
		NoiceCmdlinePopup({ Normal }), -- NoiceCmdlinePopup xxx links to Normal
		NoiceCursor({ Cursor }), -- NoiceCursor    xxx links to Cursor
		NoiceSplit({ NormalFloat }), -- NoiceSplit     xxx links to NormalFloat
		NoicePopup({ NormalFloat }), -- NoicePopup     xxx links to NormalFloat
		NoiceSplitBorder({ FloatBorder }), -- NoiceSplitBorder xxx links to FloatBorder
		NoicePopupmenuBorder({ FloatBorder }), -- NoicePopupmenuBorder xxx links to FloatBorder
		NoicePopupBorder({ FloatBorder }), -- NoicePopupBorder xxx links to FloatBorder
		NoiceLspProgressSpinner({ Constant }), -- NoiceLspProgressSpinner xxx links to Constant

		TroubleDirectory({ Directory }), -- TroubleDirectory xxx links to Directory
		TroubleFilename({ Directory }), -- TroubleFilename xxx links to Directory
		TroubleIndent({ LineNr }), -- TroubleIndent  xxx links to LineNr
		TroublePos({ LineNr }), -- TroublePos     xxx links to LineNr
		TroubleIndentFoldClosed({ CursorLineNr }), -- TroubleIndentFoldClosed xxx links to CursorLineNr
		TroublePreview({ Visual }), -- TroublePreview xxx links to Visual
		TroubleIconEvent({ Special }), -- TroubleIconEvent xxx links to Special
		TroubleCode({ Special }), -- TroubleCode    xxx links to Special
		TroubleIconDirectory({ Special }), -- TroubleIconDirectory xxx links to Special
		TroubleIconFile({ Normal }), -- TroubleIconFile xxx links to Normal
		TroubleNormalNC({ NormalFloat }), -- TroubleNormalNC xxx links to NormalFloat
		TroubleIconField({ sym("@variable.member") }), -- TroubleIconField xxx links to @variable.member
		TroubleIconArray({ sym("@punctuation.bracket") }), -- TroubleIconArray xxx links to @punctuation.bracket
		TroubleNormal({ bg = "#11111b", fg = text }), -- TroubleNormal  xxx guifg=#cdd6f4 guibg=#11111b
		TroubleCount({ bg = surface1, fg = pink }), -- TroubleCount   xxx guifg=#f5c2e7 guibg=#45475a
		TroubleFsCount({ TroubleCount }), -- TroubleFsCount xxx links to TroubleCount
		TroubleDiagnosticsCount({ TroubleCount }), -- TroubleDiagnosticsCount xxx links to TroubleCount
		TroubleFzfCount({ TroubleCount }), -- TroubleFzfCount xxx links to TroubleCount
		TroubleLspCount({ TroubleCount }), -- TroubleLspCount xxx links to TroubleCount
		TroubleQfCount({ TroubleCount }), -- TroubleQfCount xxx links to TroubleCount
		TroubleSnacksCount({ TroubleCount }), -- TroubleSnacksCount xxx links to TroubleCount
		TroubleTelescopeCount({ TroubleCount }), -- TroubleTelescopeCount xxx links to TroubleCount
		TroubleProfilerCount({ TroubleCount }), -- TroubleProfilerCount xxx links to TroubleCount
		TroubleText({ fg = green }), -- TroubleText    xxx guifg=#a6e3a1
		TroubleDiagnosticsMessage({ TroubleText }), -- TroubleDiagnosticsMessage xxx links to TroubleText
		TroubleIconEnumMember({ sym("@lsp.type.enumMember") }), -- TroubleIconEnumMember xxx links to @lsp.type.enumMember
		TroubleIconConstructor({ sym("@constructor") }), -- TroubleIconConstructor xxx links to @constructor
		TroubleIconNull({ sym("@constant.builtin") }), -- TroubleIconNull xxx links to @constant.builtin
		TroubleIconPackage({ sym("@module") }), -- TroubleIconPackage xxx links to @module
		TroubleIconNamespace({ sym("@module") }), -- TroubleIconNamespace xxx links to @module
		TroubleIconModule({ sym("@module") }), -- TroubleIconModule xxx links to @module
		TroubleSource({ Comment }), -- TroubleSource  xxx links to Comment
		TroubleDiagnosticsItemSource({ Comment }), -- TroubleDiagnosticsItemSource xxx links to Comment
		TroubleDiagnosticsCode({ Comment }), -- TroubleDiagnosticsCode xxx links to Comment
		TroubleIconVariable({ sym("@variable") }), -- TroubleIconVariable xxx links to @variable
		TroubleIconProperty({ sym("@property") }), -- TroubleIconProperty xxx links to @property

		ErrorMsg({ gui = "bold,italic", fg = red }), -- ErrorMsg       xxx cterm=bold,italic gui=bold,italic guifg=#f38ba8
		NvimInvalidSpacing({ ErrorMsg }), -- NvimInvalidSpacing xxx links to ErrorMsg
		GrugFarResultsMatch({ IncSearch }), -- GrugFarResultsMatch xxx links to IncSearch
		SnippetTabstop({ Visual }), -- SnippetTabstop xxx links to Visual
		CursorLineFold({ FoldColumn }), -- CursorLineFold xxx links to FoldColumn
		GitSignsAddPreview({ DiffAdd }), -- GitSignsAddPreview xxx links to DiffAdd
		GitSignsDeletePreview({ DiffDelete }), -- GitSignsDeletePreview xxx links to DiffDelete
		CursorLineSign({ SignColumn }), -- CursorLineSign xxx links to SignColumn
		PmenuKind({ Pmenu }), -- PmenuKind      xxx links to Pmenu
		PmenuKindSel({ PmenuSel }), -- PmenuKindSel   xxx links to PmenuSel
		PmenuMatch({ gui = "bold" }), -- PmenuMatch     xxx cterm=bold gui=bold
		PmenuMatchSel({ gui = "bold" }), -- PmenuMatchSel  xxx cterm=bold gui=bold
		PmenuExtra({ fg = overlay0 }), -- PmenuExtra     xxx guifg=#6c7086
		PmenuExtraSel({ gui = "bold", fg = overlay0 }), -- PmenuExtraSel  xxx cterm=bold gui=bold guifg=#6c7086
		NormalNC({ bg = base, fg = text }), -- NormalNC       xxx guifg=#cdd6f4 guibg=#1e1e2e
		FlashPrompt({ NormalFloat }), -- FlashPrompt    xxx links to NormalFloat
		DapUIFloatBorder({ FloatBorder }), -- DapUIFloatBorder xxx links to FloatBorder
		WinBar({ fg = rosewater }), -- WinBar         xxx guifg=#f5e0dc
		WinBarNC({ WinBar }), -- WinBarNC       xxx links to WinBar

		FloatFooter({ FloatTitle }), -- FloatFooter    xxx links to FloatTitle
		RedrawDebugNormal({ gui = "reverse" }), -- RedrawDebugNormal xxx cterm=reverse gui=reverse
		sym("@text.underline")({ Underlined }), -- @text.underline xxx links to Underlined
		lCursor({ bg = rosewater, fg = base }), -- lCursor        xxx guifg=#1e1e2e guibg=#f5e0dc
		CursorIM({ bg = rosewater, fg = base }), -- CursorIM       xxx guifg=#1e1e2e guibg=#f5e0dc
		VisualNOS({ gui = "bold", bg = surface1 }), -- VisualNOS      xxx cterm=bold gui=bold guibg=#45475a
		Ignore({ Normal }), -- Ignore         xxx links to Normal
		NvimSpacing({ Normal }), -- NvimSpacing    xxx links to Normal
		Character({ fg = teal }), -- Character      xxx guifg=#94e2d5
		sym("@character")({ Character }), -- @character     xxx links to Character
		sym("@attribute")({ Constant }), -- @attribute     xxx links to Constant
		Float({ Number }), -- Float          xxx links to Number
		sym("@number")({ Number }), -- @number        xxx links to Number
		NvimNumber({ Number }), -- NvimNumber     xxx links to Number
		sym("@boolean")({ Boolean }), -- @boolean       xxx links to Boolean
		Conditional({ gui = "italic", fg = mauve }), -- Conditional    xxx cterm=italic gui=italic guifg=#cba6f7
		sym("@conditional")({ Conditional }), -- @conditional   xxx links to Conditional
		Repeat({ fg = mauve }), -- Repeat         xxx guifg=#cba6f7
		sym("@repeat")({ Repeat }), -- @repeat        xxx links to Repeat
		Label({ fg = sapphire }), -- Label          xxx guifg=#74c7ec
		sym("@label")({ Label }), -- @label         xxx links to Label
		Keyword({ fg = mauve }), -- Keyword        xxx guifg=#cba6f7
		sym("@type.qualifier")({ Keyword }), -- @type.qualifier xxx links to Keyword
		sym("@storageclass")({ Keyword }), -- @storageclass  xxx links to Keyword
		Exception({ fg = mauve }), -- Exception      xxx guifg=#cba6f7
		sym("@exception")({ Exception }), -- @exception     xxx links to Exception
		Include({ fg = mauve }), -- Include        xxx guifg=#cba6f7
		sym("@include")({ Include }), -- @include       xxx links to Include
		sym("@preproc")({ PreProc }), -- @preproc       xxx links to PreProc
		sym("@type")({ Type }), -- @type          xxx links to Type
		sym("@type.definition")({ Type }), -- @type.definition xxx links to Type
		NvimNumberPrefix({ Type }), -- NvimNumberPrefix xxx links to Type
		NvimOptionSigil({ Type }), -- NvimOptionSigil xxx links to Type
		Tag({ gui = "bold", fg = lavender }), -- Tag            xxx cterm=bold gui=bold guifg=#b4befe
		SpecialChar({ Special }), -- SpecialChar    xxx links to Special
		Debug({ Special }), -- Debug          xxx links to Special
		sym("@module.builtin")({ Special }), -- @module.builtin xxx links to Special
		sym("@string.special")({ Special }), -- @string.special xxx links to Special
		sym("@attribute.builtin")({ Special }), -- @attribute.builtin xxx links to Special
		sym("@punctuation.special")({ Special }), -- @punctuation.special xxx links to Special
		sym("@string.special.path")({ Special }), -- @string.special.path xxx links to Special

		lualine_x_11({ DiagnosticError }), -- lualine_x_11   xxx links to DiagnosticError

		NvimString({ String }), -- NvimString     xxx links to String
		AerialPropertyIcon({ sym("@property") }), -- AerialPropertyIcon xxx links to @property
		NvimIdentifier({ Identifier }), -- NvimIdentifier xxx links to Identifier
		zshKSHFunction({ Function }), -- zshKSHFunction xxx links to Function
		AerialConstructorIcon({ sym("@constructor") }), -- AerialConstructorIcon xxx links to @constructor
		NvimAssignment({ Operator }), -- NvimAssignment xxx links to Operator
		NvimOperator({ Operator }), -- NvimOperator   xxx links to Operator
		NvimParenthesis({ Delimiter }), -- NvimParenthesis xxx links to Delimiter
		NvimColon({ Delimiter }), -- NvimColon      xxx links to Delimiter
		NvimComma({ Delimiter }), -- NvimComma      xxx links to Delimiter
		NvimArrow({ Delimiter }), -- NvimArrow      xxx links to Delimiter
		RedrawDebugClear({ bg = "nvimdarkyellow" }), -- RedrawDebugClear xxx ctermfg=0 ctermbg=11 guibg=NvimDarkYellow
		RedrawDebugComposed({ bg = "nvimdarkgreen" }), -- RedrawDebugComposed xxx ctermfg=0 ctermbg=10 guibg=NvimDarkGreen
		RedrawDebugRecompose({ bg = "nvimdarkred" }), -- RedrawDebugRecompose xxx ctermfg=0 ctermbg=9 guibg=NvimDarkRed
		NvimInvalid({ Error }), -- NvimInvalid    xxx links to Error
		sym("@error")({ Error }), -- @error         xxx links to Error
		NvimInternalError({ bg = "red", fg = "red" }), -- NvimInternalError xxx ctermfg=9 ctermbg=9 guifg=Red guibg=Red
		NvimFigureBrace({ NvimInternalError }), -- NvimFigureBrace xxx links to NvimInternalError
		NvimSingleQuotedUnknownEscape({ NvimInternalError }), -- NvimSingleQuotedUnknownEscape xxx links to NvimInternalError
		NvimInvalidSingleQuotedUnknownEscape({ NvimInternalError }), -- NvimInvalidSingleQuotedUnknownEscape xxx links to NvimInternalError
		Headline6({ bg = surface0, fg = lavender }), -- Headline6      xxx guifg=#b4befe guibg=#313244
		Headline5({ bg = surface0, fg = sapphire }), -- Headline5      xxx guifg=#74c7ec guibg=#313244
		Headline4({ bg = surface0, fg = green }), -- Headline4      xxx guifg=#a6e3a1 guibg=#313244
		Headline3({ bg = surface0, fg = yellow }), -- Headline3      xxx guifg=#f9e2af guibg=#313244
		Headline2({ bg = surface0, fg = peach }), -- Headline2      xxx guifg=#fab387 guibg=#313244
		Headline1({ bg = surface0, fg = red }), -- Headline1      xxx guifg=#f38ba8 guibg=#313244
		Headline({ Headline1 }), -- Headline       xxx links to Headline1
		CodeBlock({ bg = mantle }), -- CodeBlock      xxx guibg=#181825
		Dash({ gui = "bold", fg = overlay2 }), -- Dash           xxx cterm=bold gui=bold guifg=#9399b2
		csvCol8({ fg = pink }), -- csvCol8        xxx guifg=#f5c2e7
		csvCol7({ fg = mauve }), -- csvCol7        xxx guifg=#cba6f7
		csvCol6({ fg = lavender }), -- csvCol6        xxx guifg=#b4befe
		csvCol5({ fg = blue }), -- csvCol5        xxx guifg=#89b4fa
		csvCol4({ fg = sky }), -- csvCol4        xxx guifg=#89dceb
		csvCol3({ fg = green }), -- csvCol3        xxx guifg=#a6e3a1
		csvCol2({ fg = yellow }), -- csvCol2        xxx guifg=#f9e2af
		csvCol1({ fg = peach }), -- csvCol1        xxx guifg=#fab387
		csvCol0({ fg = red }), -- csvCol0        xxx guifg=#f38ba8
		GlyphPalette9({ fg = red }), -- GlyphPalette9  xxx guifg=#f38ba8
		GlyphPalette7({ fg = text }), -- GlyphPalette7  xxx guifg=#cdd6f4
		GlyphPalette6({ fg = teal }), -- GlyphPalette6  xxx guifg=#94e2d5
		GlyphPalette4({ fg = blue }), -- GlyphPalette4  xxx guifg=#89b4fa
		GlyphPalette3({ fg = yellow }), -- GlyphPalette3  xxx guifg=#f9e2af
		GlyphPalette2({ fg = teal }), -- GlyphPalette2  xxx guifg=#94e2d5
		GlyphPalette1({ fg = red }), -- GlyphPalette1  xxx guifg=#f38ba8
		healthWarning({ fg = yellow }), -- healthWarning  xxx guifg=#f9e2af
		healthSuccess({ fg = teal }), -- healthSuccess  xxx guifg=#94e2d5
		healthError({ fg = red }), -- healthError    xxx guifg=#f38ba8
		illuminatedCurWord({ bg = surface1 }), -- illuminatedCurWord xxx guibg=#45475a
		illuminatedWord({ bg = surface1 }), -- illuminatedWord xxx guibg=#45475a
		debugBreakpoint({ bg = base, fg = overlay0 }), -- debugBreakpoint xxx guifg=#6c7086 guibg=#1e1e2e
		debugPC({ bg = "#11111b" }), -- debugPC        xxx guibg=#11111b
		mkdCodeEnd({ gui = "bold", fg = flamingo }), -- mkdCodeEnd     xxx cterm=bold gui=bold guifg=#f2cdcd
		mkdCodeStart({ gui = "bold", fg = flamingo }), -- mkdCodeStart   xxx cterm=bold gui=bold guifg=#f2cdcd
		mkdCodeDelimiter({ bg = base, fg = text }), -- mkdCodeDelimiter xxx guifg=#cdd6f4 guibg=#1e1e2e
		htmlH2({ gui = "bold", fg = blue }), -- htmlH2         xxx cterm=bold gui=bold guifg=#89b4fa
		htmlH1({ gui = "bold", fg = pink }), -- htmlH1         xxx cterm=bold gui=bold guifg=#f5c2e7
		qfFileName({ fg = blue }), -- qfFileName     xxx guifg=#89b4fa
		qfLineNr({ fg = yellow }), -- qfLineNr       xxx guifg=#f9e2af
		GitSignsCurrentLineBlame({ fg = surface1 }), -- GitSignsCurrentLineBlame xxx guifg=#45475a
		GitSignsChangeInline({ bg = "#2d334b" }), -- GitSignsChangeInline xxx guibg=#2d334b
		GitSignsDeleteInline({ bg = "#6b455a" }), -- GitSignsDeleteInline xxx guibg=#6b455a
		GitSignsAddInline({ bg = "#4f6557" }), -- GitSignsAddInline xxx guibg=#4f6557
		FlashCurrent({ bg = base, fg = peach }), -- FlashCurrent   xxx guifg=#fab387 guibg=#1e1e2e
		FlashMatch({ bg = base, fg = lavender }), -- FlashMatch     xxx guifg=#b4befe guibg=#1e1e2e
		FlashLabel({ gui = "bold", bg = base, fg = green }), -- FlashLabel     xxx cterm=bold gui=bold guifg=#a6e3a1 guibg=#1e1e2e
		FlashBackdrop({ fg = overlay0 }), -- FlashBackdrop  xxx guifg=#6c7086
		NotifyTRACETitle({ gui = "italic", fg = rosewater }), -- NotifyTRACETitle xxx cterm=italic gui=italic guifg=#f5e0dc
		NotifyTRACEIcon({ fg = rosewater }), -- NotifyTRACEIcon xxx guifg=#f5e0dc
		NotifyTRACEBorder({ fg = rosewater }), -- NotifyTRACEBorder xxx guifg=#f5e0dc
		NotifyDEBUGTitle({ gui = "italic", fg = peach }), -- NotifyDEBUGTitle xxx cterm=italic gui=italic guifg=#fab387
		NotifyDEBUGIcon({ fg = peach }), -- NotifyDEBUGIcon xxx guifg=#fab387
		NotifyDEBUGBorder({ fg = peach }), -- NotifyDEBUGBorder xxx guifg=#fab387
		NotifyINFOTitle({ gui = "italic", fg = blue }), -- NotifyINFOTitle xxx cterm=italic gui=italic guifg=#89b4fa
		NotifyINFOIcon({ fg = blue }), -- NotifyINFOIcon xxx guifg=#89b4fa
		NotifyINFOBorder({ fg = blue }), -- NotifyINFOBorder xxx guifg=#89b4fa
		NotifyWARNTitle({ gui = "italic", fg = yellow }), -- NotifyWARNTitle xxx cterm=italic gui=italic guifg=#f9e2af
		NotifyWARNIcon({ fg = yellow }), -- NotifyWARNIcon xxx guifg=#f9e2af
		NotifyWARNBorder({ fg = yellow }), -- NotifyWARNBorder xxx guifg=#f9e2af
		NotifyERRORTitle({ gui = "italic", fg = red }), -- NotifyERRORTitle xxx cterm=italic gui=italic guifg=#f38ba8
		NotifyERRORIcon({ fg = red }), -- NotifyERRORIcon xxx guifg=#f38ba8
		NotifyERRORBorder({ fg = red }), -- NotifyERRORBorder xxx guifg=#f38ba8
		NotifyBackground({ bg = mantle }), -- NotifyBackground xxx guibg=#181825
		AlphaFooter({ gui = "italic", fg = yellow }), -- AlphaFooter    xxx cterm=italic gui=italic guifg=#f9e2af
		AlphaHeaderLabel({ fg = peach }), -- AlphaHeaderLabel xxx guifg=#fab387
		AlphaHeader({ fg = blue }), -- AlphaHeader    xxx guifg=#89b4fa

		NormalSB({ bg = "#11111b", fg = text }), -- NormalSB       xxx guifg=#cdd6f4 guibg=#11111b

		NeotestUnknown({ fg = text }), -- NeotestUnknown xxx guifg=#cdd6f4
		NeotestTarget({ fg = red }), -- NeotestTarget  xxx guifg=#f38ba8
		NeotestMarked({ gui = "bold", fg = peach }), -- NeotestMarked  xxx cterm=bold gui=bold guifg=#fab387
		NeotestWinSelect({ gui = "bold", fg = blue }), -- NeotestWinSelect xxx cterm=bold gui=bold guifg=#89b4fa
		NeotestAdapterName({ fg = maroon }), -- NeotestAdapterName xxx guifg=#eba0ac
		NeotestExpandMarker({ fg = overlay1 }), -- NeotestExpandMarker xxx guifg=#7f849c
		NeotestIndent({ fg = overlay1 }), -- NeotestIndent  xxx guifg=#7f849c
		NeotestDir({ fg = blue }), -- NeotestDir     xxx guifg=#89b4fa
		NeotestFile({ fg = blue }), -- NeotestFile    xxx guifg=#89b4fa
		NeotestFocused({ gui = "bold,underline" }), -- NeotestFocused xxx cterm=bold,underline gui=bold,underline
		NeotestNamespace({ fg = mauve }), -- NeotestNamespace xxx guifg=#cba6f7
		NeotestTest({ fg = text }), -- NeotestTest    xxx guifg=#cdd6f4
		NeotestSkipped({ fg = blue }), -- NeotestSkipped xxx guifg=#89b4fa
		NeotestRunning({ fg = yellow }), -- NeotestRunning xxx guifg=#f9e2af
		NeotestFailed({ fg = red }), -- NeotestFailed  xxx guifg=#f38ba8
		NeotestPassed({ fg = green }), -- NeotestPassed  xxx guifg=#a6e3a1

		RainbowDelimiterCyan({ fg = teal }), -- RainbowDelimiterCyan xxx guifg=#94e2d5
		RainbowDelimiterViolet({ fg = mauve }), -- RainbowDelimiterViolet xxx guifg=#cba6f7
		RainbowDelimiterGreen({ fg = green }), -- RainbowDelimiterGreen xxx guifg=#a6e3a1
		RainbowDelimiterOrange({ fg = peach }), -- RainbowDelimiterOrange xxx guifg=#fab387
		RainbowDelimiterBlue({ fg = blue }), -- RainbowDelimiterBlue xxx guifg=#89b4fa
		RainbowDelimiterYellow({ fg = yellow }), -- RainbowDelimiterYellow xxx guifg=#f9e2af
		RainbowDelimiterRed({ fg = red }), -- RainbowDelimiterRed xxx guifg=#f38ba8

		LeapLabel({ gui = "nocombine", bg = "#b7efb2", fg = base }), -- LeapLabel      xxx cterm=nocombine gui=nocombine guifg=#1e1e2e guibg=#b7efb2
		LeapMatch({ gui = "underline,nocombine", fg = "#b7efb2" }), -- LeapMatch      xxx cterm=underline,nocombine gui=underline,nocombine guifg=#b7efb2
		UfoFoldedEllipsis({ bg = blue, fg = "#11111b" }), -- UfoFoldedEllipsis xxx guifg=#11111b guibg=#89b4fa
		UfoFoldedFg({ fg = lavender }), -- UfoFoldedFg    xxx guifg=#b4befe
		IlluminatedWordWrite({ bg = "#393b4d" }), -- IlluminatedWordWrite xxx guibg=#393b4d

		CmpItemKindCopilot({ fg = teal }), -- CmpItemKindCopilot xxx guifg=#94e2d5
		CmpItemKindTypeParameter({ fg = blue }), -- CmpItemKindTypeParameter xxx guifg=#89b4fa
		CmpItemKindOperator({ fg = blue }), -- CmpItemKindOperator xxx guifg=#89b4fa
		CmpItemKindEvent({ fg = blue }), -- CmpItemKindEvent xxx guifg=#89b4fa
		CmpItemKindValue({ fg = peach }), -- CmpItemKindValue xxx guifg=#fab387
		CmpItemKindStruct({ fg = blue }), -- CmpItemKindStruct xxx guifg=#89b4fa
		CmpItemKindEnumMember({ fg = red }), -- CmpItemKindEnumMember xxx guifg=#f38ba8
		CmpItemKindReference({ fg = red }), -- CmpItemKindReference xxx guifg=#f38ba8
		CmpItemKindColor({ fg = red }), -- CmpItemKindColor xxx guifg=#f38ba8
		CmpItemKindInterface({ fg = yellow }), -- CmpItemKindInterface xxx guifg=#f9e2af
		CmpItemKindFile({ fg = blue }), -- CmpItemKindFile xxx guifg=#89b4fa
		CmpItemKindVariable({ fg = flamingo }), -- CmpItemKindVariable xxx guifg=#f2cdcd
		CmpItemKindClass({ fg = yellow }), -- CmpItemKindClass xxx guifg=#f9e2af
		CmpItemKindUnit({ fg = green }), -- CmpItemKindUnit xxx guifg=#a6e3a1
		CmpItemKindEnum({ fg = green }), -- CmpItemKindEnum xxx guifg=#a6e3a1
		CmpItemKindProperty({ fg = green }), -- CmpItemKindProperty xxx guifg=#a6e3a1
		CmpItemKindField({ fg = green }), -- CmpItemKindField xxx guifg=#a6e3a1
		CmpItemKindConstant({ fg = peach }), -- CmpItemKindConstant xxx guifg=#fab387
		CmpItemKindModule({ fg = blue }), -- CmpItemKindModule xxx guifg=#89b4fa
		CmpItemKindFolder({ fg = blue }), -- CmpItemKindFolder xxx guifg=#89b4fa
		CmpItemKindFunction({ fg = blue }), -- CmpItemKindFunction xxx guifg=#89b4fa
		CmpItemKindConstructor({ fg = blue }), -- CmpItemKindConstructor xxx guifg=#89b4fa
		CmpItemKindMethod({ fg = blue }), -- CmpItemKindMethod xxx guifg=#89b4fa
		CmpItemKindText({ fg = teal }), -- CmpItemKindText xxx guifg=#94e2d5
		CmpItemKindKeyword({ fg = red }), -- CmpItemKindKeyword xxx guifg=#f38ba8
		CmpItemKindSnippet({ fg = mauve }), -- CmpItemKindSnippet xxx guifg=#cba6f7
		CmpItemAbbrMatchFuzzy({ gui = "bold", fg = text }), -- CmpItemAbbrMatchFuzzy xxx cterm=bold gui=bold guifg=#cdd6f4
		CmpItemAbbrMatch({ gui = "bold", fg = text }), -- CmpItemAbbrMatch xxx cterm=bold gui=bold guifg=#cdd6f4
		CmpItemMenu({ fg = text }), -- CmpItemMenu    xxx guifg=#cdd6f4
		CmpItemKind({ fg = blue }), -- CmpItemKind    xxx guifg=#89b4fa
		CmpItemAbbrDeprecated({ gui = "strikethrough", fg = overlay0 }), -- CmpItemAbbrDeprecated xxx cterm=strikethrough gui=strikethrough guifg=#6c7086
		CmpItemAbbr({ fg = overlay2 }), -- CmpItemAbbr    xxx guifg=#9399b2

		SignColumnSB({ bg = "#11111b", fg = surface1 }), -- SignColumnSB   xxx guifg=#45475a guibg=#11111b

		DapUIWinSelect({ fg = peach }), -- DapUIWinSelect xxx guifg=#fab387
		DapUIUnavailable({ fg = surface1 }), -- DapUIUnavailable xxx guifg=#45475a
		DapUIUnavailableNC({ DapUIUnavailable }), -- DapUIUnavailableNC xxx links to DapUIUnavailable
		DapUIRestart({ fg = green }), -- DapUIRestart   xxx guifg=#a6e3a1
		DapUIRestartNC({ DapUIRestart }), -- DapUIRestartNC xxx links to DapUIRestart
		DapUIPlayPause({ fg = green }), -- DapUIPlayPause xxx guifg=#a6e3a1
		DapUIPlayPauseNC({ DapUIPlayPause }), -- DapUIPlayPauseNC xxx links to DapUIPlayPause
		DapUIStop({ fg = red }), -- DapUIStop      xxx guifg=#f38ba8
		DapUIStopNC({ DapUIStop }), -- DapUIStopNC    xxx links to DapUIStop
		DapUIStepOut({ fg = blue }), -- DapUIStepOut   xxx guifg=#89b4fa
		DapUIStepOutNC({ DapUIStepOut }), -- DapUIStepOutNC xxx links to DapUIStepOut
		DapUIStepBack({ fg = blue }), -- DapUIStepBack  xxx guifg=#89b4fa
		DapUIStepBackNC({ DapUIStepBack }), -- DapUIStepBackNC xxx links to DapUIStepBack
		DapUIStepInto({ fg = blue }), -- DapUIStepInto  xxx guifg=#89b4fa
		DapUIStepIntoNC({ DapUIStepInto }), -- DapUIStepIntoNC xxx links to DapUIStepInto
		DapUIStepOver({ fg = blue }), -- DapUIStepOver  xxx guifg=#89b4fa
		DapUIStepOverNC({ DapUIStepOver }), -- DapUIStepOverNC xxx links to DapUIStepOver
		DapUIBreakpointsDisabledLine({ fg = surface2 }), -- DapUIBreakpointsDisabledLine xxx guifg=#585b70
		DapUIBreakpointsCurrentLine({ gui = "bold", fg = green }), -- DapUIBreakpointsCurrentLine xxx cterm=bold gui=bold guifg=#a6e3a1
		DapUIBreakpointsInfo({ fg = green }), -- DapUIBreakpointsInfo xxx guifg=#a6e3a1
		DapUIBreakpointsPath({ fg = sky }), -- DapUIBreakpointsPath xxx guifg=#89dceb
		DapUIWatchesError({ fg = maroon }), -- DapUIWatchesError xxx guifg=#eba0ac
		DapUIWatchesValue({ fg = green }), -- DapUIWatchesValue xxx guifg=#a6e3a1
		DapUIWatchesEmpty({ fg = maroon }), -- DapUIWatchesEmpty xxx guifg=#eba0ac
		DapUILineNumber({ fg = sky }), -- DapUILineNumber xxx guifg=#89dceb
		DapUISource({ fg = lavender }), -- DapUISource    xxx guifg=#b4befe
		DapUIStoppedThread({ fg = sky }), -- DapUIStoppedThread xxx guifg=#89dceb
		DapUIThread({ fg = green }), -- DapUIThread    xxx guifg=#a6e3a1
		DapUIDecoration({ fg = sky }), -- DapUIDecoration xxx guifg=#89dceb
		DapUIModifiedValue({ fg = peach }), -- DapUIModifiedValue xxx guifg=#fab387
		DapUIVariable({ fg = text }), -- DapUIVariable  xxx guifg=#cdd6f4
		DapUIValue({ fg = sky }), -- DapUIValue     xxx guifg=#89dceb
		DapUIType({ fg = mauve }), -- DapUIType      xxx guifg=#cba6f7
		DapUIScope({ fg = sky }), -- DapUIScope     xxx guifg=#89dceb

		DapStopped({ fg = maroon }), -- DapStopped     xxx guifg=#eba0ac
		DapLogPoint({ fg = sky }), -- DapLogPoint    xxx guifg=#89dceb
		DapBreakpointRejected({ fg = mauve }), -- DapBreakpointRejected xxx guifg=#cba6f7
		DapBreakpointCondition({ fg = yellow }), -- DapBreakpointCondition xxx guifg=#f9e2af
		DapBreakpoint({ fg = red }), -- DapBreakpoint  xxx guifg=#f38ba8

		NeogitChangeRenamed({ gui = "bold", fg = mauve }), -- NeogitChangeRenamed xxx cterm=bold gui=bold guifg=#cba6f7
		NeogitChangeUpdated({ gui = "bold", fg = peach }), -- NeogitChangeUpdated xxx cterm=bold gui=bold guifg=#fab387
		NeogitGraphBoldPurple({ gui = "bold", fg = lavender }), -- NeogitGraphBoldPurple xxx cterm=bold gui=bold guifg=#b4befe
		NeogitGraphBoldGreen({ gui = "bold", fg = green }), -- NeogitGraphBoldGreen xxx cterm=bold gui=bold guifg=#a6e3a1
		NeogitDiffContext({ bg = base }), -- NeogitDiffContext xxx guibg=#1e1e2e
		NeogitRecentcommits({ gui = "bold", fg = mauve }), -- NeogitRecentcommits xxx cterm=bold gui=bold guifg=#cba6f7
		NeogitNotificationError({ fg = red }), -- NeogitNotificationError xxx guifg=#f38ba8
		NeogitPopupSwitchKey({ fg = lavender }), -- NeogitPopupSwitchKey xxx guifg=#b4befe
		NeogitNotificationInfo({ fg = blue }), -- NeogitNotificationInfo xxx guifg=#89b4fa
		NeogitPopupBold({ gui = "bold" }), -- NeogitPopupBold xxx cterm=bold gui=bold
		NeogitGraphBoldWhite({ gui = "bold" }), -- NeogitGraphBoldWhite xxx cterm=bold gui=bold
		NeogitStashes({ gui = "bold", fg = mauve }), -- NeogitStashes  xxx cterm=bold gui=bold guifg=#cba6f7
		NeogitStagedchanges({ gui = "bold", fg = mauve }), -- NeogitStagedchanges xxx cterm=bold gui=bold guifg=#cba6f7
		NeogitUnstagedchanges({ gui = "bold", fg = mauve }), -- NeogitUnstagedchanges xxx cterm=bold gui=bold guifg=#cba6f7
		NeogitGraphBoldBlue({ gui = "bold", fg = blue }), -- NeogitGraphBoldBlue xxx cterm=bold gui=bold guifg=#89b4fa
		NeogitGraphBoldCyan({ gui = "bold", fg = blue }), -- NeogitGraphBoldCyan xxx cterm=bold gui=bold guifg=#89b4fa
		NeogitGraphBoldGray({ gui = "bold", fg = subtext1 }), -- NeogitGraphBoldGray xxx cterm=bold gui=bold guifg=#bac2de
		NeogitChangeBothModified({ gui = "bold", fg = yellow }), -- NeogitChangeBothModified xxx cterm=bold gui=bold guifg=#f9e2af
		NeogitChangeCopied({ gui = "bold", fg = pink }), -- NeogitChangeCopied xxx cterm=bold gui=bold guifg=#f5c2e7
		NeogitGraphBlue({ fg = blue }), -- NeogitGraphBlue xxx guifg=#89b4fa
		NeogitGraphBoldYellow({ gui = "bold", fg = yellow }), -- NeogitGraphBoldYellow xxx cterm=bold gui=bold guifg=#f9e2af
		NeogitCommitViewHeader({ bg = "#3e4b6b", fg = blue }), -- NeogitCommitViewHeader xxx guifg=#97bbf9 guibg=#3e4b6b
		NeogitChangeDeleted({ gui = "bold", fg = red }), -- NeogitChangeDeleted xxx cterm=bold gui=bold guifg=#f38ba8
		NeogitChangeModified({ gui = "bold", fg = blue }), -- NeogitChangeModified xxx cterm=bold gui=bold guifg=#89b4fa
		NeogitGraphCyan({ fg = blue }), -- NeogitGraphCyan xxx guifg=#89b4fa
		NeogitChangeAdded({ gui = "bold", fg = green }), -- NeogitChangeAdded xxx cterm=bold gui=bold guifg=#a6e3a1
		NeogitChangeNewFile({ gui = "bold", fg = green }), -- NeogitChangeNewFile xxx cterm=bold gui=bold guifg=#a6e3a1
		NeogitRebasing({ gui = "bold", fg = mauve }), -- NeogitRebasing xxx cterm=bold gui=bold guifg=#cba6f7
		NeogitPopupOptionKey({ fg = lavender }), -- NeogitPopupOptionKey xxx guifg=#b4befe
		NeogitPopupConfigKey({ fg = lavender }), -- NeogitPopupConfigKey xxx guifg=#b4befe
		NeogitPopupActionKey({ fg = lavender }), -- NeogitPopupActionKey xxx guifg=#b4befe
		NeogitFilePath({ gui = "italic", fg = blue }), -- NeogitFilePath xxx cterm=italic gui=italic guifg=#89b4fa
		NeogitNotificationWarning({ fg = yellow }), -- NeogitNotificationWarning xxx guifg=#f9e2af
		NeogitGraphRed({ fg = red }), -- NeogitGraphRed xxx guifg=#f38ba8
		NeogitGraphBoldRed({ gui = "bold", fg = red }), -- NeogitGraphBoldRed xxx cterm=bold gui=bold guifg=#f38ba8
		NeogitGraphOrange({ fg = peach }), -- NeogitGraphOrange xxx guifg=#fab387
		NeogitGraphGray({ fg = subtext1 }), -- NeogitGraphGray xxx guifg=#bac2de
		NeogitGraphPurple({ fg = lavender }), -- NeogitGraphPurple xxx guifg=#b4befe
		NeogitGraphGreen({ fg = green }), -- NeogitGraphGreen xxx guifg=#a6e3a1
		NeogitGraphYellow({ fg = yellow }), -- NeogitGraphYellow xxx guifg=#f9e2af
		NeogitGraphWhite({ fg = base }), -- NeogitGraphWhite xxx guifg=#1e1e2e
		NeogitUnpulledchanges({ gui = "bold", fg = mauve }), -- NeogitUnpulledchanges xxx cterm=bold gui=bold guifg=#cba6f7
		NeogitUnmergedchanges({ gui = "bold", fg = mauve }), -- NeogitUnmergedchanges xxx cterm=bold gui=bold guifg=#cba6f7
		NeogitUntrackedfiles({ gui = "bold", fg = mauve }), -- NeogitUntrackedfiles xxx cterm=bold gui=bold guifg=#cba6f7
		NeogitDiffAdd({ bg = "#2b3139", fg = green }), -- NeogitDiffAdd  xxx guifg=#8bbc8a guibg=#2b3139
		NeogitDiffDelete({ bg = "#32283a", fg = "#c87590" }), -- NeogitDiffDelete xxx guifg=#c87590 guibg=#32283a
		NeogitDiffAddHighlight({ bg = "#4d6256", fg = green.li(50) }), -- NeogitDiffAddHighlight xxx guifg=#ace1ad guibg=#4d6256
		NeogitDiffDeleteHighlight({ bg = "#674458", fg = "#ed96b3" }), -- NeogitDiffDeleteHighlight xxx guifg=#ed96b3 guibg=#674458
		NeogitDiffContextHighlight({ bg = surface0 }), -- NeogitDiffContextHighlight xxx guibg=#313244
		NeogitHunkHeaderHighlight({ bg = "#353e5a", fg = blue }), -- NeogitHunkHeaderHighlight xxx guifg=#89b4fa guibg=#353e5a
		NeogitHunkHeader({ bg = "#282c41", fg = "#546994" }), -- NeogitHunkHeader xxx guifg=#546994 guibg=#282c41
		NeogitRemote({ gui = "bold", fg = green }), -- NeogitRemote   xxx cterm=bold gui=bold guifg=#a6e3a1
		NeogitBranch({ gui = "bold", fg = peach }), -- NeogitBranch   xxx cterm=bold gui=bold guifg=#fab387
		NeogitTagDistance({ fg = blue }), -- NeogitTagDistance xxx guifg=#89b4fa
		NeogitRebaseDone({ Comment }), -- NeogitRebaseDone xxx links to Comment
		NeogitStash({ Comment }), -- NeogitStash    xxx links to Comment
		NeogitObjectId({ Comment }), -- NeogitObjectId xxx links to Comment
		NeogitWinSeparator({ WinSeparator }), -- NeogitWinSeparator xxx links to WinSeparator
		NeogitUnpulledFrom({ Function }), -- NeogitUnpulledFrom xxx links to Function
		NeogitUnmergedInto({ Function }), -- NeogitUnmergedInto xxx links to Function
		NeogitTagName({ fg = yellow }), -- NeogitTagName  xxx guifg=#f9e2af
		NeogitSectionHeader({ gui = "bold", fg = mauve }), -- NeogitSectionHeader xxx cterm=bold gui=bold guifg=#cba6f7
		NeogitUnpushedTo({ gui = "bold", fg = lavender }), -- NeogitUnpushedTo xxx cterm=bold gui=bold guifg=#b4befe
		NeogitDiffHeaderHighlight({ gui = "bold", bg = base, fg = peach }), -- NeogitDiffHeaderHighlight xxx cterm=bold gui=bold guifg=#fab387 guibg=#1e1e2e
		NeogitDiffHeader({ gui = "bold", bg = base, fg = blue }), -- NeogitDiffHeader xxx cterm=bold gui=bold guifg=#89b4fa guibg=#1e1e2e
		MasonHeading({ gui = "bold", fg = lavender }), -- MasonHeading   xxx cterm=bold gui=bold guifg=#b4befe DropBarKindVariable({ fg = text }), -- DropBarKindVariable xxx guifg=#cdd6f4
		MasonMutedBlockBold({ gui = "bold", bg = yellow, fg = base }), -- MasonMutedBlockBold xxx cterm=bold gui=bold guifg=#1e1e2e guibg=#f9e2af
		MasonMutedBlock({ bg = overlay0, fg = base }), -- MasonMutedBlock xxx guifg=#1e1e2e guibg=#6c7086
		MasonMuted({ fg = overlay0 }), -- MasonMuted     xxx guifg=#6c7086
		MasonHighlightBlockBoldSecondary({ gui = "bold", bg = lavender, fg = base }), -- MasonHighlightBlockBoldSecondary xxx cterm=bold gui=bold guifg=#1e1e2e guibg=#b4befe
		MasonHighlightBlockSecondary({ bg = blue, fg = base }), -- MasonHighlightBlockSecondary xxx guifg=#1e1e2e guibg=#89b4fa
		MasonHighlightSecondary({ fg = mauve }), -- MasonHighlightSecondary xxx guifg=#cba6f7
		MasonHighlightBlockBold({ gui = "bold", bg = blue, fg = base }), -- MasonHighlightBlockBold xxx cterm=bold gui=bold guifg=#1e1e2e guibg=#89b4fa
		MasonHighlight({ fg = green }), -- MasonHighlight xxx guifg=#a6e3a1
		MasonHeaderSecondary({ gui = "bold", bg = blue, fg = base }), -- MasonHeaderSecondary xxx cterm=bold gui=bold guifg=#1e1e2e guibg=#89b4fa
		MasonHeader({ gui = "bold", bg = lavender, fg = base }), -- MasonHeader    xxx cterm=bold gui=bold guifg=#1e1e2e guibg=#b4befe
		MasonError({ fg = red }), -- MasonError     xxx guifg=#f38ba8
		MasonHighlightBlock({ bg = green, fg = base }), -- MasonHighlightBlock xxx guifg=#1e1e2e guibg=#a6e3a1

		DropBarKindWhileStatement({ fg = text }), -- DropBarKindWhileStatement xxx guifg=#cdd6f4
		DropBarKindType({ fg = text }), -- DropBarKindType xxx guifg=#cdd6f4
		DropBarKindStruct({ fg = text }), -- DropBarKindStruct xxx guifg=#cdd6f4
		DropBarKindString({ fg = text }), -- DropBarKindString xxx guifg=#cdd6f4
		DropBarKindStatement({ fg = text }), -- DropBarKindStatement xxx guifg=#cdd6f4
		DropBarKindSpecifier({ fg = text }), -- DropBarKindSpecifier xxx guifg=#cdd6f4
		DropBarKindScope({ fg = text }), -- DropBarKindScope xxx guifg=#cdd6f4
		DropBarKindRepeat({ fg = text }), -- DropBarKindRepeat xxx guifg=#cdd6f4
		DropBarKindReference({ fg = text }), -- DropBarKindReference xxx guifg=#cdd6f4
		DropBarKindProperty({ fg = text }), -- DropBarKindProperty xxx guifg=#cdd6f4
		DropBarKindPackage({ fg = text }), -- DropBarKindPackage xxx guifg=#cdd6f4
		DropBarKindOperator({ fg = text }), -- DropBarKindOperator xxx guifg=#cdd6f4
		DropBarKindNumber({ fg = text }), -- DropBarKindNumber xxx guifg=#cdd6f4
		DropBarKindNull({ fg = text }), -- DropBarKindNull xxx guifg=#cdd6f4
		DropBarKindNamespace({ fg = text }), -- DropBarKindNamespace xxx guifg=#cdd6f4
		DropBarKindModule({ fg = text }), -- DropBarKindModule xxx guifg=#cdd6f4
		DropBarKindMethod({ fg = text }), -- DropBarKindMethod xxx guifg=#cdd6f4
		DropBarKindMarkdownH6({ fg = text }), -- DropBarKindMarkdownH6 xxx guifg=#cdd6f4
		DropBarKindMarkdownH5({ fg = text }), -- DropBarKindMarkdownH5 xxx guifg=#cdd6f4
		DropBarKindList({ fg = text }), -- DropBarKindList xxx guifg=#cdd6f4
		DropBarKindEnumMember({ fg = text }), -- DropBarKindEnumMember xxx guifg=#cdd6f4
		DropBarKindEnum({ fg = text }), -- DropBarKindEnum xxx guifg=#cdd6f4
		DropBarKindElseStatement({ fg = text }), -- DropBarKindElseStatement xxx guifg=#cdd6f4
		DropBarKindForStatement({ fg = text }), -- DropBarKindForStatement xxx guifg=#cdd6f4
		DropBarKindKeyword({ fg = text }), -- DropBarKindKeyword xxx guifg=#cdd6f4
		DropBarKindIdentifier({ fg = text }), -- DropBarKindIdentifier xxx guifg=#cdd6f4
		DropBarKindFolder({ fg = text }), -- DropBarKindFolder xxx guifg=#cdd6f4
		DropBarKindFile({ fg = text }), -- DropBarKindFile xxx guifg=#cdd6f4
		DropBarKindField({ fg = text }), -- DropBarKindField xxx guifg=#cdd6f4
		DropBarKindDoStatement({ fg = text }), -- DropBarKindDoStatement xxx guifg=#cdd6f4
		DropBarKindDelete({ fg = text }), -- DropBarKindDelete xxx guifg=#cdd6f4
		DropBarKindDeclaration({ fg = text }), -- DropBarKindDeclaration xxx guifg=#cdd6f4
		DropBarKindContinueStatement({ fg = text }), -- DropBarKindContinueStatement xxx guifg=#cdd6f4
		DropBarKindConstructor({ fg = text }), -- DropBarKindConstructor xxx guifg=#cdd6f4
		DropBarKindConstant({ fg = text }), -- DropBarKindConstant xxx guifg=#cdd6f4
		DropBarKindClass({ fg = text }), -- DropBarKindClass xxx guifg=#cdd6f4
		DropBarKindCaseStatement({ fg = text }), -- DropBarKindCaseStatement xxx guifg=#cdd6f4
		DropBarKindCall({ fg = text }), -- DropBarKindCall xxx guifg=#cdd6f4
		DropBarKindBreakStatement({ fg = text }), -- DropBarKindBreakStatement xxx guifg=#cdd6f4
		DropBarKindBoolean({ fg = text }), -- DropBarKindBoolean xxx guifg=#cdd6f4
		DropBarKindIfStatement({ fg = text }), -- DropBarKindIfStatement xxx guifg=#cdd6f4
		DropBarKindEvent({ fg = text }), -- DropBarKindEvent xxx guifg=#cdd6f4
		DropBarKindValue({ fg = text }), -- DropBarKindValue xxx guifg=#cdd6f4
		DropBarKindUnit({ fg = text }), -- DropBarKindUnit xxx guifg=#cdd6f4
		DropBarKindSwitchStatement({ fg = text }), -- DropBarKindSwitchStatement xxx guifg=#cdd6f4
		DropBarKindTypeParameter({ fg = text }), -- DropBarKindTypeParameter xxx guifg=#cdd6f4
		DropBarKindObject({ fg = text }), -- DropBarKindObject xxx guifg=#cdd6f4
		DropBarKindFunction({ fg = text }), -- DropBarKindFunction xxx guifg=#cdd6f4
		DropBarKindInterface({ fg = text }), -- DropBarKindInterface xxx guifg=#cdd6f4
		DropBarKindMacro({ fg = text }), -- DropBarKindMacro xxx guifg=#cdd6f4
		DropBarKindMarkdownH1({ fg = text }), -- DropBarKindMarkdownH1 xxx guifg=#cdd6f4
		DropBarKindMarkdownH2({ fg = text }), -- DropBarKindMarkdownH2 xxx guifg=#cdd6f4
		DropBarKindMarkdownH3({ fg = text }), -- DropBarKindMarkdownH3 xxx guifg=#cdd6f4
		DropBarKindMarkdownH4({ fg = text }), -- DropBarKindMarkdownH4 xxx guifg=#cdd6f4
		DropBarMenuHoverEntry({ Visual }), -- DropBarMenuHoverEntry xxx links to Visual
		DropBarKindArray({ fg = text }), -- DropBarKindArray xxx guifg=#cdd6f4
		DropBarIconUISeparator({ fg = overlay1 }), -- DropBarIconUISeparator xxx guifg=#7f849c
		DropBarMenuHoverSymbol({ gui = "bold" }), -- DropBarMenuHoverSymbol xxx cterm=bold gui=bold
		DropBarMenuHoverIcon({ gui = "reverse" }), -- DropBarMenuHoverIcon xxx cterm=reverse gui=reverse

		-- https://github.com/SmiteshP/nvim-navic
		NavicSeparator({ bg = mantle, fg = text }), -- NavicSeparator xxx guifg=#cdd6f4 guibg=#181825
		NavicIconsFile({ bg = mantle, fg = blue }), -- NavicIconsFile xxx guifg=#89b4fa guibg=#181825
		NavicIconsModule({ bg = mantle, fg = blue }), -- NavicIconsModule xxx guifg=#89b4fa guibg=#181825
		NavicIconsNamespace({ bg = mantle, fg = blue }), -- NavicIconsNamespace xxx guifg=#89b4fa guibg=#181825
		NavicIconsPackage({ bg = mantle, fg = blue }), -- NavicIconsPackage xxx guifg=#89b4fa guibg=#181825
		NavicIconsClass({ bg = mantle, fg = yellow }), -- NavicIconsClass xxx guifg=#f9e2af guibg=#181825
		NavicIconsMethod({ bg = mantle, fg = blue }), -- NavicIconsMethod xxx guifg=#89b4fa guibg=#181825
		NavicIconsInterface({ bg = mantle, fg = yellow }), -- NavicIconsInterface xxx guifg=#f9e2af guibg=#181825
		NavicIconsEnum({ bg = mantle, fg = green }), -- NavicIconsEnum xxx guifg=#a6e3a1 guibg=#181825
		NavicIconsConstructor({ bg = mantle, fg = blue }), -- NavicIconsConstructor xxx guifg=#89b4fa guibg=#181825
		NavicIconsField({ bg = mantle, fg = green }), -- NavicIconsField xxx guifg=#a6e3a1 guibg=#181825
		NavicIconsProperty({ bg = mantle, fg = green }), -- NavicIconsProperty xxx guifg=#a6e3a1 guibg=#181825
		NavicIconsFunction({ bg = mantle, fg = blue }), -- NavicIconsFunction xxx guifg=#89b4fa guibg=#181825
		NavicIconsTypeParameter({ bg = mantle, fg = blue }), -- NavicIconsTypeParameter xxx guifg=#89b4fa guibg=#181825
		NavicIconsOperator({ bg = mantle, fg = sky }), -- NavicIconsOperator xxx guifg=#89dceb guibg=#181825
		NavicIconsEvent({ bg = mantle, fg = blue }), -- NavicIconsEvent xxx guifg=#89b4fa guibg=#181825
		NavicIconsStruct({ bg = mantle, fg = blue }), -- NavicIconsStruct xxx guifg=#89b4fa guibg=#181825
		NavicIconsEnumMember({ bg = mantle, fg = red }), -- NavicIconsEnumMember xxx guifg=#f38ba8 guibg=#181825
		NavicIconsNull({ bg = mantle, fg = peach }), -- NavicIconsNull xxx guifg=#fab387 guibg=#181825
		NavicIconsKey({ bg = mantle, fg = pink }), -- NavicIconsKey  xxx guifg=#f5c2e7 guibg=#181825
		NavicIconsObject({ bg = mantle, fg = peach }), -- NavicIconsObject xxx guifg=#fab387 guibg=#181825
		NavicIconsArray({ bg = mantle, fg = peach }), -- NavicIconsArray xxx guifg=#fab387 guibg=#181825
		NavicIconsBoolean({ bg = mantle, fg = peach }), -- NavicIconsBoolean xxx guifg=#fab387 guibg=#181825
		NavicIconsNumber({ bg = mantle, fg = peach }), -- NavicIconsNumber xxx guifg=#fab387 guibg=#181825
		NavicIconsString({ bg = mantle, fg = green }), -- NavicIconsString xxx guifg=#a6e3a1 guibg=#181825
		NavicIconsConstant({ bg = mantle, fg = peach }), -- NavicIconsConstant xxx guifg=#fab387 guibg=#181825
		NavicIconsVariable({ bg = mantle, fg = flamingo }), -- NavicIconsVariable xxx guifg=#f2cdcd guibg=#181825

		gitcommitSummary({ gui = "italic", fg = rosewater }), -- gitcommitSummary xxx cterm=italic gui=italic guifg=#f5e0dc
		AlphaShortcut({ fg = green }), -- AlphaShortcut  xxx guifg=#a6e3a1
		AlphaButtons({ fg = lavender }), -- AlphaButtons   xxx guifg=#b4befe
		NavicText({ bg = mantle, fg = sapphire }), -- NavicText      xxx guifg=#74c7ec guibg=#181825
		IlluminatedWordRead({ bg = "#393b4d" }), -- IlluminatedWordRead xxx guibg=#393b4d
		IlluminatedWordText({ bg = "#393b4d" }), -- IlluminatedWordText xxx guibg=#393b4d
		-- Completion menu
		BlinkCmpMenu({ Pmenu }),
		BlinkCmpMenuBorder({ fg = blue, bg = mantle }),
		BlinkCmpMenuSelection({ gui = "bold", bg = surface1 }),
		BlinkCmpDoc({ NormalFloat }),
		BlinkCmpDocBorder({ FloatBorder }),
		BlinkCmpScrollBarGutter({ bg = surface1 }),
		BlinkCmpScrollBarThumb({ bg = overlay0 }),
		BlinkCmpGhostText({ fg = surface1 }),
		BlinkCmpLabel({ fg = overlay2 }),
		BlinkCmpLabelMatch({ fg = text, gui = "bold" }),
		BlinkCmpLabelDeprecated({ fg = overlay0, gui = "strikethrough" }),
		BlinkCmpKind({ fg = blue }),
		BlinkCmpSource({ fg = overlay0 }),
		BlinkCmpDocCursorLine({ Visual }), -- BlinkCmpDocCursorLine xxx links to Visual
		BlinkCmpMenu({ Pmenu }), -- BlinkCmpMenu   xxx links to Pmenu
		BlinkCmpDoc({ NormalFloat }), -- BlinkCmpDoc    xxx links to NormalFloat
		BlinkCmpDocSeparator({ NormalFloat }), -- BlinkCmpDocSeparator xxx links to NormalFloat
		BlinkCmpSignatureHelp({ NormalFloat }), -- BlinkCmpSignatureHelp xxx links to NormalFloat
		BlinkCmpDocBorder({ FloatBorder }), -- BlinkCmpDocBorder xxx links to FloatBorder
		BlinkCmpSignatureHelpBorder({ FloatBorder }), -- BlinkCmpSignatureHelpBorder xxx links to FloatBorder
		BlinkCmpSignatureHelpActiveParameter({ LspSignatureActiveParameter }), -- BlinkCmpSignatureHelpActiveParameter xxx links to LspSignatureActiveParameter
		BlinkCmpKindCopilot({ fg = teal }), -- BlinkCmpKindCopilot xxx guifg=#94e2d5
		BlinkCmpKindOperator({ fg = sky }), -- BlinkCmpKindOperator xxx guifg=#89dceb
		BlinkCmpKindEvent({ fg = blue }), -- BlinkCmpKindEvent xxx guifg=#89b4fa
		BlinkCmpKindStruct({ fg = blue }), -- BlinkCmpKindStruct xxx guifg=#89b4fa
		BlinkCmpKindConstant({ fg = peach }), -- BlinkCmpKindConstant xxx guifg=#fab387
		BlinkCmpKindEnumMember({ fg = teal }), -- BlinkCmpKindEnumMember xxx guifg=#94e2d5
		BlinkCmpKindFolder({ fg = blue }), -- BlinkCmpKindFolder xxx guifg=#89b4fa
		BlinkCmpKindReference({ fg = red }), -- BlinkCmpKindReference xxx guifg=#f38ba8
		BlinkCmpKindFile({ fg = blue }), -- BlinkCmpKindFile xxx guifg=#89b4fa
		BlinkCmpKindColor({ fg = red }), -- BlinkCmpKindColor xxx guifg=#f38ba8
		BlinkCmpKindSnippet({ fg = flamingo }), -- BlinkCmpKindSnippet xxx guifg=#f2cdcd
		BlinkCmpKindModule({ fg = blue }), -- BlinkCmpKindModule xxx guifg=#89b4fa
		BlinkCmpKindInterface({ fg = yellow }), -- BlinkCmpKindInterface xxx guifg=#f9e2af
		BlinkCmpKindClass({ fg = yellow }), -- BlinkCmpKindClass xxx guifg=#f9e2af
		BlinkCmpKindVariable({ fg = flamingo }), -- BlinkCmpKindVariable xxx guifg=#f2cdcd
		BlinkCmpKindField({ fg = green }), -- BlinkCmpKindField xxx guifg=#a6e3a1
		BlinkCmpKindConstructor({ fg = blue }), -- BlinkCmpKindConstructor xxx guifg=#89b4fa
		BlinkCmpKindFunction({ fg = blue }), -- BlinkCmpKindFunction xxx guifg=#89b4fa
		BlinkCmpKindText({ fg = green }), -- BlinkCmpKindText xxx guifg=#a6e3a1
		BlinkCmpLabelDetail({ fg = overlay0 }), -- BlinkCmpLabelDetail xxx guifg=#6c7086
		BlinkCmpLabelDescription({ fg = overlay0 }), -- BlinkCmpLabelDescription xxx guifg=#6c7086
		BlinkCmpKindUnit({ fg = green }), -- BlinkCmpKindUnit xxx guifg=#a6e3a1
		BlinkCmpKindProperty({ fg = blue }), -- BlinkCmpKindProperty xxx guifg=#89b4fa
		BlinkCmpKindTypeParameter({ fg = maroon }), -- BlinkCmpKindTypeParameter xxx guifg=#eba0ac
		BlinkCmpKindMethod({ fg = blue }), -- BlinkCmpKindMethod xxx guifg=#89b4fa
		BlinkCmpKindKeyword({ fg = mauve }), -- BlinkCmpKindKeyword xxx guifg=#cba6f7
		BlinkCmpKindValue({ fg = peach }), -- BlinkCmpKindValue xxx guifg=#fab387
		BlinkCmpKindEnum({ fg = yellow }), -- BlinkCmpKindEnum xxx guifg=#f9e2af

		sym("@string.regexp")({ fg = pink }), -- @string.regexp xxx guifg=#f5c2e7
		sym("@punctuation.delimiter.regex")({ sym("@string.regexp") }), -- @punctuation.delimiter.regex xxx links to @string.regexp
		sym("@string.escape")({ fg = pink }), -- @string.escape xxx guifg=#f5c2e7
		sym("@string.special.url")({ gui = "underline,italic", fg = blue }), -- @string.special.url xxx cterm=underline,italic gui=underline,italic guifg=#89b4fa
		sym("@type.builtin")({ fg = mauve }), -- @type.builtin  xxx guifg=#cba6f7
		sym("@property")({ fg = text }), -- @property      xxx guifg=#cdd6f4
		sym("@function")({ Function }), -- @function      xxx links to Function
		sym("@function.method")({ Function }), -- @function.method xxx links to Function
		sym("@method")({ Function }), -- @method        xxx links to Function
		sym("@method.php")({ Function }), -- @method.php    xxx links to Function
		sym("@method.call")({ Function }), -- @method.call   xxx links to Function
		sym("@function.method.php")({ Function }), -- @function.method.php xxx links to Function
		sym("@function.method.call")({ Function }), -- @function.method.call xxx links to Function
		sym("@function.method.call.php")({ Function }), -- @function.method.call.php xxx links to Function
		sym("@function.call")({ Function }), -- @function.call xxx links to Function
		sym("@method.call.php")({ Function }), -- @method.call.php xxx links to Function
		sym("@function.builtin")({ fg = peach }), -- @function.builtin xxx guifg=#fab387
		sym("@constructor")({ fg = yellow }), -- @constructor   xxx guifg=#f9e2af
		sym("@operator")({ Operator }), -- @operator      xxx links to Operator
		sym("@punctuation.delimiter")({ Delimiter }), -- @punctuation.delimiter xxx links to Delimiter
		sym("@diff.delta")({ diffChanged }), -- @diff.delta    xxx links to diffChanged
		sym("@diff.minus")({ diffRemoved }), -- @diff.minus    xxx links to diffRemoved
		sym("@text.diff.delete")({ diffRemoved }), -- @text.diff.delete xxx links to diffRemoved
		sym("@diff.plus")({ diffAdded }), -- @diff.plus     xxx links to diffAdded
		sym("@text.diff.add")({ diffAdded }), -- @text.diff.add xxx links to diffAdded
		sym("@text")({ fg = text }), -- @text          xxx guifg=#cdd6f4
		sym("@field")({ fg = text }), -- @field         xxx guifg=#cdd6f4
		sym("@text.danger")({ bg = red, fg = base }), -- @text.danger   xxx guifg=#1e1e2e guibg=#f38ba8
		sym("@text.note")({ bg = blue, fg = base }), -- @text.note     xxx guifg=#1e1e2e guibg=#89b4fa
		sym("@text.warning")({ bg = yellow, fg = base }), -- @text.warning  xxx guifg=#1e1e2e guibg=#f9e2af
		sym("@text.todo")({ bg = flamingo, fg = base }), -- @text.todo     xxx guifg=#1e1e2e guibg=#f2cdcd
		sym("@text.title")({ fg = blue }), -- @text.title    xxx guifg=#89b4fa
		sym("@text.todo.checked")({ fg = green }), -- @text.todo.checked xxx guifg=#a6e3a1
		sym("@text.literal")({ fg = green }), -- @text.literal  xxx guifg=#a6e3a1
		sym("@text.environment")({ fg = pink }), -- @text.environment xxx guifg=#f5c2e7
		sym("@text.environment.name")({ fg = blue }), -- @text.environment.name xxx guifg=#89b4fa
		sym("@text.math")({ fg = blue }), -- @text.math     xxx guifg=#89b4fa
		sym("@text.emphasis")({ gui = "italic", fg = red }), -- @text.emphasis xxx cterm=italic gui=italic guifg=#f38ba8
		sym("@text.strong")({ gui = "bold", fg = red }), -- @text.strong   xxx cterm=bold gui=bold guifg=#f38ba8
		sym("@text.reference")({ fg = lavender }), -- @text.reference xxx guifg=#b4befe
		sym("@text.todo.unchecked")({ fg = overlay1 }), -- @text.todo.unchecked xxx guifg=#7f849c
		sym("@string.regex")({ fg = pink }), -- @string.regex  xxx guifg=#f5c2e7
		sym("@string.special.path.gitignore")({ fg = text }), -- @string.special.path.gitignore xxx guifg=#cdd6f4
		sym("@attribute.c_sharp")({ fg = yellow }), -- @attribute.c_sharp xxx guifg=#f9e2af
		sym("@text.strike")({ gui = "strikethrough", fg = text }), -- @text.strike   xxx cterm=strikethrough gui=strikethrough guifg=#cdd6f4
		sym("@symbol")({ fg = flamingo }), -- @symbol        xxx guifg=#f2cdcd
		sym("@parameter")({ fg = maroon }), -- @parameter     xxx guifg=#eba0ac
		sym("@string.special.symbol")({ fg = flamingo }), -- @string.special.symbol xxx guifg=#f2cdcd
		sym("@string.special.symbol.ruby")({ fg = flamingo }), -- @string.special.symbol.ruby xxx guifg=#f2cdcd
		sym("@label.yaml")({ fg = yellow }), -- @label.yaml    xxx guifg=#f9e2af
		sym("@property.yaml")({ fg = blue }), -- @property.yaml xxx guifg=#89b4fa
		sym("@constructor.python")({ fg = sky }), -- @constructor.python xxx guifg=#89dceb
		sym("@constructor.lua")({ sym("@punctuation.bracket") }), -- @constructor.lua xxx links to @punctuation.bracket
		sym("@property.json")({ fg = blue }), -- @property.json xxx guifg=#89b4fa
		sym("@property.toml")({ fg = blue }), -- @property.toml xxx guifg=#89b4fa
		sym("@character.special.html")({ fg = red }), -- @character.special.html xxx guifg=#f38ba8
		sym("@string.special.url.html")({ fg = green }), -- @string.special.url.html xxx guifg=#a6e3a1
		sym("@number.css")({ fg = peach }), -- @number.css    xxx guifg=#fab387
		sym("@string.plain.css")({ fg = text }), -- @string.plain.css xxx guifg=#cdd6f4
		sym("@type.tag.css")({ fg = blue }), -- @type.tag.css  xxx guifg=#89b4fa
		sym("@type.css")({ fg = lavender }), -- @type.css      xxx guifg=#b4befe
		sym("@property.class.css")({ fg = yellow }), -- @property.class.css xxx guifg=#f9e2af
		sym("@property.id.css")({ fg = yellow }), -- @property.id.css xxx guifg=#f9e2af
		sym("@property.scss")({ fg = blue }), -- @property.scss xxx guifg=#89b4fa
		sym("@property.css")({ fg = blue }), -- @property.css  xxx guifg=#89b4fa
		sym("@function.builtin.bash")({ gui = "italic", fg = red }), -- @function.builtin.bash xxx cterm=italic gui=italic guifg=#f38ba8
		sym("@function.macro")({ fg = pink }), -- @function.macro xxx guifg=#f5c2e7
		sym("@string.documentation")({ fg = teal }), -- @string.documentation xxx guifg=#94e2d5
		sym("@symbol.ruby")({ fg = flamingo }), -- @symbol.ruby   xxx guifg=#f2cdcd
		sym("@namespace")({ gui = "italic", fg = yellow }), -- @namespace     xxx cterm=italic gui=italic guifg=#f9e2af

		AerialPackageIcon({ sym("@namespace") }), -- AerialPackageIcon xxx links to @namespace
		AerialModuleIcon({ sym("@namespace") }), -- AerialModuleIcon xxx links to @namespace
		AerialNamespaceIcon({ sym("@namespace") }), -- AerialNamespaceIcon xxx links to @namespace
		AerialEnumMemberIcon({ sym("@field") }), -- AerialEnumMemberIcon xxx links to @field
		AerialFieldIcon({ sym("@field") }), -- AerialFieldIcon xxx links to @field
		AerialGuide({ fg = overlay2 }), -- AerialGuide    xxx guifg=#9399b2
		AerialLine({ fg = yellow }), -- AerialLine     xxx guifg=#f9e2af

		lualine_transparent({ gui = "nocombine", bg = base, fg = text }), -- lualine_transparent xxx gui=nocombine guifg=#cdd6f4 guibg=#1e1e2e
		lualine_a_normal({ gui = "bold,nocombine", bg = blue, fg = mantle }), -- lualine_a_normal xxx gui=bold,nocombine guifg=#181825 guibg=#89b4fa
		lualine_b_normal({ gui = "nocombine", bg = surface0, fg = blue }), -- lualine_b_normal xxx gui=nocombine guifg=#89b4fa guibg=#313244
		lualine_c_normal({ gui = "nocombine", bg = mantle, fg = text }), -- lualine_c_normal xxx gui=nocombine guifg=#cdd6f4 guibg=#181825
		lualine_a_inactive({ gui = "nocombine", bg = mantle, fg = blue }), -- lualine_a_inactive xxx gui=nocombine guifg=#89b4fa guibg=#181825
		lualine_b_inactive({ gui = "bold,nocombine", bg = mantle, fg = surface1 }), -- lualine_b_inactive xxx gui=bold,nocombine guifg=#45475a guibg=#181825
		lualine_c_inactive({ gui = "nocombine", bg = mantle, fg = overlay0 }), -- lualine_c_inactive xxx gui=nocombine guifg=#6c7086 guibg=#181825
		lualine_a_replace({ gui = "bold,nocombine", bg = red, fg = base }), -- lualine_a_replace xxx gui=bold,nocombine guifg=#1e1e2e guibg=#f38ba8
		lualine_b_replace({ gui = "nocombine", bg = surface0, fg = red }), -- lualine_b_replace xxx gui=nocombine guifg=#f38ba8 guibg=#313244
		lualine_a_command({ gui = "bold,nocombine", bg = peach, fg = base }), -- lualine_a_command xxx gui=bold,nocombine guifg=#1e1e2e guibg=#fab387
		lualine_b_command({ gui = "nocombine", bg = surface0, fg = peach }), -- lualine_b_command xxx gui=nocombine guifg=#fab387 guibg=#313244
		lualine_a_visual({ gui = "bold,nocombine", bg = mauve, fg = base }), -- lualine_a_visual xxx gui=bold,nocombine guifg=#1e1e2e guibg=#cba6f7
		lualine_b_visual({ gui = "nocombine", bg = surface0, fg = mauve }), -- lualine_b_visual xxx gui=nocombine guifg=#cba6f7 guibg=#313244
		lualine_a_terminal({ gui = "bold,nocombine", bg = green, fg = base }), -- lualine_a_terminal xxx gui=bold,nocombine guifg=#1e1e2e guibg=#a6e3a1
		lualine_b_terminal({ gui = "nocombine", bg = surface0, fg = green }), -- lualine_b_terminal xxx gui=nocombine guifg=#a6e3a1 guibg=#313244
		lualine_a_insert({ gui = "bold,nocombine", bg = green, fg = base }), -- lualine_a_insert xxx gui=bold,nocombine guifg=#1e1e2e guibg=#a6e3a1
		lualine_b_insert({ gui = "nocombine", bg = surface0, fg = green }), -- lualine_b_insert xxx gui=nocombine guifg=#a6e3a1 guibg=#313244
		lualine_c_4_normal({ gui = "nocombine", bg = mantle, fg = pink }), -- lualine_c_4_normal xxx gui=nocombine guifg=#f5c2e7 guibg=#181825
		lualine_c_4_insert({ gui = "nocombine", bg = mantle, fg = pink }), -- lualine_c_4_insert xxx gui=nocombine guifg=#f5c2e7 guibg=#181825
		lualine_c_4_visual({ gui = "nocombine", bg = mantle, fg = pink }), -- lualine_c_4_visual xxx gui=nocombine guifg=#f5c2e7 guibg=#181825
		lualine_c_4_replace({ gui = "nocombine", bg = mantle, fg = pink }), -- lualine_c_4_replace xxx gui=nocombine guifg=#f5c2e7 guibg=#181825
		lualine_c_4_command({ gui = "nocombine", bg = mantle, fg = pink }), -- lualine_c_4_command xxx gui=nocombine guifg=#f5c2e7 guibg=#181825
		lualine_c_4_terminal({ gui = "nocombine", bg = mantle, fg = pink }), -- lualine_c_4_terminal xxx gui=nocombine guifg=#f5c2e7 guibg=#181825
		lualine_c_4_inactive({ gui = "nocombine", bg = mantle, fg = pink }), -- lualine_c_4_inactive xxx gui=nocombine guifg=#f5c2e7 guibg=#181825
		lualine_c_diagnostics_error_normal({ gui = "nocombine", bg = mantle, fg = red }), -- lualine_c_diagnostics_error_normal xxx gui=nocombine guifg=#f38ba8 guibg=#181825
		lualine_c_diagnostics_error_insert({ gui = "nocombine", bg = mantle, fg = red }), -- lualine_c_diagnostics_error_insert xxx gui=nocombine guifg=#f38ba8 guibg=#181825
		lualine_c_diagnostics_error_visual({ gui = "nocombine", bg = mantle, fg = red }), -- lualine_c_diagnostics_error_visual xxx gui=nocombine guifg=#f38ba8 guibg=#181825
		lualine_c_diagnostics_error_replace({ gui = "nocombine", bg = mantle, fg = red }), -- lualine_c_diagnostics_error_replace xxx gui=nocombine guifg=#f38ba8 guibg=#181825
		lualine_c_diagnostics_error_command({ gui = "nocombine", bg = mantle, fg = red }), -- lualine_c_diagnostics_error_command xxx gui=nocombine guifg=#f38ba8 guibg=#181825
		lualine_c_diagnostics_error_terminal({ gui = "nocombine", bg = mantle, fg = red }), -- lualine_c_diagnostics_error_terminal xxx gui=nocombine guifg=#f38ba8 guibg=#181825
		lualine_c_diagnostics_error_inactive({ gui = "nocombine", bg = mantle, fg = red }), -- lualine_c_diagnostics_error_inactive xxx gui=nocombine guifg=#f38ba8 guibg=#181825
		lualine_c_diagnostics_warn_normal({ gui = "nocombine", bg = mantle, fg = yellow }), -- lualine_c_diagnostics_warn_normal xxx gui=nocombine guifg=#f9e2af guibg=#181825
		lualine_c_diagnostics_warn_insert({ gui = "nocombine", bg = mantle, fg = yellow }), -- lualine_c_diagnostics_warn_insert xxx gui=nocombine guifg=#f9e2af guibg=#181825
		lualine_c_diagnostics_warn_visual({ gui = "nocombine", bg = mantle, fg = yellow }), -- lualine_c_diagnostics_warn_visual xxx gui=nocombine guifg=#f9e2af guibg=#181825
		lualine_c_diagnostics_warn_replace({ gui = "nocombine", bg = mantle, fg = yellow }), -- lualine_c_diagnostics_warn_replace xxx gui=nocombine guifg=#f9e2af guibg=#181825
		lualine_c_diagnostics_warn_command({ gui = "nocombine", bg = mantle, fg = yellow }), -- lualine_c_diagnostics_warn_command xxx gui=nocombine guifg=#f9e2af guibg=#181825
		lualine_c_diagnostics_warn_terminal({ gui = "nocombine", bg = mantle, fg = yellow }), -- lualine_c_diagnostics_warn_terminal xxx gui=nocombine guifg=#f9e2af guibg=#181825
		lualine_c_diagnostics_warn_inactive({ gui = "nocombine", bg = mantle, fg = yellow }), -- lualine_c_diagnostics_warn_inactive xxx gui=nocombine guifg=#f9e2af guibg=#181825
		lualine_c_diagnostics_info_normal({ gui = "nocombine", bg = mantle, fg = sky }), -- lualine_c_diagnostics_info_normal xxx gui=nocombine guifg=#89dceb guibg=#181825
		lualine_c_diagnostics_info_insert({ gui = "nocombine", bg = mantle, fg = sky }), -- lualine_c_diagnostics_info_insert xxx gui=nocombine guifg=#89dceb guibg=#181825
		lualine_c_diagnostics_info_visual({ gui = "nocombine", bg = mantle, fg = sky }), -- lualine_c_diagnostics_info_visual xxx gui=nocombine guifg=#89dceb guibg=#181825
		lualine_c_diagnostics_info_replace({ gui = "nocombine", bg = mantle, fg = sky }), -- lualine_c_diagnostics_info_replace xxx gui=nocombine guifg=#89dceb guibg=#181825
		lualine_c_diagnostics_info_command({ gui = "nocombine", bg = mantle, fg = sky }), -- lualine_c_diagnostics_info_command xxx gui=nocombine guifg=#89dceb guibg=#181825
		lualine_c_diagnostics_info_terminal({ gui = "nocombine", bg = mantle, fg = sky }), -- lualine_c_diagnostics_info_terminal xxx gui=nocombine guifg=#89dceb guibg=#181825
		lualine_c_diagnostics_info_inactive({ gui = "nocombine", bg = mantle, fg = sky }), -- lualine_c_diagnostics_info_inactive xxx gui=nocombine guifg=#89dceb guibg=#181825
		lualine_c_diagnostics_hint_normal({ gui = "nocombine", bg = mantle, fg = teal }), -- lualine_c_diagnostics_hint_normal xxx gui=nocombine guifg=#94e2d5 guibg=#181825
		lualine_c_diagnostics_hint_insert({ gui = "nocombine", bg = mantle, fg = teal }), -- lualine_c_diagnostics_hint_insert xxx gui=nocombine guifg=#94e2d5 guibg=#181825
		lualine_c_diagnostics_hint_visual({ gui = "nocombine", bg = mantle, fg = teal }), -- lualine_c_diagnostics_hint_visual xxx gui=nocombine guifg=#94e2d5 guibg=#181825
		lualine_c_diagnostics_hint_replace({ gui = "nocombine", bg = mantle, fg = teal }), -- lualine_c_diagnostics_hint_replace xxx gui=nocombine guifg=#94e2d5 guibg=#181825
		lualine_c_diagnostics_hint_command({ gui = "nocombine", bg = mantle, fg = teal }), -- lualine_c_diagnostics_hint_command xxx gui=nocombine guifg=#94e2d5 guibg=#181825
		lualine_c_diagnostics_hint_terminal({ gui = "nocombine", bg = mantle, fg = teal }), -- lualine_c_diagnostics_hint_terminal xxx gui=nocombine guifg=#94e2d5 guibg=#181825
		lualine_c_diagnostics_hint_inactive({ gui = "nocombine", bg = mantle, fg = teal }), -- lualine_c_diagnostics_hint_inactive xxx gui=nocombine guifg=#94e2d5 guibg=#181825
		lualine_x_12_normal({ gui = "nocombine", bg = mantle, fg = mauve }), -- lualine_x_12_normal xxx gui=nocombine guifg=#cba6f7 guibg=#181825
		lualine_x_12_insert({ gui = "nocombine", bg = mantle, fg = mauve }), -- lualine_x_12_insert xxx gui=nocombine guifg=#cba6f7 guibg=#181825
		lualine_x_12_visual({ gui = "nocombine", bg = mantle, fg = mauve }), -- lualine_x_12_visual xxx gui=nocombine guifg=#cba6f7 guibg=#181825
		lualine_x_12_replace({ gui = "nocombine", bg = mantle, fg = mauve }), -- lualine_x_12_replace xxx gui=nocombine guifg=#cba6f7 guibg=#181825
		lualine_x_12_command({ gui = "nocombine", bg = mantle, fg = mauve }), -- lualine_x_12_command xxx gui=nocombine guifg=#cba6f7 guibg=#181825
		lualine_x_12_terminal({ gui = "nocombine", bg = mantle, fg = mauve }), -- lualine_x_12_terminal xxx gui=nocombine guifg=#cba6f7 guibg=#181825
		lualine_x_12_inactive({ gui = "nocombine", bg = mantle, fg = mauve }), -- lualine_x_12_inactive xxx gui=nocombine guifg=#cba6f7 guibg=#181825
		lualine_x_13_normal({ gui = "nocombine", bg = mantle, fg = peach }), -- lualine_x_13_normal xxx gui=nocombine guifg=#fab387 guibg=#181825
		lualine_x_13_insert({ gui = "nocombine", bg = mantle, fg = peach }), -- lualine_x_13_insert xxx gui=nocombine guifg=#fab387 guibg=#181825
		lualine_x_13_visual({ gui = "nocombine", bg = mantle, fg = peach }), -- lualine_x_13_visual xxx gui=nocombine guifg=#fab387 guibg=#181825
		lualine_x_13_replace({ gui = "nocombine", bg = mantle, fg = peach }), -- lualine_x_13_replace xxx gui=nocombine guifg=#fab387 guibg=#181825
		lualine_x_13_command({ gui = "nocombine", bg = mantle, fg = peach }), -- lualine_x_13_command xxx gui=nocombine guifg=#fab387 guibg=#181825
		lualine_x_13_terminal({ gui = "nocombine", bg = mantle, fg = peach }), -- lualine_x_13_terminal xxx gui=nocombine guifg=#fab387 guibg=#181825
		lualine_x_13_inactive({ gui = "nocombine", bg = mantle, fg = peach }), -- lualine_x_13_inactive xxx gui=nocombine guifg=#fab387 guibg=#181825
		lualine_x_14_normal({ gui = "nocombine", bg = mantle, fg = pink }), -- lualine_x_14_normal xxx gui=nocombine guifg=#f5c2e7 guibg=#181825
		lualine_x_14_insert({ gui = "nocombine", bg = mantle, fg = pink }), -- lualine_x_14_insert xxx gui=nocombine guifg=#f5c2e7 guibg=#181825
		lualine_x_14_visual({ gui = "nocombine", bg = mantle, fg = pink }), -- lualine_x_14_visual xxx gui=nocombine guifg=#f5c2e7 guibg=#181825
		lualine_x_14_replace({ gui = "nocombine", bg = mantle, fg = pink }), -- lualine_x_14_replace xxx gui=nocombine guifg=#f5c2e7 guibg=#181825
		lualine_x_14_command({ gui = "nocombine", bg = mantle, fg = pink }), -- lualine_x_14_command xxx gui=nocombine guifg=#f5c2e7 guibg=#181825
		lualine_x_14_terminal({ gui = "nocombine", bg = mantle, fg = pink }), -- lualine_x_14_terminal xxx gui=nocombine guifg=#f5c2e7 guibg=#181825
		lualine_x_14_inactive({ gui = "nocombine", bg = mantle, fg = pink }), -- lualine_x_14_inactive xxx gui=nocombine guifg=#f5c2e7 guibg=#181825
		lualine_x_15_normal({ gui = "nocombine", bg = mantle, fg = pink }), -- lualine_x_15_normal xxx gui=nocombine guifg=#f5c2e7 guibg=#181825
		lualine_x_15_insert({ gui = "nocombine", bg = mantle, fg = pink }), -- lualine_x_15_insert xxx gui=nocombine guifg=#f5c2e7 guibg=#181825
		lualine_x_15_visual({ gui = "nocombine", bg = mantle, fg = pink }), -- lualine_x_15_visual xxx gui=nocombine guifg=#f5c2e7 guibg=#181825
		lualine_x_15_replace({ gui = "nocombine", bg = mantle, fg = pink }), -- lualine_x_15_replace xxx gui=nocombine guifg=#f5c2e7 guibg=#181825
		lualine_x_15_command({ gui = "nocombine", bg = mantle, fg = pink }), -- lualine_x_15_command xxx gui=nocombine guifg=#f5c2e7 guibg=#181825
		lualine_x_15_terminal({ gui = "nocombine", bg = mantle, fg = pink }), -- lualine_x_15_terminal xxx gui=nocombine guifg=#f5c2e7 guibg=#181825
		lualine_x_15_inactive({ gui = "nocombine", bg = mantle, fg = pink }), -- lualine_x_15_inactive xxx gui=nocombine guifg=#f5c2e7 guibg=#181825
		lualine_x_diff_added_normal({ gui = "nocombine", bg = mantle, fg = green }), -- lualine_x_diff_added_normal xxx gui=nocombine guifg=#a6e3a1 guibg=#181825
		lualine_x_diff_added_insert({ gui = "nocombine", bg = mantle, fg = green }), -- lualine_x_diff_added_insert xxx gui=nocombine guifg=#a6e3a1 guibg=#181825
		lualine_x_diff_added_visual({ gui = "nocombine", bg = mantle, fg = green }), -- lualine_x_diff_added_visual xxx gui=nocombine guifg=#a6e3a1 guibg=#181825
		lualine_x_diff_added_replace({ gui = "nocombine", bg = mantle, fg = green }), -- lualine_x_diff_added_replace xxx gui=nocombine guifg=#a6e3a1 guibg=#181825
		lualine_x_diff_added_command({ gui = "nocombine", bg = mantle, fg = green }), -- lualine_x_diff_added_command xxx gui=nocombine guifg=#a6e3a1 guibg=#181825
		lualine_x_diff_added_terminal({ gui = "nocombine", bg = mantle, fg = green }), -- lualine_x_diff_added_terminal xxx gui=nocombine guifg=#a6e3a1 guibg=#181825
		lualine_x_diff_added_inactive({ gui = "nocombine", bg = mantle, fg = green }), -- lualine_x_diff_added_inactive xxx gui=nocombine guifg=#a6e3a1 guibg=#181825
		lualine_x_diff_modified_normal({ gui = "nocombine", bg = mantle, fg = yellow }), -- lualine_x_diff_modified_normal xxx gui=nocombine guifg=#f9e2af guibg=#181825
		lualine_x_diff_modified_insert({ gui = "nocombine", bg = mantle, fg = yellow }), -- lualine_x_diff_modified_insert xxx gui=nocombine guifg=#f9e2af guibg=#181825
		lualine_x_diff_modified_visual({ gui = "nocombine", bg = mantle, fg = yellow }), -- lualine_x_diff_modified_visual xxx gui=nocombine guifg=#f9e2af guibg=#181825
		lualine_x_diff_modified_replace({ gui = "nocombine", bg = mantle, fg = yellow }), -- lualine_x_diff_modified_replace xxx gui=nocombine guifg=#f9e2af guibg=#181825
		lualine_x_diff_modified_command({ gui = "nocombine", bg = mantle, fg = yellow }), -- lualine_x_diff_modified_command xxx gui=nocombine guifg=#f9e2af guibg=#181825
		lualine_x_diff_modified_terminal({ gui = "nocombine", bg = mantle, fg = yellow }), -- lualine_x_diff_modified_terminal xxx gui=nocombine guifg=#f9e2af guibg=#181825
		lualine_x_diff_modified_inactive({ gui = "nocombine", bg = mantle, fg = yellow }), -- lualine_x_diff_modified_inactive xxx gui=nocombine guifg=#f9e2af guibg=#181825
		lualine_x_diff_removed_normal({ gui = "nocombine", bg = mantle, fg = red }), -- lualine_x_diff_removed_normal xxx gui=nocombine guifg=#f38ba8 guibg=#181825
		lualine_x_diff_removed_insert({ gui = "nocombine", bg = mantle, fg = red }), -- lualine_x_diff_removed_insert xxx gui=nocombine guifg=#f38ba8 guibg=#181825
		lualine_x_diff_removed_visual({ gui = "nocombine", bg = mantle, fg = red }), -- lualine_x_diff_removed_visual xxx gui=nocombine guifg=#f38ba8 guibg=#181825
		lualine_x_diff_removed_replace({ gui = "nocombine", bg = mantle, fg = red }), -- lualine_x_diff_removed_replace xxx gui=nocombine guifg=#f38ba8 guibg=#181825
		lualine_x_diff_removed_command({ gui = "nocombine", bg = mantle, fg = red }), -- lualine_x_diff_removed_command xxx gui=nocombine guifg=#f38ba8 guibg=#181825
		lualine_x_diff_removed_terminal({ gui = "nocombine", bg = mantle, fg = red }), -- lualine_x_diff_removed_terminal xxx gui=nocombine guifg=#f38ba8 guibg=#181825
		lualine_x_diff_removed_inactive({ gui = "nocombine", bg = mantle, fg = red }), -- lualine_x_diff_removed_inactive xxx gui=nocombine guifg=#f38ba8 guibg=#181825

		BufferLineGroupSeparator({ bg = "#101019", fg = overlay2 }), -- BufferLineGroupSeparator xxx guifg=#9399b2 guibg=#101019
		BufferLineTruncMarker({ bg = "#101019", fg = overlay2 }), -- BufferLineTruncMarker xxx guifg=#9399b2 guibg=#101019
		BufferLineDiagnostic({ bg = mantle, fg = subtext0 }), -- BufferLineDiagnostic xxx guifg=#a6adc8 guibg=#181825
		BufferLineError({ bg = mantle, fg = red, sp = red }), -- BufferLineError xxx guifg=#f38ba8 guibg=#181825 guisp=#f38ba8
		BufferLineNumbers({ bg = mantle, fg = subtext0 }), -- BufferLineNumbers xxx guifg=#a6adc8 guibg=#181825
		BufferLineBuffer({ bg = "#161622", fg = overlay2 }), -- BufferLineBuffer xxx guifg=#9399b2 guibg=#161622
		BufferLineTab({ bg = mantle, fg = surface1 }), -- BufferLineTab  xxx guifg=#45475a guibg=#181825
		BufferLineWarning({ bg = mantle, fg = yellow, sp = yellow }), -- BufferLineWarning xxx guifg=#f9e2af guibg=#181825 guisp=#f9e2af
		BufferLineNumbersVisible({ bg = mantle, fg = subtext0 }), -- BufferLineNumbersVisible xxx guifg=#a6adc8 guibg=#181825
		BufferLineTabClose({ bg = mantle, fg = red }), -- BufferLineTabClose xxx guifg=#f38ba8 guibg=#181825
		BufferLineFill({ bg = "#11111b", fg = overlay2 }), -- BufferLineFill xxx guifg=#9399b2 guibg=#11111b
		BufferLineTabSeparatorSelected({ bg = base, fg = "#11111b" }), -- BufferLineTabSeparatorSelected xxx guifg=#11111b guibg=#1e1e2e
		BufferLineTabSeparator({ bg = mantle, fg = "#11111b" }), -- BufferLineTabSeparator xxx guifg=#11111b guibg=#181825
		BufferLineTabSelected({ bg = base, fg = sky }), -- BufferLineTabSelected xxx guifg=#89dceb guibg=#1e1e2e
		BufferLineHintDiagnostic({ bg = mantle, fg = teal, sp = "#6fa99f" }), -- BufferLineHintDiagnostic xxx guifg=#94e2d5 guibg=#181825 guisp=#6fa99f
		BufferLineHintVisible({ bg = mantle, fg = teal }), -- BufferLineHintVisible xxx guifg=#94e2d5 guibg=#181825
		BufferLineBackground({ bg = mantle, fg = overlay2 }), -- BufferLineBackground xxx guifg=#9399b2 guibg=#181825
		BufferLineInfoDiagnosticVisible({ bg = mantle, fg = sky }), -- BufferLineInfoDiagnosticVisible xxx guifg=#89dceb guibg=#181825
		BufferLineInfoDiagnostic({ bg = mantle, fg = sky, sp = "#66a5b0" }), -- BufferLineInfoDiagnostic xxx guifg=#89dceb guibg=#181825 guisp=#66a5b0
		BufferLineInfoSelected({ gui = "bold,italic", bg = base, fg = sky, sp = sky }), -- BufferLineInfoSelected xxx cterm=bold,italic gui=bold,italic guifg=#89dceb guibg=#1e1e2e guisp=#89dceb
		BufferLineInfoVisible({ bg = mantle, fg = sky }), -- BufferLineInfoVisible xxx guifg=#89dceb guibg=#181825
		BufferLineWarningDiagnosticSelected({ bg = base, fg = yellow, sp = "#baa983" }), -- BufferLineWarningDiagnosticSelected xxx guifg=#f9e2af guibg=#1e1e2e guisp=#baa983
		BufferLineWarningDiagnosticVisible({ bg = mantle, fg = yellow }), -- BufferLineWarningDiagnosticVisible xxx guifg=#f9e2af guibg=#181825
		BufferLineHint({ bg = mantle, fg = teal, sp = teal }), -- BufferLineHint xxx guifg=#94e2d5 guibg=#181825 guisp=#94e2d5
		BufferLineWarningSelected({ gui = "bold,italic", bg = base, fg = yellow, sp = yellow }), -- BufferLineWarningSelected xxx cterm=bold,italic gui=bold,italic guifg=#f9e2af guibg=#1e1e2e guisp=#f9e2af
		BufferLineWarningVisible({ bg = mantle, fg = yellow }), -- BufferLineWarningVisible xxx guifg=#f9e2af guibg=#181825
		BufferLineErrorDiagnosticSelected({ bg = base, fg = red, sp = "#b6687e" }), -- BufferLineErrorDiagnosticSelected xxx guifg=#f38ba8 guibg=#1e1e2e guisp=#b6687e
		BufferLineErrorDiagnosticVisible({ bg = mantle, fg = red }), -- BufferLineErrorDiagnosticVisible xxx guifg=#f38ba8 guibg=#181825
		BufferLineErrorDiagnostic({ bg = mantle, fg = red, sp = "#b6687e" }), -- BufferLineErrorDiagnostic xxx guifg=#f38ba8 guibg=#181825 guisp=#b6687e
		BufferLineErrorSelected({ gui = "bold,italic", bg = base, fg = red, sp = red }), -- BufferLineErrorSelected xxx cterm=bold,italic gui=bold,italic guifg=#f38ba8 guibg=#1e1e2e guisp=#f38ba8
		BufferLineErrorVisible({ bg = mantle, fg = red }), -- BufferLineErrorVisible xxx guifg=#f38ba8 guibg=#181825
		BufferLineNumbersSelected({ gui = "bold,italic", bg = base, fg = subtext0 }), -- BufferLineNumbersSelected xxx cterm=bold,italic gui=bold,italic guifg=#a6adc8 guibg=#1e1e2e
		BufferLineInfo({ bg = mantle, fg = sky, sp = sky }), -- BufferLineInfo xxx guifg=#89dceb guibg=#181825 guisp=#89dceb
		BufferLineHintSelected({ gui = "bold,italic", bg = base, fg = teal, sp = teal }), -- BufferLineHintSelected xxx cterm=bold,italic gui=bold,italic guifg=#94e2d5 guibg=#1e1e2e guisp=#94e2d5
		BufferLineSeparator({ bg = mantle, fg = "#11111b" }), -- BufferLineSeparator xxx guifg=#11111b guibg=#181825
		BufferLineCloseButtonVisible({ bg = mantle, fg = surface1 }), -- BufferLineCloseButtonVisible xxx guifg=#45475a guibg=#181825
		BufferLineCloseButton({ bg = mantle, fg = surface1 }), -- BufferLineCloseButton xxx guifg=#45475a guibg=#181825
		BufferLineOffsetSeparator({ bg = base, fg = "#11111b" }), -- BufferLineOffsetSeparator xxx guifg=#11111b guibg=#1e1e2e
		BufferLineSeparatorSelected({ bg = base, fg = "#11111b" }), -- BufferLineSeparatorSelected xxx guifg=#11111b guibg=#1e1e2e
		BufferLineSeparatorVisible({ bg = mantle, fg = "#11111b" }), -- BufferLineSeparatorVisible xxx guifg=#11111b guibg=#181825
		BufferLineIndicatorSelected({ gui = "bold,italic", bg = base, fg = peach }), -- BufferLineIndicatorSelected xxx cterm=bold,italic gui=bold,italic guifg=#fab387 guibg=#1e1e2e
		BufferLineIndicatorVisible({ gui = "bold,italic", bg = mantle, fg = peach }), -- BufferLineIndicatorVisible xxx cterm=bold,italic gui=bold,italic guifg=#fab387 guibg=#181825
		BufferLineModifiedVisible({ bg = mantle, fg = peach }), -- BufferLineModifiedVisible xxx guifg=#fab387 guibg=#181825
		BufferLineDiagnosticSelected({ gui = "bold,italic", bg = base, fg = subtext0 }), -- BufferLineDiagnosticSelected xxx cterm=bold,italic gui=bold,italic guifg=#a6adc8 guibg=#1e1e2e
		BufferLineDiagnosticVisible({ bg = mantle, fg = subtext0 }), -- BufferLineDiagnosticVisible xxx guifg=#a6adc8 guibg=#181825
		BufferLineHintDiagnosticSelected({ bg = base, fg = teal, sp = "#6fa99f" }), -- BufferLineHintDiagnosticSelected xxx guifg=#94e2d5 guibg=#1e1e2e guisp=#6fa99f
		BufferLineHintDiagnosticVisible({ bg = mantle, fg = teal }), -- BufferLineHintDiagnosticVisible xxx guifg=#94e2d5 guibg=#181825
		BufferLineDuplicate({ gui = "bold,italic", bg = mantle, fg = surface1 }), -- BufferLineDuplicate xxx cterm=bold,italic gui=bold,italic guifg=#45475a guibg=#181825
		BufferLineDuplicateVisible({ gui = "bold,italic", bg = mantle, fg = surface1 }), -- BufferLineDuplicateVisible xxx cterm=bold,italic gui=bold,italic guifg=#45475a guibg=#181825
		BufferLineDuplicateSelected({ gui = "bold,italic", bg = base, fg = text }), -- BufferLineDuplicateSelected xxx cterm=bold,italic gui=bold,italic guifg=#cdd6f4 guibg=#1e1e2e
		BufferLineBufferSelected({ gui = "bold,italic", bg = base, fg = text }), -- BufferLineBufferSelected xxx cterm=bold,italic gui=bold,italic guifg=#cdd6f4 guibg=#1e1e2e
		BufferLineBufferVisible({ bg = mantle, fg = surface1 }), -- BufferLineBufferVisible xxx guifg=#45475a guibg=#181825
		BufferLineModifiedSelected({ bg = base, fg = peach }), -- BufferLineModifiedSelected xxx guifg=#fab387 guibg=#1e1e2e
		BufferLineModified({ bg = mantle, fg = peach }), -- BufferLineModified xxx guifg=#fab387 guibg=#181825
		BufferLineCloseButtonSelected({ bg = base, fg = red }), -- BufferLineCloseButtonSelected xxx guifg=#f38ba8 guibg=#1e1e2e
		BufferLineWarningDiagnostic({ bg = mantle, fg = yellow, sp = "#baa983" }), -- BufferLineWarningDiagnostic xxx guifg=#f9e2af guibg=#181825 guisp=#baa983
		BufferLinePick({ gui = "bold,italic", bg = "#161622", fg = red }), -- BufferLinePick xxx cterm=bold,italic gui=bold,italic guifg=#f38ba8 guibg=#161622
		BufferLineInfoDiagnosticSelected({ bg = base, fg = sky, sp = "#66a5b0" }), -- BufferLineInfoDiagnosticSelected xxx guifg=#89dceb guibg=#1e1e2e guisp=#66a5b0
		BufferLinePickVisible({ gui = "bold,italic", bg = "#1b1b2a", fg = red }), -- BufferLinePickVisible xxx cterm=bold,italic gui=bold,italic guifg=#f38ba8 guibg=#1b1b2a
		BufferLinePickSelected({ gui = "bold,italic", bg = base, fg = red }), -- BufferLinePickSelected xxx cterm=bold,italic gui=bold,italic guifg=#f38ba8 guibg=#1e1e2e
		BufferLineGroupLabel({ bg = overlay2, fg = "#101019" }), -- BufferLineGroupLabel xxx guifg=#101019 guibg=#9399b2
		BufferLineMiniIconsGreySelected({ bg = base, fg = text }), -- BufferLineMiniIconsGreySelected xxx guifg=#cdd6f4 guibg=#1e1e2e
		lualine_transitional_lualine_a_insert_to_lualine_b_insert({ gui = "nocombine", bg = surface0, fg = green }), -- lualine_transitional_lualine_a_insert_to_lualine_b_insert xxx gui=nocombine guifg=#a6e3a1 guibg=#313244
		lualine_transitional_lualine_b_insert_to_lualine_c_normal({ gui = "nocombine", bg = mantle, fg = surface0 }), -- lualine_transitional_lualine_b_insert_to_lualine_c_normal xxx gui=nocombine guifg=#313244 guibg=#181825
		lualine_transitional_lualine_a_normal_to_lualine_b_normal({ gui = "nocombine", bg = surface0, fg = blue }), -- lualine_transitional_lualine_a_normal_to_lualine_b_normal xxx gui=nocombine guifg=#89b4fa guibg=#313244
		lualine_transitional_lualine_b_normal_to_lualine_c_normal({ gui = "nocombine", bg = mantle, fg = surface0 }), -- lualine_transitional_lualine_b_normal_to_lualine_c_normal xxx gui=nocombine guifg=#313244 guibg=#181825
		lualine_transitional_lualine_a_command_to_lualine_b_command({
			gui = "nocombine",
			bg = surface0,
			fg = peach,
		}), -- lualine_transitional_lualine_a_command_to_lualine_b_command xxx gui=nocombine guifg=#fab387 guibg=#313244
		lualine_transitional_lualine_b_command_to_lualine_c_normal({
			gui = "nocombine",
			bg = mantle,
			fg = surface0,
		}), -- lualine_transitional_lualine_b_command_to_lualine_c_normal xxx gui=nocombine guifg=#313244 guibg=#181825
		lualine_transitional_lualine_b_command_to_lualine_x_12_command({
			gui = "nocombine",
			bg = mantle,
			fg = surface0,
		}), -- lualine_transitional_lualine_b_command_to_lualine_x_12_command xxx gui=nocombine guifg=#313244 guibg=#181825
	}
end)

return theme
