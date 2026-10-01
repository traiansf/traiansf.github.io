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
--   bold and rules off the rows, as the HTML decks do.

local stringify = pandoc.utils.stringify

local is_beamer = FORMAT == 'beamer'
local is_latex = FORMAT == 'latex'
local is_slidy = FORMAT == 'slidy'
local is_html_doc = FORMAT:match('^html') ~= nil
local is_html = is_html_doc or is_slidy
local is_doc = is_latex or is_html_doc
local is_deck = is_beamer or is_slidy

local EM_DASH = '\u{2014}'
local EN_DASH = '\u{2013}'
local NBSP = '\u{a0}'
local EPIGRAPH_TITLE = 'Ideea întâlnirii'

local full_title, short_title, headline

local function inlines(text)
  return pandoc.MetaInlines(pandoc.Inlines(pandoc.Str(text)))
end

local function split_title(meta)
  if not meta.title then
    return meta
  end
  full_title = stringify(meta.title)
  -- "AMSS 2026/2027 — rest": the templates show the course separately.
  short_title = full_title:match('^AMSS%s+[%d/]+%s+' .. EM_DASH .. '%s+(.+)$') or full_title
  -- "Cursul 1: Titlu": a session is one word and a number, nothing looser.
  local session, rest = short_title:match('^(.-):%s+(.+)$')
  if not (session and session:match('^[^%s%d]+%s+%d+$')) then
    session, rest = nil, nil
  end
  headline = rest or short_title

  if session then
    meta.session = inlines(session)
  end
  meta.headline = inlines(headline)

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

-- A browser may break a line after the dash of 10–12, 09:00–17:00 or F3–F4.
local function unbreakable_range(str)
  if is_html and str.text:find('[%w]' .. EN_DASH .. '[%w]') then
    return pandoc.Span({ str }, pandoc.Attr('', { 'nowrap' }))
  end
end

-- The slide writers leave instructor notes out; documents must do the same.
local function drop_notes(div)
  if is_doc and div.classes:includes('notes') then
    return {}
  end
end

-- PDF decks: header cells in bold and a hairline between body rows
-- (\amssrowrule is defined in theme/beamer.tex).
local function beamer_table(tbl)
  if not is_beamer then
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
  for _, body in ipairs(tbl.bodies) do
    for i, row in ipairs(body.body) do
      local first = row.cells[1]
      -- The rule has to be the first thing in the row; a cell with several
      -- blocks is set in a minipage, where it would not be.
      if i > 1 and first and #first.contents == 1 and first.contents[1].t == 'Plain' then
        first.contents[1].content:insert(1, pandoc.RawInline('latex', '\\amssrowrule '))
      end
    end
  end
  return tbl
end

-- Decks: no line with a single word at the end of a longer paragraph or list
-- item. Tables and notes are left alone (see the traversal below).
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
      local tail = pandoc.Inlines({})
      for j = i + 1, #content do
        tail:insert(content[j])
      end
      local length = utf8.len(stringify(tail))
      if length and length <= 14 then
        content[i] = pandoc.Str(NBSP)
        return block
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
      result:insert(block)
    end
    after_epigraph_heading = block.t == 'Header' and block.classes:includes('epigraph')
  end
  return result
end

local function table_class(block)
  if block.t == 'RawBlock' and block.format == 'html' then
    return block.text:match('^<!%-%-%s*table%-class:%s*([%w_%-]+)%s*%-%->%s*$')
  end
end

-- Wraps every table so that it can scroll sideways, and moves a preceding
-- table-class comment onto the wrapper.
local function wrap_tables(blocks)
  blocks = blocks:walk({
    Table = function(t)
      return pandoc.Div({ t }, pandoc.Attr('', { 'table-wrap' }))
    end,
  })
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
    blocks = wrap_tables(blocks)
  end
  doc.blocks = blocks
  return doc
end

return {
  { Meta = split_title },
  {
    Header = mark_epigraph,
    CodeBlock = focusable_code,
    Table = beamer_table,
    Str = unbreakable_range,
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
