text = {}
local font = require("DotcLUI.utils.font")
local color = require("DotcLUI.utils.color")
local style = require("DotcLUI.utils.style")

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
        if not data.text and not data[1] then
            text.der("[DotcLUI]: Caution! Bad Argument")
            return
        end
        t = data.text or data[1]
        
        -- cords
        if type(data.xy) == "table" then
            x = tonumber(data.xy.x or data.xy[1])
            y = tonumber(data.xy.y or data.xy[2])
            if type(x) ~= "number" or type(y) ~= "number" then
                local info = debug.getinfo(2, "Sl")
                local where = string.format("%s:%d", info.short_src, info.currentline)
                error("[DotcLUI]: Caution! Invalid coordinates argument. (called at " .. where .. ")", 2)
            end
        elseif type(data[2]) == "table" then
            x = tonumber(data[2][1])
            y = tonumber(data[2][2])
            if type(x) ~= "number" or type(y) ~= "number" then
                local info = debug.getinfo(2, "Sl")
                local where = string.format("%s:%d", info.short_src, info.currentline)
                error("[DotcLUI]: Caution! Invalid coordinates argument. (called at " .. where .. ")", 2)
            end
        end

        if style.get_ssff() == false then
            -- draw
            if data["font"] ~= nil and data["size"] ~= nil then
                font.set(data["font"], data["size"], true)
            end

            if data.color and type(data.color) == "table" then
                local c = data.color
                local r, g, b, a, mode

                
                if c[4] == "rgb" or c[4] == "rgba" or c[4] == "love" then
                    r, g, b = c[1], c[2], c[3]
                    a = (c[4] == "love") and 1 or 255
                    mode = c[4]
                elseif c[5] == "rgb" or c[5] == "rgba" or c[5] == "love" then
                    r, g, b, a = c[1], c[2], c[3], c[4]
                    mode = c[5]
                elseif type(c[4]) == "number" then
                    r, g, b, a = c[1], c[2], c[3], c[4]
                    mode = "love"
                elseif type(c[3]) == "number" then
                    r, g, b, a = c[1], c[2], c[3], 1
                    mode = "love"
                else
                    r, g, b, a = c[1], c[2], c[3], c[4]
                    mode = "love"
                end

                r = tonumber(r) or 1
                g = tonumber(g) or 1
                b = tonumber(b) or 1
                a = tonumber(a) or 1
                mode = mode or "love"

                color.set(r, g, b, a, mode)
            end
        else
            local json = require("DotcLUI.utils.dkjson")
            local file = love.filesystem.read("DotcLUI/style/style.json")
            if not file then 
                error("[DotcLUI]: Failed to load style.json")
            end
            local style_text = json.decode(file)

            -- color
            r = tonumber(style_text.text.color[2][1]) or 1
            g = tonumber(style_text.text.color[2][2]) or 1
            b = tonumber(style_text.text.color[2][3]) or 1
            a = tonumber(style_text.text.color[2][4]) or 1
            mode = style_text.text.color[1]
            color.set(r, g, b, a, mode)
            
            if style_text.text.font ~= nil and style_text.text.size ~= nil then
                font.set(style_text.text.font:sub(2, #style_text.text.font - 1), style_text.text.size)
            end
        end
        
        if show then
            love.graphics.print(tostring(t), x, y)
        end
    end
end

return text