local ls = require("luasnip")

-- for this project remove code snippets
local vscode = require("luasnip.loaders.from_vscode")
vscode.clean()

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local fake_indent = "    "

local function make_group(trig, cmd, pre_label, desc)
    return s({ trig = trig, dscr = desc }, {
        t("\\" .. cmd .. "{"),
        i(1, ""),
        t("}"),
        t("\\label{" .. pre_label .. ":"),
        f(function(args)
            local title = args[1][1] or ""
            -- lowercase
            local label = title:lower()
            -- replace non-alphanumeric characters with underscores
            label = label:gsub("[^a-zA-Z0-9]+", "_")
            -- trim potential leading/trailing underscores
            label = label:gsub("^_+", ""):gsub("_+$", "")
            return label
        end, { 1 }),
        t({ "} % (fold)", "" }),
        i(0),
        t({ "", "% " .. cmd .. " " }),
        f(function(args)
            return args[1][1]
        end, { 1 }),
        t(" (end)"),
    })
end

return {
    s({ trig = "red", desc = "Red text (\\red{})" }, {
        t("\\red{"),
        i(1, ""),
        t("}"),
    }),
    s({ trig = "bold", desc = "Bold text (\\textbf{})" }, {
        t("\\textbf{"),
        i(1, ""),
        t("}"),
    }),
    s({ trig = "italic", desc = "Italic text (\\textit{})" }, {
        t("\\textit{"),
        i(1, ""),
        t("}"),
    }),
    -- ==== WRAPPERS ====
    s({ trig = "wred", dscr = "Wrap red text" }, {
        t("\\red{"),
        f(function(_, snip)
            return snip.env.TM_SELECTED_TEXT or {}
        end, {}),
        t("}"),
    }),
    s({ trig = "wbold", dscr = "Wrap bold text" }, {
        t("\\textbf{"),
        f(function(_, snip)
            return snip.env.TM_SELECTED_TEXT or {}
        end, {}),
        t("}"),
    }),
    s({ trig = "witalic", dscr = "Wrap italic text" }, {
        t("\\textit{"),
        f(function(_, snip)
            return snip.env.TM_SELECTED_TEXT or {}
        end, {}),
        t("}"),
    }),
    s({ trig = "item", dscr = "Item new line", indent = true }, {
        t({ "", "\t\\item " }),
        i(1),
    }),
    s({ trig = "itemize", dscr = "Itemize environment (opt wrap)", indet = true }, {
        t({ "\\begin{itemize}", "\t\\item " }),
        f(function(_, snip)
            return snip.env.TM_SELECTED_TEXT
        end),
        i(1, ""),
        t({ "", "\\end{itemize}" }),
    }),
    s({ trig = "enumerate", dscr = "Enumerate environment (opt wrap)", indet = true }, {
        t({ "\\begin{enumerate}", "\t\\item " }),
        f(function(_, snip)
            return snip.env.TM_SELECTED_TEXT
        end),
        i(1, ""),
        t({ "", "\\end{enumerate}" }),
    }),
    s({ trig = "ieq", dscr = "Inline equation" }, {
        t("$"),
        i(1),
        t("$"),
    }),
    s({ trig = "eq", dscr = "Equation block", indet = true }, {
        t({ "\\[", fake_indent }),
        i(1),
        t({ "", "\\]", "" }),
    }),
    s({ trig = "beq", dscr = "Numbered equation block", indet = true }, {
        t({ "\\begin{equation}", fake_indent }),
        i(1),
        t({ "", "\\end{equation}", "" }),
    }),
    s({ trig = "begin", dscr = "Begin environment block", indet = true }, {
        t("\\begin{"),
        i(1, ""),
        t({ "}", fake_indent }),
        i(0),
        t({ "", "\\end{" }),
        f(function(args)
            return args[1][1]
        end, { 1 }),
        t("}"),
    }),
    make_group("chap", "chapter", "chap", "Labeled chapter"),
    make_group("sec", "section", "sec", "Labeled section"),
    make_group("sub", "subsection", "sub", "Labeled subsection"),
    make_group("subs", "subsubsection", "sub", "Labeled subsubsection"),
    make_group("par", "paragraph", "par", "Labeled paragraph"),
    s({ trig = "link", desc = "Link (\\hyperref[]{})" }, {
        t("\\hyperref["),
        i(2),
        t("]{"),
        i(1),
        t("}"),
        i(0),
    }),
}
