'use strict'
$(document).ready(function(){
    //var arrPieces = [];

    var sizePiece = 100;
    var blankPiece = {x: 300, y: 300};

    var init = function() {
        // initialize each piece
        var divs = $("#puzzlearea div");
        for (var i=0; i< divs.length; i++) {
            var div = divs[i];
            
            // calculate x and y for this piece
            var x = ((i % 4) * 100) ;
            var y = (Math.floor(i / 4) * 100) ;
    
            // set basic style and background
            div.className = "puzzlepiece";
            div.style.left = x + 'px';
            div.style.top = y + 'px';
            div.style.backgroundImage = 'url("background.jpg")'
            div.style.backgroundPosition = -x + 'px ' + (-y) + 'px';
            
            // store x and y for later
            div.x = x;
            div.y = y; 
            
        }     
       
    };
    
    var shuffle = function(array) {
        var n = array.length;
        var temp, rdm;

        while (0 !== n) {
            rdm = Math.floor(Math.random() * n);
            n -= 1;
            temp = array[n];
            array[n] = array[rdm];
            array[rdm] = temp;
        }

        return array;
    };
    
    function shufflePiece() {
        var arrPieces = [];
        
        var divs  = $("#puzzlearea div");
        var html = "";

        divs.each(function(idx, d) {
            arrPieces.push(d);
        });

        shuffle(arrPieces);  
        // initialize each piece
        for (var i=0; i < divs.length; i++) {
            var div = divs[i];
            
            // calculate x and y for this piece
            var x = arrPieces[i].x;
            var y = arrPieces[i].y;
            var pos = div.style.backgroundPosition;


            // set basic style and background
            html += "<div class='puzzlepiece' style=\"left: "+x+"px; top:"+y+"px; background-image:url('background.jpg'); background-position:"+
            pos + "\">" + (i+1) +"</div>";
        }
        
        $("#puzzlearea div").remove();
         setTimeout(function() {
            $("#puzzlearea").append(html);

            var divs  = $("#puzzlearea div");
                  
            // initialize x and y value each piece
            for (var i=0; i < divs.length; i++) {
                var div = divs[i];
                div.x = arrPieces[i].x;
                div.y = arrPieces[i].y;

                $(div).click(function(){
                    move(this);
                });

                $(div).mouseover(function(){
                    mouseOver(this);
                });

                $(div).mouseout(function(){
                    mouseLeave(this);
                });
            }
        }, 10);

    };

    var movable = function(oldPos, newPos) {
        var isMovable = false;

        //
        if (oldPos.x == newPos.x && newPos.y == (oldPos.y - sizePiece)) {
        	isMovable = true;
        }
        if (oldPos.x == newPos.x && newPos.y == (oldPos.y + sizePiece)) {
        	isMovable = true;
        }
        if ((oldPos.x - sizePiece) == newPos.x && newPos.y == oldPos.y) {
        	isMovable = true;
        }
        
        if ((oldPos.x + sizePiece) == newPos.x && newPos.y == oldPos.y) {
        	isMovable = true;
        }

        return isMovable;
    };

    var move = function(selectedPiece) {
        var newXPos = selectedPiece.x;
        var newYPos = selectedPiece.y;

        if (movable(blankPiece, selectedPiece)) {
            $(selectedPiece).animate({ left: blankPiece.x, top: blankPiece.y }, 200, function() {

                selectedPiece.x = blankPiece.x;
                selectedPiece.y = blankPiece.y;

                blankPiece.x = newXPos;
                blankPiece.y = newYPos;
            });
        }
    };

    var mouseOver = function(hoverPiece) {
        if (movable(blankPiece, hoverPiece)) {
            $(hoverPiece).addClass('movablepiece');
        }
    };

    var mouseLeave = function(hoverPiece) {
        $(hoverPiece).removeClass('movablepiece');
    };


    $("#shufflebutton").click(function(){
        shufflePiece();
    });

    $("#puzzlearea div").mouseover(function() {
        mouseOver(this);
    });

    $("#puzzlearea div").mouseout(function() {
        mouseLeave(this);
    });

    $("#puzzlearea div").click(function() {
        move(this);
    });

    init();


});