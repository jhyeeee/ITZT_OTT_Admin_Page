<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="ITzy.admin.dto.MemberDto"%>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>

<%
MemberDto login = (MemberDto)session.getAttribute("login");
if (login == null) {
%>
<script>
	alert("로그인 세션이 만료되었습니다");
</script>
<%
response.sendRedirect("login.do");
}
%>

<style>
img {
	margin: auto;
}


.box {
	display: flex;
	justify-content: flex-end;
	padding-right: 30px;
}

pre {
	margin-bottom: 0 !important;
	font-size: small;	
}


</style>


<div class=box>

	<div>
		<pre>

	<b>접속한 관리자
	아이디 : <%=login.getId()%> 이름 : <%=login.getName()%> </b></pre>
	</div>


	<div id=logout>
		<br> <img alt="img" src="./images/logout.png" width="30px;"
			height="30px;">
		<button type="button" id="logoutBtn" class="btn btn-outline-light">logout</button>
	</div>

</div>


<script type="text/javascript">
	$(function() {
		$("#logoutBtn").click(function() {
			location.href = "sessionOut.do";
		});
	});
	
	
	
	
</script>
