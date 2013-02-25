// config
$tsMargin=30; //first and last thumbnail margin (for better cursor interaction)
$scrollEasing=10; //scroll easing amount (0 for no easing)
$scrollEasingType="linear"; //scroll easing type
$thumbnailsContainerOpacity=0.8; //thumbnails area default opacity
$thumbnailsContainerMouseOutOpacity=0; //thumbnails area opacity on mouse out
$thumbnailsOpacity=1; //thumbnails default opacity
$nextPrevBtnsInitState="show"; //next/previous image buttons initial state ("hide" or "show")
$keyboardNavigation="on"; //enable/disable keyboard navigation ("on" or "off")

//cache vars
$thumbnails_wrapper=$("#thumbnails_wrapper");
$outer_container=$("#outer_container");
$thumbScroller=$(".thumbScroller");
$thumbScroller_container=$(".thumbScroller .container");
$thumbScroller_content=$(".thumbScroller .content");
$thumbScroller_thumb=$(".thumbScroller .thumb");
$preloader=$("#preloader");
$toolbar=$("#toolbar");
$toolbar_a=$("#toolbar a");
$bgimg=$("#bgimg");
$previmg=$("#previmg");
$nextimg=$("#nextimg");
$img_title=$("#img_title");
$nextImageBtn=$(".nextImageBtn");
$prevImageBtn=$(".prevImageBtn");

// slide config
$fadeSlideSpeed = 'slow'
$nextStyleName = ''
$nextStyleDescription = ''

$(window).load(function() {
	ShowHideNextPrev($nextPrevBtnsInitState);

	//thumbnail scroller
	sliderLeft=$thumbScroller_container.position().left;
	sliderWidth=$outer_container.width();
	$thumbScroller.css("width",sliderWidth);
	var totalContent=0;
	fadeSpeed=300;
	
	var $the_outer_container=document.getElementById("outer_container");
	var $placement=findPos($the_outer_container);		

	$thumbScroller_content.each(function () {
		var $this=$(this);
		totalContent+=$this.innerWidth();
		$thumbScroller_container.css("width",totalContent);
		$this.children().children().children(".thumb").fadeTo(fadeSpeed, $thumbnailsOpacity);
	});
	
	$thumbScroller.mousemove(function(e){
		if($thumbScroller_container.width()>sliderWidth){
	  		var mouseCoords=(e.pageX - $placement[1]);
	  		var mousePercentX=mouseCoords/sliderWidth;
	  		var destX=-((((totalContent+($tsMargin*2))-(sliderWidth))-sliderWidth)*(mousePercentX));
	  		var thePosA=mouseCoords-destX;
	  		var thePosB=destX-mouseCoords;
	  		if(mouseCoords>destX){
		  		$thumbScroller_container.stop().animate({left: -thePosA}, $scrollEasing,$scrollEasingType); //with easing
	  		} else if(mouseCoords<destX){
		  		$thumbScroller_container.stop().animate({left: thePosB}, $scrollEasing,$scrollEasingType); //with easing
	  		} else {
				$thumbScroller_container.stop();
	  		}
		}
	});


});

//Clicking on thumbnail changes the background image
$("#previmg").click(function(event){
	event.preventDefault();
	var $this=$(this);
	// this sets the next and previous images
	GetNextPrevImages($this);
	GetImageTitle($this);
	SwitchImage(this);
	ShowHideNextPrev("show");
});

//Clicking on thumbnail changes the background image
$("#nextimg").click(function(event){
	event.preventDefault();
	var $this=$(this);
	// this sets the next and previous images
	GetNextPrevImages($this);
	GetImageTitle($this);
	SwitchImage(this);
	ShowHideNextPrev("show");
});

//Clicking on thumbnail changes the background image
$("#outer_container a").click(function(event){
	event.preventDefault();
	var $this=$(this);
	// this sets the next and previous images
	GetNextPrevImages($this);
	GetImageTitle($this);
	SwitchImage(this);
	ShowHideNextPrev("show");
});

//get next/prev images 
// by passing the current image in the event find the next and previous right next to it
function GetNextPrevImages(curr){
	var nextImage = curr.parents(".content").next().find("a").attr("href");
	$nextStyleName = curr.parents(".content").next().find("img").attr("style_name");
	$nextStyleDescription = curr.parents(".content").next().find("img").attr("style_description");	
	if(nextImage==null){ //if last image, next is first
		var nextImage=$(".content").first().find("a").attr("href");
	}
	// set the nextImage variable to be used 
	$outer_container.data("nextImage",nextImage);
	var prevImage=curr.parents(".content").prev().find("a").attr("href");
	if(prevImage==null){ //if first image, previous is last
		var prevImage=$(".content").last().find("a").attr("href");
	}
	// set the prevImage variable to be used 
	$outer_container.data("prevImage",prevImage);
}


//get image title might use it later to display product 
function GetImageTitle(elem){
	var title_attr=elem.children("img").attr("title"); //get image title attribute
	$img_title.data("imageTitle", title_attr); //store image title
}

//switch image
function SwitchImage(img){
	var theNewImg = new Image();
	theNewImg.onload = CreateDelegate(theNewImg, theNewImg_onload);
	theNewImg.src = img;
}

// Delegate method to load the new image after swithcing
function CreateDelegate(contextObject, delegateMethod){
	return function(){
		return delegateMethod.apply(contextObject, arguments);
	}
}

//new image on load
function theNewImg_onload(){
	// this is the method that loads the actual image after it's been stylized with height,width, margin, etc..
	BackgroundLoad($bgimg,this.src);
}


// this what loads the image
function BackgroundLoad($this, imgSrc){
	$this.attr("src", "").attr("src", imgSrc); //change image source		
	$previmg.attr("src", "").attr("src", $outer_container.data("prevImage")); //change image source		
	$nextimg.attr("src", "").attr("src",  $outer_container.data("nextImage")); //change image source	
	$nextimg.attr("style_name", $nextStyleName )	
	$nextimg.attr("style_description", $nextStyleDescription )	
}



function ShowHideNextPrev(state){
	if(state=="hide"){
		$nextImageBtn.fadeOut();
		$prevImageBtn.fadeOut();
	} else {
		$nextImageBtn.fadeIn();
		$prevImageBtn.fadeIn();
	}
}


//next/prev images buttons
$nextImageBtn.click(function(event){
	event.preventDefault();
	SwitchImage($outer_container.data("nextImage"));
	var $this=$("#outer_container a[href='"+$outer_container.data("nextImage")+"']");
	GetNextPrevImages($this);
	GetImageTitle($this);
});

$prevImageBtn.click(function(event){
	event.preventDefault();
	SwitchImage($outer_container.data("prevImage"));
	var $this=$("#outer_container a[href='"+$outer_container.data("prevImage")+"']");
	GetNextPrevImages($this);
	GetImageTitle($this);
});

//next/prev images keyboard arrows
if($keyboardNavigation=="on"){
$(document).keydown(function(ev) {
    if(ev.keyCode == 39) { //right arrow
        SwitchImage($outer_container.data("nextImage"));
		var $this=$("#outer_container a[href='"+$outer_container.data("nextImage")+"']");
		GetNextPrevImages($this);
		GetImageTitle($this);
        return false; // don't execute the default action (scrolling or whatever)
    } else if(ev.keyCode == 37) { //left arrow
        SwitchImage($outer_container.data("prevImage"));
		var $this=$("#outer_container a[href='"+$outer_container.data("prevImage")+"']");
		GetNextPrevImages($this);
		GetImageTitle($this);
        return false; // don't execute the default action (scrolling or whatever)
    }
});
}



//function to find element Position
	function findPos(obj) {
		var curleft = curtop = 0;
		if (obj.offsetParent) {
			curleft = obj.offsetLeft
			curtop = obj.offsetTop
			while (obj = obj.offsetParent) {
				curleft += obj.offsetLeft
				curtop += obj.offsetTop
			}
		}
		return [curtop, curleft];
	}
