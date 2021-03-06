var ig;
$(function infinite() {
	var $grid = $("#grid");

	ig = new eg.InfiniteGrid("#grid", {
		count : 90
	// pagePerCnt 배수로 가야함 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	}).on({
		"append" : function(e) {
			var gk = this.getGroupKeys();

			// alert(gk);
			// alert(gk.length);

			var lastGk = gk[gk.length - 1];

			// alert(lastGk);

			lastGk++;

			// alert(lastGk);

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

	// 이 아래는 링크 눌러서 다른 화면갔다가 다시 돌아왔을때 위치를 가지고 있도록 하는 부분
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

// 모달 여는 펑션
function openModal(cardSeq) {

	$.ajax({
		type : "POST",
		url : "detailData.jsp", // ***데이터를 내려주는 page URL
		data : "cardSeq=" + cardSeq,
		dataType : "json",
		success : function(obj) {
			// 서버에서 응답받으면 화면처리 메소드 호출
			console.log("성공했을시");
			console.log(obj.imgProfile);
			var userNickname = obj.userNickname;
			$("#userProfileImg").attr("src",obj.imgProfile);

			$('#myModal').modal('show')

		},
		error : function(e) {
			alert(e.responseText);
		}
	});

}

// 뒷배경 스크롤 막는 펑션
function saveModal(e, seq) {
	$('#saveModal').modal('show')
	e.stopPropagation();
}

// 서버로 보낼 데이터 가져오기
function getData(currentPageNo, groupNo, type) {
	$
			.ajax({
				type : "POST",
				url : "data.jsp", // ***데이터를 내려주는 page URL
				data : "pageNo=" + currentPageNo,
				dataType : "json",
				success : function(list) {
					// 서버에서 응답받으면 화면처리 메소드 호출
					var retHtml = '';
					$
							.each(
									list,
									function(i, obj) {
										retHtml += '<div class="item" id="itemID">'
												+ '<div class="thbnl" id="tnID"onClick="openModal('+obj.cardSeq+ ')">'
												+ '<div class="profile"><img class="imgProfile" src="'+ obj.imgProfile+ '"/></div>'
												+ '<div class="hanger"><img class="imgHanger" src="'+ obj.imgHanger +'" onClick="saveModal(event, '+obj.cardSeq+')"/></div>'
												+ '<div class="imgContent"><img class="img-rounded" src="'+ obj.imgSrc+ '"/></div>'
												+ '<p>궁금하다면? 클릭해서 자세히보세요.</p>'
												+ '<div class=bottom_caption>'
												+ '<div class="postTitle">'+ obj.postTitle+ '</div>'
												+ '<div class="postDesc">'+ obj.postDesc+ '</div>'
												+ '</div>' + '</div></div>';
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
