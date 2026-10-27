-- Printed layout of the sample paper (PDF only; see exam/Makefile): the
-- instructions and an answer sheet on the cover, then one page per case,
-- each question with its options kept together in a compact list.
if FORMAT ~= 'latex' then return {} end

local function raw(s) return pandoc.RawBlock('latex', s) end

-- The letter of an option paragraph ("A. …" to "D. …"), or nil.
local function option_letter(block)
  if block.t ~= 'Para' then return nil end
  local first = block.content[1]
  return first and first.t == 'Str' and first.text:match('^([A-D])%.$')
end

-- A question paragraph opens with its bold number ("**12.**").
local function is_question(block)
  if block.t ~= 'Para' then return false end
  local first = block.content[1]
  return first and first.t == 'Strong' and #first.content == 1
    and first.content[1].t == 'Str' and first.content[1].text:match('^%d+%.$') ~= nil
end

local function answer_sheet(count)
  local cols, rows = 4, math.ceil(count / 4)
  local lines = {}
  for r = 1, rows do
    local cells = {}
    for c = 0, cols - 1 do
      local n = r + c * rows
      cells[#cells + 1] = n <= count and ('\\amssanswer{' .. n .. '}') or ''
    end
    lines[#lines + 1] = table.concat(cells, ' & ') .. ' \\\\'
  end
  return raw('\\amssanswersheet{' .. table.concat(lines, '\n') .. '}')
end

function Pandoc(doc)
  local count = 0
  for _, b in ipairs(doc.blocks) do
    if is_question(b) then count = count + 1 end
  end
  local out, cover = pandoc.List(), true
  local i, blocks = 1, doc.blocks
  while i <= #blocks do
    local b = blocks[i]
    if b.t == 'HorizontalRule' then
      if cover then out:insert(answer_sheet(count)); cover = false end
      out:insert(raw('\\newpage'))
      i = i + 1
    elseif is_question(b) then
      out:insert(raw('\\begin{amssquestion}'))
      out:insert(b)
      i = i + 1
      out:insert(raw('\\begin{amssoptions}'))
      while i <= #blocks and option_letter(blocks[i]) do
        local content = blocks[i].content:clone()
        local letter = option_letter(blocks[i])
        content:remove(1)
        if content[1] and content[1].t == 'Space' then content:remove(1) end
        out:insert(raw('\\item[' .. letter .. '.]'))
        out:insert(pandoc.Plain(content))
        i = i + 1
      end
      out:insert(raw('\\end{amssoptions}'))
      out:insert(raw('\\end{amssquestion}'))
    else
      out:insert(b)
      i = i + 1
    end
  end
  doc.blocks = out
  return doc
end
