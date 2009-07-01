#! /usr/local/bin/io

Shape := Object clone do(
    x := 0
    y := 0
    
    new := method(initX, initY,
        x = initX
        y = initY
    )
    
    moveTo := method(newX, newY,
        x = newX
        y = newY
    )
    
    rMoveTo := method(deltaX, deltaY,
        moveTo(x + deltaX, y + deltaY)
    )
    
    draw := method()
)

Rectangle := Shape clone do(
    width := 0
    height := 0
    
    new = method(newX, newY, newWidth, newHeight,
        clone do(
            super(new(newX, newY))
            width = newWidth
            height = newHeight
        )
    )
    
    draw = method(
        "Drawing a Rectangle at:(#{x},#{y}), width #{width}, height #{height}" interpolate println
    )
)

Circle := Shape clone do(
    radius := 0
    
    new = method(newX, newY, newRadius, 
        clone do(
            super(new(newX, newY))
            radius = newRadius
        )
    )
    
    draw = method(
        "Drawing a Circle at:(#{x},#{y}), radius #{radius}" interpolate println
    )
)

# create a collection containing various shape instances
shapes := list(Rectangle new(10, 20, 5, 6), Circle new(15, 25, 8))

shapes foreach(
    draw
    rMoveTo(100, 100)
    draw
)

# access a rectangle specific function
rectangle := Rectangle new(0, 0, 15, 15)
rectangle width = 30
rectangle draw
