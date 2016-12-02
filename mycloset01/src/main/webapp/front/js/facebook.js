window.fbAsyncInit = function() {
	FB.init({
		appId : '1831265407091493',
		status : true,
		cookie : false,
		xfbml : true
	});
	FB.Event.subscribe('auth.logout', function(response) {
		document.location.reload();
	});
	FB.getLoginStatus(function(response) {
		if (response.status === 'connected') {
			
			FB.api('/me', {
				fields : [ 'email', 'name' ]
			}, function(user) {

				if (user) {
					/*var image = document.getElementById('image123');*/
					/*image.src = 'http://graph.facebook.com/' + user.id + '/picture';*/
					// var name = document.getElementById('name');
					/*name.innerHTML = user.name*/
					// var id = document.getElementById('id');
					/* id.innerHTML = user.id*/
					var image = 'http://graph.facebook.com/' + user.id
							+ '/picture';

					var id = user.name;
					var email = user.id;

					$.ajax({
						url : 'user/login12',
						type : 'POST',
						data : {
							userId : user.name
						},
						success : function(user) {
							if (user.userId != null) {
								alert("로그인성공");
								location.href = "index.jsp"
							} else {
								$.post('user/addUser12', {
									userId : id,
									email : 'www.facebook.com/' + email,
									pwd : '0'
								}, function(successAdd) {
									location.href = "index.jsp"
							
								});
							}

						}
					});

				}
			});
		} else if (response.status === 'not_authorized') {

		} else {

		}
	});

	FB.Event.subscribe('auth.login', function(response) {
		document.location.reload();
	});
};
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