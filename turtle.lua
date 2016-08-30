drawing = false
position = {x = 0, y = 0}
direction = 0 -- in randians
color = {r=0, g=0, b=0}
speed = 1
-- https://en.wikipedia.org/wiki/Web_colors
colorNames = {
    white = {r=255, g=255, b=255},
    gray = {r=177, g=177, b=177},
    black = {r=0, g=0, b=0},
    red = {r=255, g=0, b=0},
    yellow = {r=0, g=177, b=0},
    blue = {r=0, g=0, b=255},
    purple = {r=177, g=0, b=177}
}

function init()
    clear()
    bgcolor(255, 255, 255)
    pencolor(0, 0, 0)
    direction = 0
    home()
end

-- not sure it should be accessible
function bgcolor(r, g, b)
    love.graphics.setBackgroundColor(r, g, b)
end

function clear()
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle("fill" , 0, 0, love.graphics.getWidth(), love.graphics.getHeight() )
end

-- pen

function penup()
    drawing = false
end

function pendown()
    drawing = true
end

-- todo: implement
function pensize()
end;

function pencolor(r, g, b)
    if g then
        color.r = r
        color.g = g
        color.b = b
    else 
        local colorByName = colorNames[r]
        if colorByName ~= nil then
            color = colorByName
        end
        -- if colorNames.contains(r) then
        -- end
    end

end;

-- moving

-- Move turtle to the origin – coordinates (0,0) – and set its heading to its start-orientation
-- (0, 0) is in the middle of the screen
function home()
    position = {x = love.graphics.getWidth() / 2, y = love.graphics.getHeight() / 2}

end

-- Parameters: speed – an integer in the range 0..10 or a speedstring: 
-- "fastest", "fast", "normal", "slow", "slowest"
-- todo: implement
function speed(speed)
-- "fastest": 0
-- "fast": 10
-- "normal": 6
-- "slow": 3
-- "slowest": 1
end

function forward(distance)
    destination = {
        x = position.x + distance * math.cos(direction),
        y = position.y + distance * math.sin(direction)
    }
    if drawing then
        love.graphics.setColor(color.r, color.g, color.b)
        love.graphics.line(position.x, position.y, destination.x, destination.y)
    end
    position = destination
end

function backward(distance)
    forward(-distance)
end

-- todo: implement
function goto(x, y)
end

-- rotating

function right(angle)
    direction = direction - math.rad(angle)
end

-- angle is in degree
function left(angle)
    direction = direction + math.rad(angle)
end

-- not in use (yet)
function table.contains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end
