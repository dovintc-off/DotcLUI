local color = {}

function q(n, m) return math.max(0, math.min(tonumber(n or 1), (m or 255))/(m or 255)) end

function color.set_rgb(r, g, b, a)
    a = a or 255
    love.graphics.setColor(q(r), q(g), q(b), q(a))
end

function color.set_love(r, g, b, a)
    a = a or 1.0
    love.graphics.setColor(q(r, 1), q(g, 1), q(b, 1), q(a, 1))
end
  
return color