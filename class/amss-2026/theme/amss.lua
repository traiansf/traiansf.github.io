-- Presentation structure shared by every AMSS output (see include.mk).
--
-- * Splits a title such as "AMSS 2026/2027 — Cursul 1: Organizare și motivație"
--   into `session` ("Cursul 1") and `headline` ("Organizare și motivație"),
--   which the templates lay out separately. The HTML page title and the PDF
--   document title keep the full string.
-- * Hands the course identity from course.yaml to the PDF builds through
--   fields the default LaTeX templates already print: `institute` on the
--   beamer cover and footline, `subtitle` above the title of a document.
-- * Marks the "Ideea întâlnirii" heading with the class `epigraph`, so the
--   quotation that follows is typeset as an epigraph.
-- * In continuous documents (Lab 0, the project page), drops a leading
--   level-1 heading that repeats the title and any instructor notes.
-- * In HTML, wraps tables so that a wide one can scroll, lets code blocks
--   take the keyboard focus and keeps ranges such as 10–12 on one line. An
--   HTML comment `<!-- table-class: NAME -->` on the line before a table
--   gives the table's wrapper the class NAME (the project rubric uses it).
-- * In decks, ties the last word of a longer paragraph to the one before it,
--   so that no line holds a single word; in PDF decks, sets table headers in
--   bold and rules off the rows, as the HTML decks do; in HTML decks, turns
--   each pause (". . .") into a marker for theme/deck.js, because pandoc
--   prints a pause inside a column, a quotation or a list as text.

local stringify = pandoc.utils.stringify

local is_beamer = FORMAT == 'beamer'
local is_latex = FORMAT == 'latex'
local is_slidy = FORMAT == 'slidy'
local is_html_doc = FORMAT:match('^html') ~= nil
local is_html = is_html_doc or is_slidy
local is_doc = is_latex or is_html_doc
local is_deck = is_beamer or is_slidy

local EM_DASH = '\u{2014}'
local EN_DASH = 0x2013
local NBSP = '\u{a0}'
local EPIGRAPH_TITLE = 'Ideea întâlnirii'

local full_title, short_title, headline

-- A browser may break a line after the dash of 10–12, 09:00–17:00 or F3–F4,
-- and after the hyphen of „te-ai” or „e-mail”; in HTML such a word is kept
-- on one line. Letters and digits are recognised by code point: %w in a Lua
-- pattern depends on the C locale, which differs between pandoc on Windows
-- and on Linux. A long compound stays breakable, so that it cannot widen a
-- phone's page; titles are set larger, so the limit is lower there.
local RANGE_LIMIT = 24
local TITLE_RANGE_LIMIT = 14
local HYPHENATED_LIMIT = 14
local HYPHEN = 0x2D

local function wordlike(cp)
  if cp < 128 then
    return (cp >= 48 and cp <= 57) or (cp >= 65 and cp <= 90) or (cp >= 97 and cp <= 122)
  end
  -- Not the no-break space and its neighbours, nor quotation marks and dashes.
  return cp >= 0xC0 and not (cp >= 0x2000 and cp <= 0x206F)
end

local function unbreakable_range(str, limit)
  local chars = {}
  for _, cp in utf8.codes(str.text) do
    chars[#chars + 1] = cp
  end
  if #chars > (limit or RANGE_LIMIT) then
    return nil
  end
  for i = 2, #chars - 1 do
    local joins = chars[i] == EN_DASH or (chars[i] == HYPHEN and #chars <= HYPHENATED_LIMIT)
    if joins and wordlike(chars[i - 1]) and wordlike(chars[i + 1]) then
      return pandoc.Span({ str }, pandoc.Attr('', { 'nowrap' }))
    end
  end
end

local function inlines(text)
  return pandoc.MetaInlines(pandoc.Inlines(pandoc.Str(text)))
end

-- A title for the body of an HTML page, word by word, so that a range in it
-- stays on one line while the title can still wrap. The other metadata is
-- left as plain text: it also lands in attributes and in the page title.
local function title_inlines(text)
  if not is_html then
    return inlines(text)
  end
  local words = pandoc.Inlines({})
  for word in text:gmatch('[^ ]+') do
    if #words > 0 then
      words:insert(pandoc.Space())
    end
    local str = pandoc.Str(word)
    words:insert(unbreakable_range(str, TITLE_RANGE_LIMIT) or str)
  end
  return pandoc.MetaInlines(words)
end

-- The same for the text of an HTML page, headings with the lower limit. The
-- traversal goes top-down, so that it can stop at a heading and at each new
-- span (the second return value) instead of wrapping its word again.
local function protect_ranges(blocks)
  return blocks:walk({
    traverse = 'topdown',
    Header = function(header)
      return header:walk({
        Str = function(str) return unbreakable_range(str, TITLE_RANGE_LIMIT) end,
      }), false
    end,
    Str = function(str)
      local span = unbreakable_range(str)
      if span then
        return span, false
      end
    end,
  })
end

local function split_title(meta)
  if not meta.title then
    return meta
  end
  full_title = stringify(meta.title)
  -- "AMSS 2026/2027 — rest": the templates show the course separately.
  -- (Plain spaces and digits in the patterns: %s and %w depend on the locale.)
  short_title = full_title:match('^AMSS +[0-9][^ ]* +' .. EM_DASH .. ' +(.+)$') or full_title
  -- "Cursul 1: Titlu": a session is one word and a number, nothing looser.
  local session, rest = short_title:match('^(.-): +(.+)$')
  if not (session and session:match('^[^ 0-9]+ +[0-9]+$')) then
    session, rest = nil, nil
  end
  headline = rest or short_title

  if session then
    meta.session = inlines(session)
  end
  meta.headline = title_inlines(headline)

  local label = meta['course-label'] and stringify(meta['course-label'])
  local name = meta['course-name'] and stringify(meta['course-name'])

  if is_beamer then
    -- The cover prints \insertsubtitle, \inserttitle and \insertinstitute.
    meta.title = inlines(headline)
    meta['title-meta'] = full_title
    if session then
      meta.subtitle = inlines(meta.subtitle and session .. ' ' .. EM_DASH .. ' ' .. stringify(meta.subtitle) or session)
    end
    if name and not meta.institute then
      meta.institute = inlines(name)
      meta.shortinstitute = label and inlines(label) or nil
    end
  elseif is_latex then
    meta.title = inlines(short_title)
    meta['title-meta'] = full_title
    if label and name and not meta.subtitle then
      meta.subtitle = inlines(label .. ' ' .. EM_DASH .. ' ' .. name)
    end
  end
  return meta
end

local function repeats_title(header)
  local text = stringify(header.content)
  return text == full_title or text == short_title or text == headline
end

local function mark_epigraph(header)
  if stringify(header.content) == EPIGRAPH_TITLE and not header.classes:includes('epigraph') then
    header.classes:insert('epigraph')
  end
  return header
end

-- A code block wider than its column scrolls sideways; it has to take the
-- keyboard focus for that to work without a pointer.
local function focusable_code(block)
  if is_html then
    block.attributes.tabindex = '0'
    return block
  end
end

-- The slide writers leave instructor notes out; documents must do the same.
local function drop_notes(div)
  if is_doc and div.classes:includes('notes') then
    return {}
  end
end

-- PDFs: header cells in bold; in decks also a hairline between body rows
-- (\amssrowrule is defined in theme/beamer.tex). The rule has to be the first
-- thing in its row, so it goes into the first cell only when pandoc writes
-- that cell as plain text: a cell with a span, a line break or other blocks
-- is set in \multicolumn, \multirow, \vtop or a minipage.
local function plain_cell(cell)
  if cell.row_span ~= 1 or cell.col_span ~= 1 then
    return false
  end
  for _, block in ipairs(cell.contents) do
    if block.t ~= 'Plain' and block.t ~= 'Para' then
      return false
    end
  end
  local plain = true
  cell.contents:walk({ LineBreak = function() plain = false end })
  return plain
end

local function pdf_table(tbl)
  if not (is_beamer or is_latex) then
    return nil
  end
  for _, row in ipairs(tbl.head.rows) do
    for _, cell in ipairs(row.cells) do
      cell.contents = cell.contents:walk({
        Plain = function(p) return pandoc.Plain({ pandoc.Strong(p.content) }) end,
        Para = function(p) return pandoc.Para({ pandoc.Strong(p.content) }) end,
      })
    end
  end
  if not is_beamer then
    return tbl
  end
  -- Every row or none: a table in which some row cannot take the rule keeps
  -- pandoc's plain look. Below a cell that spans rows, a row no longer
  -- starts in the first column.
  for _, body in ipairs(tbl.bodies) do
    for i, row in ipairs(body.body) do
      for _, cell in ipairs(row.cells) do
        if cell.row_span ~= 1 then
          return tbl
        end
      end
      if i > 1 and not (row.cells[1] and plain_cell(row.cells[1])) then
        return tbl
      end
    end
  end
  for _, body in ipairs(tbl.bodies) do
    for i, row in ipairs(body.body) do
      if i > 1 then
        local first = row.cells[1]
        if #first.contents == 0 then
          first.contents = pandoc.Blocks({ pandoc.Plain({}) })
        end
        first.contents[1].content:insert(1, pandoc.RawInline('latex', '\\amssrowrule '))
      end
    end
  end
  return tbl
end

-- Decks: no line with a single word at the end of a longer paragraph or list
-- item. Tables and notes are left alone (see the traversal below). The two
-- words are tied only when they are text (an image would be pulled onto the
-- word's line) and short enough together to fit a line on a phone.
local LAST_WORD_LIMIT = 14
local TIED_WORDS_LIMIT = 24

local function is_break(el)
  return el.t == 'Space' or el.t == 'SoftBreak' or el.t == 'LineBreak'
end

local function plain_text(inls)
  local textual = true
  local function other() textual = false end
  inls:walk({ Image = other, LineBreak = other, Math = other, Note = other, RawInline = other })
  return textual and stringify(inls) or nil
end

local function tie_last_word(block)
  if not is_deck then
    return nil
  end
  local content = block.content
  local spaces = 0
  for _, el in ipairs(content) do
    if el.t == 'Space' or el.t == 'SoftBreak' then
      spaces = spaces + 1
    end
  end
  if spaces < 5 then
    return nil
  end
  for i = #content, 1, -1 do
    local el = content[i]
    if el.t == 'Space' or el.t == 'SoftBreak' then
      local last, before = pandoc.Inlines({}), pandoc.Inlines({})
      for j = i + 1, #content do
        last:insert(content[j])
      end
      for j = i - 1, 1, -1 do
        if is_break(content[j]) then
          break
        end
        before:insert(1, content[j])
      end
      local last_text, before_text = plain_text(last), plain_text(before)
      if last_text and before_text then
        -- An emphasised phrase is one element: only its last word counts.
        local n, m = utf8.len(last_text), utf8.len(before_text:match('[^ ]*$'))
        if n and m and n >= 1 and n <= LAST_WORD_LIMIT and n + m + 1 <= TIED_WORDS_LIMIT then
          content[i] = pandoc.Str(NBSP)
          return block
        end
      end
      return nil
    end
  end
end

-- In the PDF builds the epigraph is the environment amssepigraph and its
-- source line (the second paragraph after it) amsssource; both are defined
-- in theme/beamer.tex and theme/article.tex.
local function wrap_epigraphs(blocks)
  local result = pandoc.Blocks({})
  local after_epigraph_heading = false
  local paragraphs_after_quote = -1   -- -1: not below an epigraph
  for _, block in ipairs(blocks) do
    if after_epigraph_heading and block.t == 'BlockQuote' then
      result:insert(pandoc.RawBlock('latex', '\\begin{amssepigraph}'))
      result:insert(block)
      result:insert(pandoc.RawBlock('latex', '\\end{amssepigraph}'))
      paragraphs_after_quote = 0
    elseif paragraphs_after_quote >= 0 and block.t == 'Para' then
      paragraphs_after_quote = paragraphs_after_quote + 1
      if paragraphs_after_quote == 2 then
        result:insert(pandoc.RawBlock('latex', '\\begin{amsssource}'))
        result:insert(block)
        result:insert(pandoc.RawBlock('latex', '\\end{amsssource}'))
      else
        result:insert(block)
      end
    else
      if block.t == 'Header' or block.t == 'HorizontalRule' then
        paragraphs_after_quote = -1
      end
      if is_latex and block.t == 'Header' and block.classes:includes('epigraph') then
        -- In a document the heading is a quiet label above the quotation.
        local label = pandoc.write(pandoc.Pandoc({ pandoc.Plain(block.content) }), 'latex')
        result:insert(pandoc.RawBlock('latex', '\\amssepigraphlabel{' .. label .. '}'))
      else
        result:insert(block)
      end
    end
    after_epigraph_heading = block.t == 'Header' and block.classes:includes('epigraph')
  end
  return result
end

local function table_class(block)
  local text
  if block.t == 'RawBlock' and block.format == 'html' then
    text = block.text
  elseif (block.t == 'Para' or block.t == 'Plain') and #block.content == 1
      and block.content[1].t == 'RawInline' and block.content[1].format == 'html' then
    text = block.content[1].text   -- inside a list item the comment is a paragraph
  end
  return text and text:match('^<!%-%-%s*table%-class:%s*([0-9A-Za-z_%-]+)%s*%-%->%s*$')
end

-- Moves a table-class comment onto the wrapper of the table that follows it.
local function class_tables(blocks)
  local result = pandoc.Blocks({})
  local pending
  for _, block in ipairs(blocks) do
    local name = table_class(block)
    if name then
      pending = name
    else
      if pending and block.t == 'Div' and block.classes:includes('table-wrap') then
        block.classes:insert(pending)
      end
      pending = nil
      result:insert(block)
    end
  end
  return result
end

-- Wraps every table so that it can scroll sideways, and gives the wrapper the
-- class of a preceding table-class comment, also inside a list or a div.
local function wrap_tables(blocks)
  blocks = blocks:walk({
    Table = function(t)
      return pandoc.Div({ t }, pandoc.Attr('', { 'table-wrap' }))
    end,
  })
  -- walk applies the function to every list of blocks, this one included.
  return blocks:walk({ Blocks = class_tables })
end

-- Pandoc's slide writers split a slide at the pauses (". . .") between its
-- own blocks only: a pause inside a column, a quotation or a list item, or
-- below a sub-heading, is printed as text, while the PDF pauses there too.
-- In an HTML deck every pause becomes a marker instead; theme/deck.js makes
-- everything after it on the slide wait, as in the PDF.
local function is_pause(block)
  local c = block.content
  return block.t == 'Para' and #c == 5
    and c[1].t == 'Str' and c[1].text == '.' and c[2].t == 'Space'
    and c[3].t == 'Str' and c[3].text == '.' and c[4].t == 'Space'
    and c[5].t == 'Str' and c[5].text == '.'
end

local function mark_pauses(blocks)
  return blocks:walk({
    Para = function(para)
      if is_pause(para) then
        return pandoc.RawBlock('html', '<div class="deck-pause"></div>')
      end
    end,
  })
end

-- The first block that is not a comment or other raw markup.
local function first_visible(blocks)
  for i, block in ipairs(blocks) do
    if block.t ~= 'RawBlock' then
      return i, block
    end
  end
end

local function tidy_document(doc)
  local blocks = doc.blocks
  if is_doc and full_title then
    local i, first = first_visible(blocks)
    if first and first.t == 'Header' and first.level == 1 and repeats_title(first) then
      blocks:remove(i)
      if is_latex then
        -- The remaining level-2 headings are the document's sections.
        blocks = blocks:walk({
          Header = function(h)
            h.level = math.max(1, h.level - 1)
            return h
          end,
        })
      end
    end
  end
  if is_beamer or is_latex then
    blocks = wrap_epigraphs(blocks)
  end
  if is_html then
    blocks = protect_ranges(wrap_tables(blocks))
  end
  if is_slidy then
    blocks = mark_pauses(blocks)
  end
  doc.blocks = blocks
  return doc
end

return {
  { Meta = split_title },
  {
    Header = mark_epigraph,
    CodeBlock = focusable_code,
    Table = pdf_table,
    Div = drop_notes,
  },
  {
    traverse = 'topdown',
    Table = function(t) return t, false end,
    Div = function(d)
      if d.classes:includes('notes') then
        return d, false
      end
    end,
    Para = tie_last_word,
    Plain = tie_last_word,
  },
  { Pandoc = tidy_document },
}
