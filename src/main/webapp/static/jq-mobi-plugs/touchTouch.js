(function ($) {
	$.fn.touchTouch = function () {
		var imgList=[];
		var that=$(this);
		that.each(function(i,t){
			imgList[i]=$(t).children("div").get(0);
			imgList[i].style.display="none";
			if(i==0)
				that.parent().children("div").append("<div class='point active'></div>");
			else
				that.parent().children("div").append("<div class='point'></div>");
		});
		var len=imgList.length;
		var index=0;
		imgList[index].style.display="block";
		$(this).on("swipeLeft ","img",function(e){
			imgList[index].style.display="none";
			$("div.point").eq(index).removeClass("active");
			index++;
			if(index==len){
				index=0;
			}
			imgList[index].style.display="block";
			$("div.point").eq(index).addClass("active");
		});
		$(this).on("swipeRight ","img",function(e){
			imgList[index].style.display="none";
			$("div.point").eq(index).removeClass("active");
			index--;
			if(index<0){
				index=len-1;
			}
			imgList[index].style.display="block";
			$("div.point").eq(index).addClass("active");
		});
	};
})(af);