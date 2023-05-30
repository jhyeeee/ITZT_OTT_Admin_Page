

<%@page import="java.util.List"%>
<%@page import="ITzy.admin.dto.MemberDto"%>
<%@page import="ITzy.admin.util.CalUtil"%>
<%@page import="ITzy.admin.dto.CalDto"%>
<%@page import="ITzy.admin.dao.CalDao"%>
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
%> 
<%
List<CalDto> list = (List<CalDto>)request.getAttribute("list");
%>
<style>

a{
	text-decoration: none;
}

</style>
<body>


<%
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
%>

<h2><%=year %>년 <%=month %>월 <%=day %>일의 일정</h2>
<hr>
<br>

<div align="center">

<table class="table">
<col width="450"><col width="300">

<tr>
	<th>제목</th>
	<th>일정</th>
</tr>
<%
	if(list == null || list.size() == 0){
		out.print("<tr><td colspan='2'>--- 작성된 일정이 없습니다 ---</td></tr>");
	}else{
		for(CalDto dto:list){
			%>
			<tr>
				<td><a href=caldetail.do?seq=<%=dto.getSeq() %> ><%=dto.getTitle()%> </a></td>
				<td><%=CalUtil.toDates(dto.getRdate())%> </td>				
			</tr>
			<%
		}
	}
%>

</table> 
</div>

<button type="button" class="btn btn-secondary" onclick="location.href='calendar.do'">일정관리</button>

<%!

%>

</body>
</html>