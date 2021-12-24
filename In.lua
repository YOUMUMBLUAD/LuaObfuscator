local open = io.open

local function read_file(path)
    local file = open(path, "rb") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end

file = io.open("RblxOut.lua", "a")



local thing = read_file("In.lua");

local encoded = thing:gsub(".", function(bb) return "\\" .. bb:byte() end) or thing .. "\""
file:write("loadstring(\""..encoded.."\")()")

