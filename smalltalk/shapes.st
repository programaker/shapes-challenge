"this namespace is just to avoid conflicts with some standard classes that have the same names"
Namespace current: Shapes [
    Object subclass: Shape [
        |x y|
        
        Shape class >> x: newX y: newY [
            ^ self basicNew moveToX: newX Y: newY; yourself
        ]
        
        x [^ x]
        x: newX [x := newX]
        
        y [^ y]
        y: newY [y := newY]
        
        moveToX: newX Y: newY [
            self x: newX; y: newY
        ]
        
        rMoveToX: deltaX Y: deltaY [
            self moveToX: (self x + deltaX) Y: (self y + deltaY)
        ]
        
        draw [^ nil]
    ]

    Shape subclass: Rectangle [
        |width height|
        
        Rectangle class >> x: newX y: newY width: newWidth height: newHeight [
            ^ (super x: newX y: newY) width: newWidth; height: newHeight; yourself            
        ]
        
        width [^ width]
        width: newWidth [width := newWidth]
        
        height [^ height]
        height: newHeight [height := newHeight]
        
        draw [
            |out|
            
            out := 'Drawing a Rectangle at:(', x printString, ',', y printString, '), ',
                'width ', width printString, ', height ', height printString.
            
            Transcript show: out; cr
        ]
    ]

    Shape subclass: Circle [
        |radius|
        
        Circle class >> x: newX y: newY radius: newRadius [
            ^ (super x: newX y: newY) radius: newRadius; yourself
        ]
        
        radius [^ radius]
        radius: newRadius [radius := newRadius]
        
        draw [
            |out|
            out := 'Drawing a Circle at:(', x printString, ',', y printString, '), radius ', radius printString.
            Transcript show: out; cr
        ]
    ]
]


"create a collection containing various shape instances"
OrderedCollection new
    add: (Shapes.Rectangle x: 10 y: 20 width: 5 height: 6);
    add: (Shapes.Circle x: 15 y: 25 radius: 8);
    do: [:shape| shape draw; rMoveToX: 100 Y: 100; draw].
    
"access a rectangle specific function"
(Shapes.Rectangle x: 0 y: 0 width: 15 height: 15)
    width: 30;
    draw

