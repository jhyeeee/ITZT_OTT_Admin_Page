
<%@page import="ITzy.admin.dao.CalDao"%>
<%@page import="ITzy.admin.util.CalUtil"%>
<%@page import="ITzy.admin.dto.CalDto"%>
<%@page import="ITzy.admin.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

   
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
/* 	main{	
		width:1200px;
		margin: 0 auto;
		margin-bottom: 80px;
	}
table, th, td{	
	border-collapse : collapse;
	border: rgb(128, 128, 128) solid 1px;	
}
th{
	background-color: rgb(0, 0, 192);
	color: white;
}
td{
	padding: 10px;
}*/
.content{
	font-size: 24px;
} 
</style>
</head>
<%

MemberDto login = (MemberDto)session.getAttribute("login");
if (login == null) {
%>
<script>
	alert('로그인 해 주십시오');
	location.href = "login.do";
</script>
<%
}

int seq = Integer.parseInt( request.getParameter("seq") );
CalDto dto = (CalDto)request.getAttribute("caldetail");
%>   
<body>


<h2>일정보기</h2>
<hr>
<br>

<div align="center" style="margin-right:  10%;">

<table class="table table-bordered">
<col width="200"><col width="500">
<tr>
	<th>아이디</th>
	<td><%=dto.getId() %></td>
</tr>
<tr>
	<th>제목</th>
	<td><%=dto.getTitle() %></td>
</tr>
<tr>
	<th>일정</th>
	<td><%=CalUtil.toDates(dto.getRdate()) %></td>
</tr>
<tr height="300">	
	<td colspan="2" valign="top" width="80%"><%=dto.getContent() %></td>
</tr>
</table>
<br>
<button type="button" class="btn btn-secondary" onclick="calUpdate(<%=dto.getSeq() %>)">수정</button>

<button type="button" class="btn btn-secondary" onclick="calDelete(<%=dto.getSeq() %>)">삭제</button>
</div>

<script type="text/javascript">
function calUpdate(seq) {
	location.href = "calupdate.do?seq=" + seq;
}
/* function calDelete(seq) {
	location.href = "caldelete.do?seq=" + seq;
} */
function calDelete(seq) {

	 if (confirm("정말 삭제하시겠습니까??") == true){    //확인

		 location.href = "caldelete.do?seq=" + seq;

	 }else{   //취소

	     return false;

	 }

	}

</script>

</body>
</html>











