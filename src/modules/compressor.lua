-- modules/watermark.lua
local Compressor = {}

local function compressLuaCode(code)
    code = code:gsub("%-%-%[.-%]%]", "")
    code = code:gsub("%-%-.-\n", "")
    code = code:gsub("%s*([%[%]%(%){};,=+%*/%-])%s*", "%1")
    return code
end

function Compressor.process(code)
    local compressedCode = compressLuaCode(code)
    return compressedCode
end

return Compressor
