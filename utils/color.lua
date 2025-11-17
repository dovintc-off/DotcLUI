local json = require("DotcLUI.utils.dkjson")
local color_base = {1, 1, 1, 1}
local color = {}

function color.save(r, g, b, a)
    color_base = {r, g, b, a}
end

function color.set(r, g, b, a)
    a = a or 1
    love.graphics.setColor(r, g, b, a)
    color.save(r, g, b, a)
end

function color.get(index, asTable)
    if index == nil or index == "all" then
        if asTable then return {color_base[1], color_base[2], color_base[3], color_base[4]}
        else return unpack(color_base)
        end
    else 
        local i = tonumber(index)
        if i and i >= 0 and i <= 4 then
            return color_base[i]
        end
    end
end

return color