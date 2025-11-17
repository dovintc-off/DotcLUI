font = {}

function font.set(path_font, size)
    reset = reset or false
    if path_font == nil then error("[DotcLUI]: path to the font file is not specified") end
    size = size or 20
    local len_mainfont = string.len(path_font)
    local file_exist = love.filesystem.getInfo(path_font)
    local extension = string.sub(path_font, len_mainfont - 3, len_mainfont)

    if extension == ".ttf" and file_exist and file_exist.type == "file" then
        local mainFont = love.graphics.newFont(path_font, tonumber(size))
        love.graphics.setFont(mainFont)
    end
end

return font 