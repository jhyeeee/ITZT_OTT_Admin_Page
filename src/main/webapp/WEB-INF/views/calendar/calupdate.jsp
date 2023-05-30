
<%@page import="ITzy.admin.dto.MemberDto"%>
<%@page import="ITzy.admin.dto.CalDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<%	
CalDto dto = (CalDto)request.getAttribute("caldetail");
int seq = Integer.parseInt(request.getParameter("seq"));


MemberDto login = (MemberDto)session.getAttribute("login");
if (login == null) {
%>
<script>
	alert('로그인 해 주십시오');
	location.href = "login.do";
</script>
<%
}
%> 
<body>

<h2>일정수정</h2>

<div align="center">

<form action="calupdateAf.do" id="frm" method="post">
<input type="hidden" name="seq" value="<%=seq %>">
<table border="1">
<col width="200"><col width="500">
<tr>
	<th>아이디</th>
	<td>
		<%=login.getId() %>
		<input type="hidden" name="id" value="<%=login.getId()%>">
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" size="80" id="title" name="title" >
	</td>
</tr>
<tr>
	<th>일정</th>
	<td>
		<input type="date" name="date" id="date">&nbsp;
		<input type="time" name="time" id="time">
		
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="80" id="content" name="content"></textarea>
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<button type="button">일정수정</button>
	</td>
</tr>
</table>
</form>
</div>

<script type="text/javascript">
$(document).ready(function() {
	$("button").click(function() {
		
		if($("#title").val().trim() == "" ){
			alert("제목을 기입해 주십시오");
			return;
		}else if($("#content").val().trim() == "" ){
			alert("내용을 기입해 주십시오");
			return;
		}else if($("#date").val().trim() == "" ){
			alert("날짜을 기입해 주십시오");
			return;
		}else if($("#time").val().trim() == "" ){
			alert("시간을 기입해 주십시오");
			return;
		}else{
			$("#frm").submit();
		}		
	});	
});
</script>


</body>
</html>