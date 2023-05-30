
<%@page import="ITzy.admin.dto.CalDto"%>
<%@page import="java.util.List"%>
<%@page import="ITzy.admin.util.CalUtil"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.util.Calendar"%>
<%@page import="ITzy.admin.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendar</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="css/common.css"/>
<style type="text/css">
body {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 15px;
	color: #333;
}

#calendar {
	width: 100%; 
	border-collapse : none;
	border: 1px solid #333;
	border-collapse: none;
}

#calendar td {
	width: 13%;
	height: 90px;
	text-align: left;
	vertical-align: top;
}

a {
	text-decoration: none;
}

/* .viewcls a {
	font-size: 13px;
}

.viewcls a:nth-child(1)>p {
	background: lightblue;
	margin: 3px;
	padding: 3px;
}

.viewcls a:nth-child(2)>p {
	background: lightgreen;
	margin: 3px;
	padding: 3px;
}

.viewcls a:nth-child(3)>p {
	background: lightpink;
	margin: 3px;
	padding: 3px;
} */
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>




</head>
 
<%
	//날짜바꾸기위한 파라미터
	String paramYear = request.getParameter("year");
	String paramMonth = request.getParameter("month");


	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1;
	
	if(paramYear != null){
		year=Integer.parseInt(paramYear);
	}
	if(paramMonth != null){
		month=Integer.parseInt(paramMonth);
	}
	
	if(month>12){
		month=1;
		year++;
	}
	if(month<1){
		month=12;
		year--;
	}
	
	cal.set(year, month-1,1);
	int dayOfWeek=cal.get(Calendar.DAY_OF_WEEK);
	
	int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	//해당 달의 일정 받기
	List<CalDto> vlist = (List<CalDto>)request.getAttribute("vlist");
%>
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
<body>
		

<h1>일정관리</h1>

<div align="center" >
	<a href="calendar.do?year=<%=year-1 %>&month=<%=month %>"><img alt="" src="./images/left.gif" width="25px" height="20px"/></a>
	<a href="calendar.do?year=<%=year %>&month=<%=month-1 %>"><img alt="" src="./images/prec.gif"  width="25px" height="20px"/></a>
	 <span> &nbsp;<%=year %>년<%=month %>월</span>
	<a href="calendar.do?year=<%=year %>&month=<%=month+1 %>"><img alt="" src="./images/next.gif"  width="25px" height="20px"/></a>
	<a href="calendar.do?year=<%=year+1 %>&month=<%=month %>"><img alt="" src="./images/last.gif"  width="25px" height="20px"/></a>	
</div>

<div class="container">
	<table  id="calendar" class="table table-striped table-bordered table-hover">

		<tr>
			<th>SUN</th>
			<th>MON</th>
			<th>TUE</th>
			<th>WED</th>
			<th>THU</th>
			<th>FRI</th>
			<th>SAT</th>
		</tr>
		<tr>
			<%
			for(int i=0;i<dayOfWeek-1;i++){
			%>
				<td>&nbsp;</td>
			<%
			}
			for(int i=1;i<=lastDay;i++){
			%>
				<td>
					<a style="color:<%=CalUtil.fontColor(dayOfWeek, i) %>" href="callist.do?year=<%=year %>&month=<%=month %>&day=<%=i %>"> <b><%=i%></b> </a>
					
					<a href="calwrite.do?year=<%=year %>&month=<%=month %>&day=<%=i %>">
						<span class="material-symbols-outlined">edit</span>
					</a>
					<div class="viewcls"><%= getCalView(i, vlist) %></div>
					
				</td> 
			<%
				if((dayOfWeek-1+i)%7==0){
			%>
					</tr><tr>
			<%
				}
			}
			int countNbsp=(7-(dayOfWeek-1+lastDay)%7)%7;
			for(int i=0;i<countNbsp;i++){
			%>
				<td>&nbsp;</td>
			<%
			}
			%>
		</tr>
	</table>	
	
 	 <%!
 	public String getCalView(int i, List<CalDto> vlist) {
 	    String d = CalUtil.isTwo(i+"");
 	    String vList="";
 	    for(CalDto dto : vlist){
 	        if(dto.getRdate().substring(6, 8).equals(d)){
 	            vList += "<a href='caldetail.do?seq=" + dto.getSeq() + "'><p>"
 	                    +dto.getTitle()
 	                    +"</p>"
 	                    + "</a>";
 	        }
 	    }
 	    return vList;
 	}
 	
 	 
 	 

	%>   


</div>	
	
	
</body>
</html>