" Deeply inspired by https://github.com/rhysd/vim-gfm-syntax

syntax match myMarkdownDate "\d\{2,4\}-\d\{2\}-\d\{2\}" display
syntax match myMarkdownMention "\%(^\|\s\)\@<=@[[:alnum:]-]\+" display
syntax match myMarkdownTag ":[[:alnum:]_+-]\+:" display
syntax match myMarkdownProject "\(^\|\s\)+[[:alnum:]_]\+" display

syntax match myMarkdownCheckBox "\%(\_^\s*\%(-\|\*\|+\|\d\+\.\)\s\+\)\@<=\[[ x]]" contains=myMarkdownCheckBoxBracket,myMarkdownCheckBoxX
syntax match myMarkdownCheckBoxBracket "\[\|]" containedin=myMarkdownCheckBox contained
syntax keyword myMarkdownCheckBoxX x containedin=myMarkdownCheckBox contained

syntax match myMarkdownTable "^|.\+|\s*$" contains=myMarkdownTableDelimiter,myMarkdownTableAligner,myMarkdownTableAlignBorder,myMarkdownTableBorder
syntax match myMarkdownTableAlignBorder ":-\+:" contained containedin=myMarkdownTable display
syntax match myMarkdownTableAligner "-\@<=:" contained containedin=myMarkdownTableAlignBorder display
syntax match myMarkdownTableAligner ":-\@=" contained containedin=myMarkdownTableAlignBorder display
syntax match myMarkdownTableBorder "-\+" contained containedin=myMarkdownTableAlignBorder display
syntax match myMarkdownTableDelimiter "\\\@<!|" contained containedin=myMarkdownTable display

syntax cluster mkdNonListItem add=mkdLink,myMarkdownMention,myMarkdownTag,myMarkdownDate,myMarkdownIssue,myMarkdownCheckBoxBracket,myMarkdownCheckBoxX,myMarkdownTableDelimiter,myMarkdownTableAligner,myMarkdownTableBorder,myMarkdownProject

highlight link myMarkdownCheckBoxBracket Identifier
highlight link myMarkdownCheckBoxX       Special
highlight link myMarkdownDate            Label
highlight link myMarkdownMention         Statement
highlight link myMarkdownTableAligner    Delimiter
highlight link myMarkdownTableBorder     Type
highlight link myMarkdownTableDelimiter  Delimiter
highlight link myMarkdownTag             Keyword
highlight link myMarkdownProject         Constant

highlight link mkdCode             Constant
highlight link mkdCodeDelimiter    Delimiter
highlight link mkdCodeEnd          Delimiter
highlight link mkdCodeStart        Delimiter
highlight link mkdHeading          Title
