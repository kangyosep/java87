/**
 * fullPage.js 기능구현 슬라이드 위아래
 * login validation check Ajax post 방식으로 로그인 구현
 */
var $header_top = $('.header-top');
var $nav = $('nav');
/*$header_top.find('a').on('click', function () {
 $(this).parent().toggleClass('open-menu');
 });*/

/*
 * 
 * login facebook start
 * ***********************************************/

// This is called with the results from from FB.getLoginStatus().
window.fbAsyncInit = function() {
	FB.init({
		appId : '1318879354818511', // 앱 ID
		status : true, // 로그인 상태를 확인
		cookie : false, // 쿠키허용
		xfbml : true
	// parse XFBML
	});

	FB.getLoginStatus(function(response) {

		if (response.status === 'connected') {

			FB.api('/me', {
				fields : [ "email", "name" ]
			}, function(user) {

				if (user) {//성공시

					var fbImage = 'http://graph.facebook.com/' + user.id
							+ '/picture';
					var facebookURL= 'www.facebook.com/' +user.id;
					var name=user.name;
					alert(facebookURL);
					
					$.ajax({
						url :"user/fbLogin",
						type : 'POST',
						data : {
							email :facebookURL
						},
						success : function(user) {
								alert(user.email);
							if (user.email != null) {
								alert("로그인성공");
								location.href ="main/cardList.jsp"
							} else {
								alert("로그인실패 회원가입 고고");
							    	$.post('user/fbaddUser', {
									nick : name,
									email :facebookURL,
									pwd : '0',
									phot_path:fbImage
								}, function(successAdd) {
									alert("회원가입성공");
									location.href ="main/cardList.jsp"
							
								});//$.post끝
							}//else끝
						}//suceess끝
					});//ajax끝
					
				}//if문끝
			});

		} else if (response.status === 'not_authorized') {

		} else {

		}
	});

	FB.Event.subscribe('auth.login', function(response) {
		document.location.reload();
	});
};

// Load the SDK Asynchronously
(function(d) {
	var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
	if (d.getElementById(id)) {
		return;
	}
	js = d.createElement('script');
	js.id = id;
	js.async = true;
	js.src = "//connect.facebook.net/ko_KR/all.js";
	ref.parentNode.insertBefore(js, ref);
}(document));

/*login facebook end
 * **********************************************/

/*login js start
 * *********************************************/
function fncLogin() {
	var id = document.loginForm.email.value;
	var pw = document.loginForm.pwd.value;
	//이메일 유효성체크

	if (id == null || id.length < 1) {
		alert('ID 를 입력하지 않으셨습니다.');
		document.loginForm.email.focus();
		return false;
	}

	if (pw == null || pw.length < 1) {
		alert('패스워드를 입력하지 않으셨습니다.');
		document.loginForm.pwd.focus();
		return false;
	}

	$.post("user/login", {
		"email" : $(".form-control").val()
	}, function checkUser(user) {

		var dbemail = user.email;
		var dbpwd = user.pwd;
		console.log(dbemail);
		console.log(dbpwd);
		console.log($("#emailBtn").val());
		console.log($("#pwdBtn").val());

		if ($("#emailBtn").val() != dbemail) {
			alert("이메일확인하십시오.")
			return false;
		}
		if ($("#pwdBtn").val() != dbpwd) {
			alert("비밀번호가 다릅니다.")
			return false;
		}
		if ($("#emailBtn").val() == dbemail && $("#pwdBtn").val() == dbpwd) {
			alert("로그인성공");
			location.href = "main/cardList.jsp";
		} else {
			alert("로그인실패");
		}
	});

	return false;
}

$(document).ready(function() {
	$("#myBtn").click(function() {
		$("#myModal").modal();
	})
});
/* login js end
 * *******************************************************/
$('#fullpage').fullpage(
		{
			sectionsColor : [ '#F2AE72', '#56bc8a', '#a77dc2', '#36465d',
					'#f2992e' ],
			sectionSelector : '.vertical-scrolling',
			slideSelector : '.horizontal-scrolling',
			navigation : true,
			slidesNavigation : true,
			controlArrows : false,
			anchors : [ 'firstSection', 'secondSection', 'thirdSection',
					'fourthSection', 'fifthSection' ],
			menu : '#menu',
			afterLoad : function(anchorLink, index) {
				$header_top.css('background', 'rgba(0, 47, 77, .3)');
				$nav.css('background', 'rgba(0, 47, 77, .25)');
				if (index == 5) {
					$('#fp-nav').hide();
				}
			},
			onLeave : function(index, nextIndex, direction) {
				if (index == 5) {
					$('#fp-nav').show();
				}
			},
			afterSlideLoad : function(anchorLink, index, slideAnchor,
					slideIndex) {
				if (anchorLink == 'fifthSection' && slideIndex == 1) {
					$.fn.fullpage.setAllowScrolling(false, 'up');
					$header_top.css('background', 'transparent');
					$nav.css('background', 'transparent');
					$(this).css('background', '#374140');
					$(this).find('h2').css('color', 'white');
					$(this).find('h3').css('color', 'white');
					$(this).find('p').css({
						'color' : '#DC3522',
						'opacity' : 1,
						'transform' : 'translateY(0)'
					});
				}
			},
			onSlideLeave : function(anchorLink, index, slideIndex, direction) {
				if (anchorLink == 'fifthSection' && slideIndex == 1) {
					$.fn.fullpage.setAllowScrolling(true, 'up');
					$header_top.css('background', 'rgba(0, 47, 77, .3)');
					$nav.css('background', 'rgba(0, 47, 77, .25)');
				}
			}
		});
/*
 * 
 *  로그인폼 회원가입폼
 */

$(function() {

	$('#login-form-link').click(function(e) {
		$("#login-form").fadeIn(100);
		$("#register-form").fadeOut(100);
		$('.faceBookBtn').attr('style', 'display:bolck');
		$('#register-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#register-form-link').click(function(e) {
		$("#register-form").fadeIn(100);
		$("#login-form").fadeOut(100);
		$('.faceBookBtn').attr('style', 'display:none');
		$('#login-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
});
