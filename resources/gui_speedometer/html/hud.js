$(function() {
    var speedContainer = $("#speedcontainer");
	
    var unitLine1 = $(".unitLine1");
    var speedLine1 = $(".speedLine1");
	var unitLine2 = $(".unitLine2");
    var speedLine2 = $(".speedLine2");
	
    window.addEventListener("message", function(event) {
        var item = event.data;
        
        if (item.showhud) {
            speedContainer.fadeIn();
            unitLine1.text(item.unitLine1);
            speedLine1.text(item.speedLine1)
			unitLine2.text(item.unitLine2);
            speedLine2.text(item.speedLine2)
        } else if (item.hidehud) {
            speedContainer.fadeOut();
        }
    });
});