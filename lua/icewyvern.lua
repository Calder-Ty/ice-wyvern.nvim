local api =	vim.api;
local colors = require("lua.palette");

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

function M.highlight(group, style)
	local gui = style.gui and 'gui=' .. style.gui or 'gui=NONE'
	local fg  = style.fg  and 'guifg='  .. style.fg  or 'guifg=NONE'
	local bg  = style.bg  and 'guibg='  .. style.bg  or 'guibg=NONE'
	local sp  = style.sp  and 'guisp='  .. style.sp  or ''
	api.nvim_command('hi ' .. group .. ' ' .. gui .. ' ' .. fg .. ' ' .. bg .. ' ' .. sp)
	if (style.link) then
		vim.cmd(sting.format('highlight! link %s %s', group, color.link))
	end
end



function M.load_colors()
	local styles = M.stylings
	local syntax = {



		--Screen tooling
		ColorColumn=	{fg=colors.none,			bg=colors.black,	gui=colors.none};
		CursorColumn=	{fg=colors.none,			bg=colors.offblack, gui=colors.none};
		Cursor=			{fg=colors.shadow,			bg=colors.white,	gui=colors.none};
		CursorLine=		{							bg=colors.offblack					};
		CursorLineNr=	{fg=colors.slateblue,							gui=styles.bold};
		IncSearch=		{fg=colors.yellow,			bg=colors.black,	gui=styles.r};
		LineNr=			{fg=colors.blue5,											};
		MatchParen=		{fg=colors.red,				bg=colors.none,		gui=styles.underline};
		Pmenu=			{fg=colors.none,			bg=colors.none,		gui=colors.none};
		PmenuSel=		{fg=colors.none,			bg=colors.darkgray, gui=colors.none};
		Search=			{fg=colors.white,			bg=colors.darkblue, gui=colors.none};
		SignColumn=		{																};
		StatusLine=		{fg=colors.white,			bg=colors.gray,		gui=styles.bold};
		StatusLineNC=	{fg=colors.white,			bg=colors.none,		gui=colors.none};
		TabLine=		{																};
		Visual=			{fg=colors.none,			bg=colors.darkgray, gui=colors.none};
		WinSeparator=	{fg=colors.blue,			bg=colors.none,		gui=colors.none};

		-- Diff Stuff
		DiffAdd=		{fg=colors.white,			bg=colors.green,	gui=styles.bold};
		DiffChange=		{fg=colors.white,			bg=colors.cobalt,	gui=colors.none};
		DiffDelete=		{fg=colors.darkred,			bg=colors.none,		gui=colors.none};
		DiffText=		{fg=colors.white,			bg=colors.darkblue, gui=styles.bold};

		-- Messages
		ErrorMsg=		{fg=colors.white,			bg=colors.red,		gui=colors.none};
		WarningMsg=		{fg=colors.white,			bg=colors.brown,		gui=colors.none};

		-- Text types
		Boolean=		{fg=colors.lightpurple,		bg=colors.none,		gui=colors.none};
		Character=		{fg=colors.lightpurple,		bg=colors.none,		gui=colors.none};
		Comment=		{fg=colors.darkgreen,		bg=colors.none,		gui=colors.none};
		Conditional=	{fg=colors.red,				bg=colors.none,		gui=styles.i};
		Constant=		{fg=colors.lightpurple,		bg=colors.none,		gui=colors.none};
		Define=			{fg=colors.red,				bg=colors.none,		gui=colors.none};
		Directory=		{fg=colors.violet,			bg=colors.none,		gui=colors.none};
		Float=			{fg=colors.lightpurple,		bg=colors.none,		gui=colors.none};
		Folded=			{fg=colors.gray,			bg=colors.shadow,	gui=colors.none};
		Function=		{fg=colors.lightmagenta,	bg=colors.none,		gui=colors.none};
		Identifier=		{fg=colors.lightcyan,		bg=colors.none,		gui=styles.none};
		Keyword=		{fg=colors.specialcyan,		bg=colors.none,		gui=styles.bold};
		Label=			{fg=colors.lightyellow,		bg=colors.none,		gui=colors.none};
		NonText=		{fg=colors.none,			bg=colors.none,		gui=colors.none};
		Normal=			{fg=colors.lightgray,		bg=colors.none,		gui=colors.none};
		Number=			{fg=colors.lightpurple,		bg=colors.none,		gui=colors.none};
		Operator=		{fg=colors.lightmagenta,	bg=colors.none,		gui=colors.none};
		PreProc=		{fg=colors.violet,			bg=colors.none,		gui=colors.none};
		SpecialComment=	{fg=colors.gray,			bg=colors.none,		gui=colors.none};
		Special=		{fg=colors.specialcyan,		bg=colors.none,		gui=colors.none};
		SpecialKey=		{fg=colors.darkgray,		bg=colors.offblack, gui=colors.none};
		Statement=		{fg=colors.lightblue,		bg=colors.none,		gui=colors.none};
		StorageClass=	{fg=colors.lightcyan,		bg=colors.none,		gui=styles.none};
		String=			{fg=colors.seagreen,		bg=colors.none,		gui=colors.none};
		Tag=			{fg=colors.red,				bg=colors.none,		gui=colors.none};
		Title=			{fg=colors.white,			bg=colors.none,		gui=styles.bold};
		Todo=			{fg=colors.black,			bg=colors.darkgreen,gui=colors.none};
 		Type=			{fg=colors.slateblue,		bg=colors.none,		gui=styles.b};
		Underlined=		{fg=colors.none,			bg=colors.none,		gui=styles.underline};
		Whitespace=		{fg=colors.darkgray											};

		-- Diagnostics
		DiagnosticError=			{fg=colors.red,		bg=colors.offblack};
		DiagnosticHint=				{fg=colors.cyan,	bg=colors.offblack};
		DiagnosticInfo=				{fg=colors.white,	bg=colors.offblack};
		DiagnosticWarn=				{fg=colors.brown,	bg=colors.offblack};
		DiagnosticUnnecessary=		{fg=colors.darkgray,					gui=styles.u};

		DiagnosticSignError =		{fg=colors.red,		bg=colors.none};
		DiagnosticSignHint =		{fg=colors.cyan,	bg=colors.none};
		DiagnosticSignInfo =		{fg=colors.white,	bg=colors.none};
		DiagnosticSignWarn =		{fg=colors.brown,	bg=colors.none};

		DiagnosticVirtualTextError= {fg=colors.red,		bg=colors.none};
		DiagnosticVirtualTextHint=  {fg=colors.cyan,	bg=colors.none};
		DiagnosticVirtualTextInfo=  {fg=colors.white,	bg=colors.none};
		DiagnosticVirtualTextWarn=  {fg=colors.brown,	bg=colors.none};

		-- Supported Plugins:
		--
		-- GitGutter
		GitGutterAdd=		{fg=colors.darkgreen};
		GitGutterChange=	{fg=colors.cobalt};
		GitGutterDelete=	{fg=colors.darkred};

		-- Fugitive
		diffOldFile= {fg=colors.darkred};
		diffNewFile= {fg=colors.darkgreen};

		diffAdded=		{fg=colors.seagreen };
		diffRemoved=	{fg=colors.darkred };
		gitDiff=		{fg=colors.grey };

		-- LangStuff, Push this to other places probably
		RustInlay = {fg=colors.gray};
		pythonEscape = {fg="#ae81ff"};

	}
	-- Treesitter stuff
	syntax["@attribute.zig"] = {fg=colors.violet};
	syntax["@variable"] = {fg=colors.lightcyan, gui=styles.none};
	syntax["@type.qualifier"] = {fg=colors.seablue};
	syntax["@keyword.return"] = {fg=colors.rose};
	syntax["@keyword.repeat"] = {fg=colors.rose};
	syntax["@keyword.conditional"] = {fg=colors.rose};

	-- Semantic highlights
	syntax["@lsp.type.operator.zig"] = {fg=colors.lightmagenta};
	syntax["@lsp.type.namespace"] = {fg=colors.violet};
	syntax["@lsp.type.property"] = {fg=colors.lightbrown};
	syntax["@lsp.type.parameter"] = {fg=colors.blue};
	syntax["@lsp.type.variable"] = {fg=colors.celeste, gui=styles.none};
	syntax["@lsp.type.label"] = {fg=colors.red};
	syntax["@lsp.mod.declaration"] = {gui=styles.i};
	syntax["@lsp.type.errorTag"] = {fg=colors.slateblue,		bg=colors.none,		gui=styles.b}

	return syntax
end

function M.colorscheme()
	--api.nvim_command('hi clear')
	if vim.fn.exists('syntax_on') then
		api.nvim_command('syntax reset')
	end
	-- This is a dark background
	vim.o.background = 'dark'
	vim.o.termguicolors = true
	vim.g.colors_name = 'monocle'
	local syntax = M.load_colors()
	for group,style in pairs(syntax) do
		M.highlight(group, style)
	end
end

M.colorscheme()

return M

