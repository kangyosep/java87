var ig;
$(function infinite() {
	var $grid = $("#grid");
	ig = new eg.InfiniteGrid("#grid", {
		count : 3000
	// pagePerCnt 
	}).on({
		"append" : function(e) {
			var gk = this.getGroupKeys();
			var lastGk = gk[gk.length - 1];
			lastGk++;
			getData(lastGk, lastGk, 'append');
		},
		"prepend" : function(e) {
			var firstGk = this.getGroupKeys()[0];
			firstGk--;
			if (firstGk >= 0) {
				getData(firstGk, firstGk, 'prepend');
			}
		},
		"layoutComplete" : function(e) {
			$grid.css("opacity", 1);
		}
	});
	if ("scrollRestoration" in history) {
		history.scrollRestoration = "manual";
	}
	$grid.on("click", "a", function(e) {
		$.persist("GRID_PERSIST", {
			"scrollPos" : $(document).scrollTop(),
			"grid" : ig.getStatus()
		});
	});
	var persistData = $.persist("GRID_PERSIST");
	if ($.isEmptyObject(persistData)) {
		getData(0, 0, 'append');
	} else {
		ig.setStatus(persistData.grid);
		window.scrollTo(0, persistData.scrollPos);
	}
});
function getData(currentPageNo, groupNo, type) {
	$.ajax({
		type : "POST",
		url : "data.jsp", 
		data : "pageNo=" + currentPageNo,
		dataType : "json",
		success : function(list) {
			
			var retHtml = '';
			$.each(list, function(i, obj) {
				retHtml += '<div class="item" id="lll">' + '<div class="thumbnail" onClick="openModal('+obj.cardSeq+')">'
						+ '<div class="profile"><img class="imgProfile" src="' + obj.imgProfile + '"/></div>'
						+ '<div class="hanger"><img class="imgHanger" src="' +obj.imgHanger +'"/></div>'
						+ '<div class="imgContent"><img class="img-rounded" src="'+ obj.imgSrc + '"/></div>'
						+ '<p>궁금하다면? 클릭해서 자세히보세요.</p>'
						+ '<div class=bottom_caption>'
						+ '<div class="postTitle">' + obj.postTitle + '</div>'
						+ '<div class="postDesc">' + obj.postDesc + '</div>'
						+ '</div>'
						+ '</div></div>';
			});
			console.log(groupNo);
			if (type == 'append') {
				ig.append(retHtml, groupNo);
			} else {
				ig.prepend(retHtml, groupNo);
			}
		},
		error : function(e) {
			alert(e.responseText);
		}
	});
}
