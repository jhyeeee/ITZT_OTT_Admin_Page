<%@page import="ITzy.admin.dto.MemberDto"%>
<%@page import="ITzy.admin.util.CalUtil"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<style>
textarea {
    width: 100%;
    height: 8.25em;
    border: none;
    resize: none;
  }
</style>
<%
MemberDto login = (MemberDto)session.getAttribute("login");
if(login == null){
	%>
	<script>
	alert('로그인 해 주십시오');
	location.href = "login.jsp";
	</script>
	<%
}	
%> 
<%
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	
	month = CalUtil.isTwo(month);
	day = CalUtil.isTwo(day);
%>  

<body>
<h2>일정추가</h2>
<form action="calwriteAf.do" id="frm" method="post">
<div align="center" style="margin-right:  10%;">
	<table class="table table-bordered" >
		<tr>
			<th>아이디</th>
			<td width="80%">
				<%=login.getId() %>
				<input type="hidden" name="id" value="<%=login.getId() %>">
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" size="80" id="title" name="title">
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
				<button type="button" class="btn btn-outline-dark">일정추가</button>

			</td>
		</tr>
		
	</table>
</div>
</form>
<script type="text/javascript">
let year = "<%=year %>";
let month = "<%=month %>";
let day = "<%=day %>";

document.getElementById("date").value = year + "-" + month + "-" + day; // 2023-02-16

let date = new Date();
document.getElementById("time").value = date.getHours() + ":" + date.getMinutes();
</script>
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