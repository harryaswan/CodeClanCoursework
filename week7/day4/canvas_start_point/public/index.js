var Position = function(x, y) {
    this.x = (x/2);
    this.y = (y/2);
    this.maxX = x;
    this.maxY = y;
    this.up = function(size) {
        this.y += -size;
        if (this.y < 0) {
            this.y = 0;
        }
    };
    this.down = function(size) {
        this.y += size;
        if (this.y > this.maxY) {
            this.y = this.maxY - 1;
        }
    };
    this.left = function(size) {
        this.x += -size;
        if (this.x < 0) {
            this.x = 0;
        }
    };
    this.right = function(size) {
        this.x += size;
        if (this.x > this.maxX) {
            this.x = this.maxX - 1;
        }
    };
};

var Etchasketch = function(element) {
    this.canvas = document.getElementById(element);
    this.context = this.canvas.getContext('2d');
    this.colour = "red";
    this.size = 2;
    this.pos = new Position(this.canvas.width, this.canvas.height);
    this.move = function(action) {
        for (var i = 0; i < 2; i++) {
            this.pos[action](this.size);
            this.drawSquare();
        }
    };
    this.drawSquare = function() {
        this.context.fillStyle = this.colour;
        this.context.fillRect(this.pos.x, this.pos.y, this.size,this.size);
    };
    this.setColour = function(colour) {
        this.colour = colour;
    };
    this.setSize = function(size) {
        this.size = size;
    };this.clear = function() {
        this.context.clearRect(0, 0, this.canvas.width, this.canvas.height);
    };
};

var Paint = function(element) {
    this.canvas = document.getElementById(element);
    this.context = this.canvas.getContext('2d');
    this.colour = "red";
    this.size = 2;
    this.shape = "square";
    this.mouse = false;
    this.draw = function(x,y) {
        console.log("size", this.size);
        console.log("shape", this.shape);
        console.log("colour", this.colour);
        if (this.mouse) {
            this.drawer[this.shape](x,y);
        }
    }.bind(this);

    this.drawer = {
        square: function(x,y) {
            this.context.fillStyle = this.colour;
            this.context.fillRect((x-(this.size/2)), (y-(this.size/2)), this.size, this.size);
        }.bind(this),
        circle: function(x,y) {
            console.log("circles");
            this.context.beginPath();
            this.context.fillStyle = this.colour;
            this.context.strokeStyle = this.colour;
            this.context.arc(x, y, this.size, Math.PI * 2, 0, false);
            this.context.fill();
            this.context.stroke();
            this.context.closePath();
        }.bind(this)
    };
    this.mouseUp = function() {
        this.mouse = false;
    }.bind(this);
    this.mouseDown = function() {
        this.mouse = true;
    }.bind(this);
    this.setColour = function(colour) {
        this.colour = colour;
    };
    this.setSize = function(size) {
        this.size = size;
    };
    this.setShape = function(shape) {
        this.shape = shape;
    };
    this.clear = function() {
        this.context.clearRect(0, 0, this.canvas.width, this.canvas.height);
    };
};

var etcha = null;
var paint = null;

var main = function() {

    etcha = new Etchasketch('main');
    paint = new Paint('main');

    document.getElementById('clear').onclick = function() {
        paint.clear();
        etcha.clear();
    };


    document.getElementById('main').onmousedown = paint.mouseDown;
    document.getElementById('main').onmouseup = paint.mouseUp;
    document.getElementById('main').onmousemove = function(e) {
        paint.draw(e.x, e.y);
    };


    document.getElementById('size').onkeyup = function(e) {
        paint.setSize(parseInt(this.value));
        etcha.setSize(parseInt(this.value));
    };

    document.getElementById('shape').onchange = function(e) {
        paint.setShape(this.value);
    };

    document.getElementById('colour').onchange = function(e) {
        paint.setColour(this.value);
        etcha.setColour(this.value);
    };

};



window.onload = main;

window.onkeydown = function(e) {
    var key = e.keyCode ? e.keyCode : e.which;

    switch(key) {
        case 37:
            etcha.move('left');
            break;
        case 38:
            etcha.move('up');
            break;
        case 39:
            etcha.move('right');
            break;
        case 40:
            etcha.move('down');
            break;
    }
};











// function getRandomColor() {
//     var letters = '0123456789ABCDEF'.split('');
//     var color = '#';
//     for (var i = 0; i < 6; i++ ) {
//         color += letters[Math.floor(Math.random() * 16)];
//     }
//     return color;
// }
