Shape = Origin mimic do(
    x = 0
    y = 0
    
    moveTo = method(newX, newY,
        self x = newX
        self y = newY
    )
    
    rMoveTo = method(deltaX, deltaY,
        self moveTo(x + deltaX, y + deltaY)
    )
    
    draw = method()
)

Rectangle = Shape mimic do(
    width = 0
    height = 0
    
    initialize = method(newX, newY, newWidth, newHeight,
        self moveTo(newX, newY)
        self width = newWidth
        self height = newHeight
    )
    
    draw = method(
        "Drawing a Rectangle at:(#{x},#{y}), width #{width}, height #{height}" println
    )
)

Circle = Shape mimic do(
    radius = 0
    
    initialize = method(newX, newY, newRadius,
        self moveTo(newX, newY)
        self radius = newRadius
    )
    
    draw = method(
        "Drawing a Circle at:(#{x},#{y}), radius #{radius}" println
    )
)

;; create a collection containing various shape instances
shapes = [Rectangle mimic(10, 20, 5, 6), Circle mimic(15, 25, 8)]

shapes each(shape,
    shape draw
    shape rMoveTo(100, 100)
    shape draw
)

;; access a rectangle specific function
rectangle = Rectangle mimic(0, 0, 15, 15)
rectangle width = 30
rectangle draw

