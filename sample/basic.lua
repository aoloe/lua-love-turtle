require 'turtle'

function love.load()
end

function love.update()
end

function love.draw()
    init()
    pencolor("red")
    pendown()
    forward(100)
    penup()
    forward(100)
    left(90)
    pendown()
    forward(100)
    right(90)
    forward(100)
    backward(50)
    right(90)
    forward(100)
end
