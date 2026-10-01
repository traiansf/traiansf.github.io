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
--   level-1 heading that repeats the title and makes wide tables scrollable.
-- * In HTML, lets code blocks take the keyboard focus.

local stringify = pandoc.utils.stringify

local is_beamer = FORMAT == 'beamer'
local is_latex = FORMAT == 'latex'
local is_html_doc = FORMAT:match('^html') ~= nil
local is_html = is_html_doc or FORMAT == 'slidy'
local is_doc = is_latex or is_html_doc

local EM_DASH = '\u{2014}'
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
  local session, rest = short_title:match('^(.-):%s+(.+)$')
  headline = rest or short_title

  if session then
    meta.session = inlines(session)
  end
  meta.headline = inlines(headline)

  local label = meta['course-label'] and stringify(meta['course-label'])
  local name = meta['course-name'] and stringify(meta['course-name'])

  if is_beamer then
    -- The cover prints \insertinstitute, \insertsubtitle and \inserttitle.
    meta.title = inlines(headline)
    meta['title-meta'] = full_title
    if session and not meta.subtitle then
      meta.subtitle = inlines(session)
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

-- In the PDF builds the epigraph is the environment amssepigraph, defined in
-- theme/beamer.tex and theme/article.tex.
local function wrap_epigraphs(blocks)
  local result = pandoc.Blocks({})
  local after_epigraph_heading = false
  for _, block in ipairs(blocks) do
    if after_epigraph_heading and block.t == 'BlockQuote' then
      result:insert(pandoc.RawBlock('latex', '\\begin{amssepigraph}'))
      result:insert(block)
      result:insert(pandoc.RawBlock('latex', '\\end{amssepigraph}'))
    else
      result:insert(block)
    end
    after_epigraph_heading = block.t == 'Header' and block.classes:includes('epigraph')
  end
  return result
end

local function tidy_document(doc)
  local blocks = doc.blocks
  if is_doc and full_title and #blocks > 0 then
    local first = blocks[1]
    if first.t == 'Header' and first.level == 1 and repeats_title(first) then
      blocks:remove(1)
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
  if is_html_doc then
    blocks = blocks:walk({
      Table = function(t)
        return pandoc.Div({ t }, pandoc.Attr('', { 'table-wrap' }))
      end,
    })
  end
  doc.blocks = blocks
  return doc
end

return {
  { Meta = split_title },
  { Header = mark_epigraph, CodeBlock = focusable_code },
  { Pandoc = tidy_document },
}
