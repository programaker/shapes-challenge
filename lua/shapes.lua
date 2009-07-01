-- Shape
Shape = {}

function Shape:new(newX, newY)
    local newShape = {x = newX, y = newY}
    setmetatable(newShape, {__index = Shape})
    return newShape
end

function Shape:moveTo(newX, newY)
    self.x = newX
    self.y = newY
end

function Shape:rMoveTo(deltaX, deltaY)
    self:moveTo(self.x + deltaX, self.y + deltaY)
end

function Shape:draw()
end


-- Rectangle
Rectangle = {}
setmetatable(Rectangle, {__index = Shape}) 

function Rectangle:new(newX, newY, newWidth, newHeight)
    local newRectangle = {x = newX, y = newY, width = newWidth, height = newHeight}
    setmetatable(newRectangle, {__index = Rectangle})
    return newRectangle
end

function Rectangle:draw()
    print(string.format(
        "Drawing a Rectangle at:(%d,%d), width %d, height %d", 
        self.x, self.y, self.width, self.height
    ))
end


-- Circle
Circle = {}
setmetatable(Circle, {__index = Shape})

function Circle:new(newX, newY, newRadius)
    local newCircle = {x = newX, y = newY, radius = newRadius}
    setmetatable(newCircle, {__index = Circle})
    return newCircle
end

function Circle:draw()
    print(string.format(
        "Drawing a Circle at:(%d,%d), radius %d", 
        self.x, self.y, self.radius
    ))
end


-- create a collection containing various shape instances
shapes = {Rectangle:new(10, 20, 5, 6), Circle:new(15, 25, 8)}

for i, shape in ipairs(shapes) do
    shape:draw()
    shape:rMoveTo(100, 100)
    shape:draw()
end

-- access a rectangle specific function
rectangle = Rectangle:new(0, 0, 15, 15)
rectangle.width = 30
rectangle:draw()

