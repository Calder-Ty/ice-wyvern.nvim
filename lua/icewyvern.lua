local api =	vim.api;
local colors = require("palette");

local M = {};

M.stylings = {
	i =				'italic';
	italic =		'italic';
	b =				'bold';
	bold =			'bold';
	bi=				'bold,italic';
	bold_italic=	'bold,italic';
	underline =		'underline';
	u =				'underline';
	reverse=		'reverse';
	r=				'reverse';
	rb=				'reverse,bold';
}

M.colors = colors

function M.highlight(group, style)
	local gui = style.gui and 'gui=' .. style.gui or 'gui=NONE'
	local fg  = style.fg  and 'guifg='  .. style.fg  or 'guifg=NONE'
	local bg  = style.bg  and 'guibg='  .. style.bg  or 'guibg=NONE'
	local sp  = style.sp  and 'guisp='  .. style.sp  or ''
	api.nvim_command('hi ' .. group .. ' ' .. gui .. ' ' .. fg .. ' ' .. bg .. ' ' .. sp)
	if (style.link) then
		vim.cmd(string.format('highlight! link %s %s', group, style.link))
	end
end



function M.load_colors()
	local styles = M.stylings
	local syntax = {

		LineNr=			{fg=colors.green1,											};
		CursorLineNr=	{fg=colors.green1,								gui=styles.bold};
		StatusLine = {bg=colors.none};
		Visual=			{fg=colors.none,			bg=colors.black1,	gui=colors.none};
		WinSeparator=	{fg=colors.blue5,			bg=colors.none,		gui=colors.none};
		SignColumn=		{																};
		ColorColumn=	{fg=colors.none,			bg=colors.black2,	gui=colors.none};
		CursorColumn=	{fg=colors.none,			bg=colors.black3, gui=colors.none};
		PmenuSel=		{fg=colors.none,			bg=colors.blue5, gui=colors.none};

		--Screen tooling
		Cursor=			{fg=colors.black3,			bg=colors.white,	gui=colors.none};
		CursorLine=		{							bg=colors.offblack					};
		IncSearch=		{fg=colors.yellow,			bg=colors.black,	gui=styles.r};
		MatchParen=		{fg=colors.orange,				bg=colors.none,		gui=styles.underline};
		Pmenu=			{fg=colors.none,			bg=colors.none,		gui=colors.none};
		Search=			{fg=colors.white,			bg=colors.blue5, gui=colors.none};

		-- Diff Stuff
		DiffAdd=		{fg=colors.white,			bg=colors.green4,	gui=styles.none};
		DiffChange=		{fg=colors.white,			bg=colors.indigo4,	gui=colors.none};
		DiffDelete=		{fg=colors.orange,			bg=colors.none,		gui=colors.none};
		DiffText=		{fg=colors.white,			bg=colors.none,		gui=styles.none};

		-- Messages
		ErrorMsg=		{fg=colors.black3,			bg=colors.orange,		gui=colors.none};
		WarningMsg=		{fg=colors.black3,			bg=colors.yellow,	gui=colors.none};

		-- Text types
		Constant=		{fg=colors.blue2,		bg=colors.none,		gui=colors.none};
		Boolean=		{link="Constant"};
		Character=		{link="Constant"};
		Float=			{link="Constant"};
		Number=			{link="Constant"};

		String=			{fg=colors.green1,		bg=colors.none,		gui=colors.none};
		Function=		{fg=colors.blue1,	bg=colors.none,		gui=colors.none};
		Comment=		{fg=colors.green5,		bg=colors.none,		gui=colors.none};
		NonText=		{fg=colors.none,			bg=colors.none,		gui=colors.none};
		Normal=			{fg=colors.indigo1,		bg=colors.none,		gui=colors.none};
		NormalFloat=	{fg=colors.indigo1,		bg=colors.black3,		gui=colors.none};

		Conditional=	{fg=colors.indigo5,				bg=colors.none,		gui=styles.i};
		Define=			{fg=colors.indigo5,				bg=colors.none,		gui=colors.none};
		Directory=		{fg=colors.green1,			bg=colors.none,		gui=colors.none};
		Folded=			{fg=colors.white4,			bg=colors.shadow,	gui=colors.none};
		Identifier=		{fg=colors.lightcyan,		bg=colors.none,		gui=styles.none};
		Keyword=		{fg=colors.green4,		bg=colors.none,		gui=styles.bold};
		Label=			{fg=colors.yellow,		bg=colors.none,		gui=colors.none};
		Operator=		{fg=colors.orange,	bg=colors.none,		gui=colors.none};
		PreProc=		{fg=colors.blue5,			bg=colors.none,		gui=colors.none};
		SpecialComment=	{fg=colors.black1,			bg=colors.none,		gui=colors.none};
		Special=		{fg=colors.blue3,		bg=colors.none,		gui=colors.none};
		SpecialKey=		{fg=colors.black2,		bg=colors.black1, gui=colors.none};
		Statement=		{fg=colors.blue3,		bg=colors.none,		gui=colors.none};
		StorageClass=	{fg=colors.blue4,		bg=colors.none,		gui=styles.b};
		Tag=			{fg=colors.indigo5,				bg=colors.none,		gui=colors.none};
		Title=			{fg=colors.white1,			bg=colors.none,		gui=styles.bold};
		Todo=			{fg=colors.black,			bg=colors.green4,gui=colors.none};
 		Type=			{fg=colors.blue2,		bg=colors.none,		gui=styles.b};
		Underlined=		{fg=colors.none,			bg=colors.none,		gui=styles.underline};
		Whitespace=		{fg=colors.black2};
		SnippetTabstop = {bg=colors.none, gui=styles.underline};

		-- Diagnostics
		DiagnosticError=			{fg=colors.orange,		bg=colors.offblack};
		DiagnosticHint=				{fg=colors.blue3,	bg=colors.offblack};
		DiagnosticInfo=				{fg=colors.white,	bg=colors.offblack};
		DiagnosticWarn=				{fg=colors.yellow,	bg=colors.offblack};
		DiagnosticUnnecessary=		{fg=colors.black2,					gui=styles.u};

		DiagnosticSignError =		{link="DiagnosticError"};
		DiagnosticSignHint =		{link="DiagnosticHint"};
		DiagnosticSignInfo =		{link="DiagnosticInfo"};
		DiagnosticSignWarn =		{link="DiagnosticWarn"};

		DiagnosticVirtualTextError= {fg=colors.orange,		bg=colors.none};
		DiagnosticVirtualTextHint=  {fg=colors.cyan,	bg=colors.none};
		DiagnosticVirtualTextInfo=  {fg=colors.white,	bg=colors.none};
		DiagnosticVirtualTextWarn=  {fg=colors.brown,	bg=colors.none};

		-- Supported Plugins:
		--
		-- GitGutter
		GitGutterAdd=		{fg=colors.green5};
		GitGutterChange=	{fg=colors.blue4};
		GitGutterDelete=	{link="DiffDelete"};
		GitSignsCurrentLineBlame= {link="SpecialComment"};
		-- Fugitive
		fugitiveStagedSection = {fg=colors.indigo2};
		fugitiveUnstagedSection = {fg=colors.indigo4};
		diffOldFile= {fg=colors.blue1};
		diffNewFile= {fg=colors.green5};

		diffAdded=		{link="DiffAdd"};
		diffRemoved=	{fg=colors.orange};
		gitDiff=		{fg=colors.white4};
		GitSignsAdd= {link="GitGutterAdd"};
		GitSignsChange= {link="GitGutterChange"};
		GitSignsDelete= {link="GitGutterDelete"};

		-- Neogit
		NeogitDiffAdd= {link="GitGutterAdd"};
		NeogitDiffDelete={link="GitGutterDelete"};

		NeogitDiffContext={link="Normal"};
		NeogitChangeModified = {link="GitGutterChange"};
		NeogitChangeAdded = {link="NeogitDiffAdd"};
		NeogitChangeDeleted = {link="NeogitDiffDelete"};
		NeogitFilePath = {bg=colors.none};
		NeogitCommitViewHeader = {link="Title"};
		NeogitHunkHeaderHighlight = {bg=colors.none};
		NeogitDiffContextHighlight = {bg=colors.none};
		NeogitDiffAddHighlight = {link="NeogitDiffAdd"};
		NeogitDiffDeleteHighlight = {link="GitGutterDelete"};
		NeogitDiffHeaderHighlight = {link="Title"};
		NeogitDiffHeader = {link="Title"};
		NeogitHunkHeaderCursor = {link="Title"};
		NeogitHunkHeader = {link="Title"};
		NeogitDiffContextCursor = {link="Title"};
		NeogitDiffAddCursor = {link="NeogitDiffAdd"};
		NeogitDiffDeleteCursor = {link="GitGutterDelete"};
		NeogitDiffHeaderCursor = {link="Title"};
		NeogitSectionHeader = {link="Title"};
		NeogitFloatHeader = {link="Title"};
		NeogitHunkMergeHeader = {link="Title"};
		NeogitSectionHeaderCount = {link="Title"};
		NeogitFloatHeaderHighlight = {link="Title"};
		NeogitHunkMergeHeaderCursor = {link="Title"};
		NeogitHunkMergeHeaderHighlight = {link="Title"};

		-- LangStuff, Push this to other places probably
		RustInlay = {fg=colors.white4};
		pythonEscape = {fg="#ae81ff"};

	}
	-- Treesitter stuff
	syntax["@variable"] = {fg=colors.indigo2, gui=styles.none};


	syntax["@attribute.zig"] = {fg=colors.blue3};
	syntax["@type.qualifier"] = {fg=colors.blue1};
	syntax["@keyword"] = {link = "Keyword"};
	syntax["@keyword.return"] = {link = "Keyword", gui=styles.i};
	syntax["@keyword.repeat"] = {link = "Keyword"};
	syntax["@keyword.conditional"] = {link = "Keyword"};
	syntax["@keyword.exception.zig"] = {link = "Operator"};
	syntax["@lsp.type.comment.documentation"] = {fg=colors.back1};
	syntax["@punctuation"] = {link="Special"}

	-- Semantic highlights
	syntax["@lsp.type.operator.zig"] = {link="Operator"};
	syntax["@lsp.type.namespace"] = {fg=colors.blue4};
	syntax["@lsp.type.property"] = {fg=colors.purple};
	syntax["@lsp.type.parameter"] = {fg=colors.green2};
	syntax["@lsp.type.variable"] = {fg=colors.indigo3, gui=styles.none};
	syntax["@lsp.type.label"] = {fg=colors.white3};
	syntax["@lsp.mod.declaration"] = {gui=styles.i};
	syntax["@lsp.type.errorTag"] = {link="Type",	gui=styles.b}


	return syntax
end

function M.colorscheme()
	--api.nvim_command('hi clear')
	if vim.fn.exists('syntax_on') then
		api.nvim_command('syntax reset')
	end
	-- This is a dark background
	vim.o.background = 'light'
	vim.o.termguicolors = true
	vim.g.colors_name = 'monocle'
	local syntax = M.load_colors()
	for group,style in pairs(syntax) do
		M.highlight(group, style)
	end
end

-- M.colorscheme()

return M

