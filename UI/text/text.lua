text = {}
local font = require("DotcLUI.utils.font")
local color = require("DotcLUI.utils.color")

function text.der(text, x, y)
    x = x or 100
    y = y or 100 
    love.graphics.print(tostring(text), x, y)
end


function text.new(data)
    local show = true
    local x, y = 100, 100
    local t = nil

    if type(data) == "table" then
        
        -- text
        local ok, msg = pcall(function()
            t = data["text"] or data[1]
            if t == nil then error("Bad Argument") end 
            
        end)
        
        if not ok then 
            text.der("Caution: Bad Argument") 
            show = false
            return
        end   
        
        -- cords
        local ok, msg = pcall(function()
        if type(data.xy) == "table" then
            x = tonumber(data.xy.x or data.xy[1]) or 100
            y = tonumber(data.xy.y or data.xy[2]) or 100
        elseif type(data[2]) == "table" then
            x = tonumber(data[2][1]) or 100
            y = tonumber(data[2][2]) or 100
        end
        end)
        if not ok then
            text.der('Caution: Bad Argument')
            show = false
        end
        -- draw

        if data["font"] ~= nil and data["size"] ~= nil then
            font.set(data["font"], data["size"], true)
        end

        if data["color"] ~= nil and type(data["color"]) == "table" then
            c = data["color"]
            local r = c[1] or 1
            local g = c[2] or 1
            local b = c[3] or 1
            local a = c[4] or 1
            color.set(r, g, b, a)
        end
        
        if show then
            love.graphics.print(tostring(t), x, y)
        end
    end
end

return text