local button = {}

local color = require("DotcLUI.utils.color")
local style = require("DotcLUI.utils.style")
local json = require("DotcLUI.utils.dkjson")    

local function parseArray(str)
    local tbl = {}
    str = str:gsub("^%s*{%s*", ""):gsub("%s*}%s*$", "")
    for num in str:gmatch("[^,%s]+") do
        table.insert(tbl, tonumber(num))
    end
    return tbl
end

local file = love.filesystem.read("DotcLUI/style/style.json")
if not file then 
    error("[DotcLUI]: Failed to load style.json")
end
local style_text = json.decode(file)


function button.new(data)
    local obj = {
        cords = data["cords"],
        text = data["text"],
        wh = data["wh"],
        color = data["color"],
        debug = data["debug"] or false,
        id = data["id"]
    }

    function obj:draw()
        if style.get_ssff == false then
            x = obj.cords[1]
            y = obj.cords[2]
            w = obj.wh[1]
            h = obj.wh[2]
            local r, g, b, a = obj.color[2], obj.color[3], obj.color[4], obj.color[5]

            love.graphics.setColor(1, 1, 1, 1)

            
            if obj.color[1] == "rgb" or obj.color[1] == "rgba" then
                color.set_rgb(r, g, b, a)
            elseif obj.color[1] == "love" then
                color.set_love(r, g, b, a)
            end
        elseif obj.id == nil then
            sb = style_text["button"]
            x = parseArray(sb["cords"])[1]
            y = parseArray(sb["cords"])[2]
            w = parseArray(sb["sizeButton"])[1]
            h = parseArray(sb["sizeButton"])[2]
            local r, g, b, a = sb.color[2], sb.color[3], sb.color[4], sb.color[5]

            
            if sb.color[1] == "rgb" or sb.color[1] == "rgba" then
                color.set_rgb(r, g, b, a)
            elseif sb.color[1] == "love" then
                color.set_love(r, g, b, a)
            end
        else 
            local id = "#" .. tostring(obj.id)
            sb = style_text[id]
            x = parseArray(sb["cords"])[1]
            y = parseArray(sb["cords"])[2]
            w = parseArray(sb["sizeButton"])[1]
            h = parseArray(sb["sizeButton"])[2]
            local r, g, b, a = sb.color[2], sb.color[3], sb.color[4], sb.color[5]

            
            if sb.color[1] == "rgb" or sb.color[1] == "rgba" then
                color.set_rgb(r, g, b, a)
            elseif sb.color[1] == "love" then
                color.set_love(r, g, b, a)
            end
        end

        love.graphics.rectangle("fill", x - w / 2, y - h / 2, w, h)
    end

    function obj:isPresed()
        return true        
    end

    return obj
end


return button