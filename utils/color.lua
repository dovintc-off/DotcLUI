local json = require("DotcLUI.utils.dkjson")
local color = {}

function color.save(r, g, b, a)
    color = {
        math.max(0, math.min(1, r)),
        math.max(0, math.min(1, g)),
        math.max(0, math.min(1, b)),
        math.max(0, math.min(1, a))
    }
    local data = {
        color = color
    }
    local jsonString = json.encode(data, {indent = true})
    local file = io.open("DotcLUI/utils/value.json", "w")
    if file then
        file:write(jsonString)
        file:close()
    else
        print("Не удалось открыть value.json для записи")
    end
end

function color.set(r, g, b, a)
    a = a or 1
    color.save(r, g, b, a)
    love.graphics.setColor(r, g, b, a)
end

-- getCurrentColor
-- @param index: nil, "all", or 1-4
-- @param asTable: if true —> {r, g, b, a} else —> r, g, b, a
function color.get(index, asTable)
    if index == nil or index == "all" then
        if asTable then return {color[1], color[2], color[3], color[4]}
        else return unpack(color)
        end
    else 
        local i = tonumber(index)
        if i and i >= 0 and i <= 4 then
            return color[i]
        end
    end
end

return color