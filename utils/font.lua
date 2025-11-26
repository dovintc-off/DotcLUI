font = {}

font.names_fonts = {
    boldpixels = "DotcLUI/style/font/BoldPixels/BoldPixels.ttf",
    gros_ventre_bold = "DotcLUI/style/font/Gros_Ventre/Gros_Ventre_Bold.ttf",
    gros_ventre_light = "DotcLUI/style/font/Gros_Ventre/Gros_Ventre_Light.ttf",
    gros_ventre_regular = "DotcLUI/style/font/Gros_Ventre/Gros_Ventre_Regular.ttf",
    gros_ventre_semibold = "DotcLUI/style/font/Gros_Ventre/Gros_Ventre_Semibold.ttf",
    gros_ventre_thin = "DotcLUI/style/font/Gros_Ventre/Gros_Ventre_Thin.ttf",
    folies_Bergere_bold = "DotcLUI/style/font/Folies_Bergere/Folies_Bergere_Bold.ttf",
    folies_bergere_medium = "DotcLUI/style/font/Folies_Bergere/Folies_Bergere_Medium.ttf",
    folies_bergere_regular = "DotcLUI/style/font/Folies_Bergere/Folies_Bergere_Regular.ttf",
}

font.latest_font = "DotcLUI/style/font/Gc05002t.ttf"
font.latest_size = 20

function font_name_to_path_font(name_font)
    name_font = name_font:gsub(" ", "_"):lower()
    if font.names_fonts[name_font] == nil then return name_font
    else return font.names_fonts[name_font]
    end
end

function font.set_all(path_font, size)
    
    path_font = path_font or font.latest_font
    font.latest_font = font_name_to_path_font(path_font)
    path_font = font_name_to_path_font(path_font)

    size = size or 20
    font.latest_size = size

    local len_mainfont = string.len(path_font)
    local file_exist = love.filesystem.getInfo(path_font)
    local extension = string.sub(path_font, len_mainfont - 3, len_mainfont)

    if extension == ".ttf" and file_exist and file_exist.type == "file" then
        local mainFont = love.graphics.newFont(path_font, tonumber(size))
        love.graphics.setFont(mainFont)
    end
end

function font.set_font(path_font)
    love.graphics.setFont(love.graphics.newFont(font_name_to_path_font(path_font), tonumber(font.latest_size)))
    font.latest_font = font_name_to_path_font(path_font)
end

function font.set_size(size)
    love.graphics.setFont(love.graphics.newFont(font.latest_font, tonumber(size)))
    font.latest_size = tonumber(size)
end

return font 