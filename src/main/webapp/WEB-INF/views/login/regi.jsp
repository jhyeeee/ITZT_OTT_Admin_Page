<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin 관리자 등록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

<style type="text/css">
body{
background-color: #2E304D;
}

.divider:after, .divider:before {
	content: "";
	flex: 1;
	height: 1px;
	background: #eee;
}

.h-custom {
	height: calc(100% - 60px);
}

@media ( max-width : 450px) {
	.h-custom {
		height: 100%;
	}
}
</style>

</head>
<body>

	<section class="vh-100" >

		<div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1" style="margin: auto; background-color: white; border-radius: 2em;">
			<form action="regiAf.do" method="post" id="regiForm">
				
				<div class="divider d-flex align-items-center my-4">
							<img alt="img" src="./images/logo.png?v=1" width="150px" height="150px">
				</div>
				
				<div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
							<p style="margin: auto; font-size:larger "><b>OTT ADMIN MEMBER REGISTRATION</b></p>
				</div>
				<br>
				
				<div class="form-group input-group">
					<input id="id" name="id" class="form-control" placeholder="로그인 아이디" type="text">
					<button type="button" id="idChkBtn" class="btn btn-info">id check</button>
				</div>
				<p id="idcheck" style="margin-left: 10px;"></p>

				<div class="form-group input-group">
					<input id="name" name="name" class="form-control" placeholder="이름" type="text">
				</div>

				<input id="company" name="company" value="OTT" type="hidden">

				<p id="idcheck" style="margin-left: 10px;"></p>

				<div class="form-group input-group">
					<input id="email" name="email" class="form-control"
						placeholder="이메일주소" type="email">
				</div>
				<!-- form-group// -->

				<div class="form-group input-group">
					<input type="text" id="contact" name="contact" class="form-control"
						maxlength="13" placeholder=" '-' 없이 숫자만 입력해주세요"
						onkeyup="chk_tel(this.value,'contact')">
				</div>
				<!-- form-group end.// -->
				<div class="form-group input-group">
					<input id="pw1" name="pwd" class="form-control" placeholder="비밀번호"
						type="password">
				</div>
				<!-- form-group// -->

				<div class="form-group input-group">
					<input id="pw2" class="form-control" placeholder="비밀번호 확인"
						type="password">
				</div>
				<p id="pw_ck" style="margin-left: 10px;"></p>
				<!-- form-group// -->

				<div class="form-group"></div>
				<!--tab-->
				<button type="button" id="regi1Btn"
					class="btn btn-warning btn-block">관리자 등록</button>
					<br>
				<div>
					<p class="text-center">
						<a href="login.do">로그인</a>
					</p>
				</div>
<br>
			</form>
		</div>
	</section>

	<script type="text/javascript">
		//기업회원  아이디 중복 확인
		$(document).ready(function() {

			$("#idChkBtn").click(function() {
				// id의 빈칸을 조사!

				$.ajax({
					type : "post",

					url : "idcheck.do",
					data : {
						"id" : $("#id").val()
					},

					success : function(msg) {
						if (msg == "YES") {
							$("#idcheck").css("color", "#0000ff");
							$("#idcheck").text("사용할 수 있는 아이디입니다");
						} else {
							$("#idcheck").css("color", "#ff0000");
							$("#idcheck").text("사용중인 아이디입니다");
							$("#id").val("");
						}
					},
					error : function() {
						alert('error');
					}
				});
			});
		});

		// 기업회원 비밀번호 확인
		$(function() {
			$('#pw1').keyup(function() {
				$('#pw_ck').text('');
			});

			$('#pw2').keyup(function() {

				if ($('#pw1').val() != $('#pw2').val()) {
					$("#pw_ck").css("color", "#ff0000");
					$('#pw_ck').text('비밀번호 일치하지 않음');

				} else {
					$("#pw_ck").css("color", "#0000ff");
					$('#pw_ck').text('비밀번호 일치');

				}

			});
		});

		//기업회원 회원가입 빈칸알럿
		$(function() {
			// .submit() -> 해당 form에서 sunmit 이벤트가 발생했을 때, 실행
			$("#regi1Btn").click(function() {
				if ($("#id").val().trim() == "") {
					alert("아이디를 입력하세요");
				} else if ($("#name").val().trim() == "") {
					alert("이름을 입력하세요");
				} else if ($("#email").val().trim() == "") {
					alert("이메일을 입력하세요");
				} else if ($("#contact").val().trim() == "") {
					alert("전화번호를 입력하세요");
				} else if ($("#pw1").val().trim() == "") {
					alert("비밀번호를 입력하세요");
				} else if ($("#pw2").val().trim() == "") {
					alert("확인 비밀번호를 입력하세요");
				} else if ($("#pw2").val().trim() != $("#pw1").val().trim()) {
					alert("비밀번호가 다릅니다");
				} else {
					$("#regiForm").submit();
				}
			});
		});

		//전화번호에 하이픈 자동으로 넣는 함수
		function chk_tel(str, id) {
			str = str.replace(/[^0-9]/g, '');
			var tmp = '';

			if (str.substring(0, 2) == "02") {
				if (str.length < 3) {
					$("#" + id).val(str);
				} else if (str.length < 6) {
					tmp += str.substr(0, 2);
					tmp += '-';
					tmp += str.substr(2);
					$("#" + id).val(tmp);
				} else if (str.length < 10) {
					tmp += str.substr(0, 2);
					tmp += '-';
					tmp += str.substr(2, 3);
					tmp += '-';
					tmp += str.substr(5);
					$("#" + id).val(tmp);
				} else {
					tmp += str.substr(0, 2);
					tmp += '-';
					tmp += str.substr(2, 4);
					tmp += '-';
					tmp += str.substr(6, 4);
					$("#" + id).val(tmp);
				}
			} else {
				if (str.length < 4) {
					$("#" + id).val(str);
				} else if (str.length < 7) {
					tmp += str.substr(0, 3);
					tmp += '-';
					tmp += str.substr(3);
					$("#" + id).val(tmp);
				} else if (str.length < 11) {
					tmp += str.substr(0, 3);
					tmp += '-';
					tmp += str.substr(3, 3);
					tmp += '-';
					tmp += str.substr(6);
					$("#" + id).val(tmp);
				} else {
					tmp += str.substr(0, 3);
					tmp += '-';
					tmp += str.substr(3, 4);
					tmp += '-';
					tmp += str.substr(7);
					$("#" + id).val(tmp);
				}
			}
		}
	</script>

</body>
</html>