text = {}
local font = require("DotcLUI.utils.font")
local color = require("DotcLUI.utils.color")
local style = require("DotcLUI.utils.style")

local json = require("DotcLUI.utils.dkjson")
file = love.filesystem.read("DotcLUI/style/style.json")
if not file then 
    error("[DotcLUI]: Failed to load style.json")
end
local style_text = json.decode(file)



function text.der(text, x, y)
    x = x or 100
    y = y or 100 
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print(tostring(text), x, y)
end


function text.new(data)
    local show = true
    local x, y = 100, 100
    local t = nil

    if type(data) == "table" then
        
        -- text
        if not data.text then
            text.der("[DotcLUI]: Caution! Bad Argument")
            return
        end
        t = data.text or data[1]
        
        -- cords
        if type(data.cords) == "table" then
            x = tonumber(data.cords[1])
            y = tonumber(data.cords[2])
            if type(x) ~= "number" or type(y) ~= "number" then
                error("[DotcLUI]: Caution! Bad Argument ]")
            end
        end

        if style.get_ssff == false then
            if data.font ~= nil then
                local s = data["size"] or 20
                font.set_all(data["font"], s)
            end

            if data.color then
                local c = data.color
                local r, g, b
                r, g, b = c[2], c[3], c[4]
                if c[1] == "rgb" or c[1] == "rgba" then
                    color.set_rgb(r, g, b, c[5] or 255)
                elseif c[1] == "love" then
                    color.set_love(r, g, b, c[5] or 1)                    
                end
            end
        else

            if style_text.text.color then
                local c = style_text.text.color
                local r, g, b
                r, g, b = c[2], c[3], c[4]
                if tostring(c[1]) == "rgb" or tostring(c[1]) == "rgba" then
                    color.set_rgb(r, g, b, c[5] or 255)
                elseif tostring(c[1]) == "love" then
                    color.set_love(r, g, b, c[5] or 1)                    
                end
            end
            
            font.set_all(style_text.text["font"], style_text.text["size"] or 20)
        end
        
        if show then
            love.graphics.print(tostring(t), x, y)
        end
    end
end

return text