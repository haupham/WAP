$(document).ready(function(){
				
    var win = false;
    $("#start").click(function(){
        win = false;
        $(".boundary").removeClass("youlose");
        $("#status").html("Click the \"S\" to begin.");

        $("#end").click(function(){
            if(!$(".boundary").hasClass("youlose"))
            $("#status").html("You win!!");
            win = true;
        });

        $(".boundary").mouseover(function(){
            if(!win){
                $(".boundary").addClass("youlose");
                $("#status").html("You lose!!");
            }
        });

    });
});