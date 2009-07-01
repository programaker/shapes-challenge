class Shape {
    def x = 0
    def y = 0
    
    Shape(newX, newY) {
        moveTo(newX, newY)
    } 
    
    def moveTo(newX, newY) {
        x = newX
        y = newY
    }  
    
    def rMoveTo(deltaX, deltaY) {
        moveTo(x + deltaX, y + deltaY)
    }
    
    def draw() {}
}

class Rectangle extends Shape {
    def width = 0
    def height = 0
    
    Rectangle(newX, newY, newWidth, newHeight) {
        super(newX, newY)
        width = newWidth
        height = newHeight
    }
    
    def draw() {
        println("Drawing a Rectangle at:(${x},${y}), width ${width}, height ${height}")
    }
}

class Circle extends Shape {
    def radius = 0
    
    Circle(newX, newY, newRadius) {
        super(newX, newY)
        radius = newRadius
    }
    
    def draw() {
        println("Drawing a Circle at:(${x},${y}), radius ${radius}")
    }
}

// create a collection containing various shape instances
def shapes = [new Rectangle(10, 20, 5, 6), new Circle(15, 25, 8)]

shapes.each {
    it.draw()
    it.rMoveTo(100, 100)
    it.draw()
}

// access a rectangle specific function
def rectangle = new Rectangle(0, 0, 15, 15)
rectangle.width = 30
rectangle.draw()
