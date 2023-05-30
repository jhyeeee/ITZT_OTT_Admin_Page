<%@page import="ITzy.admin.dto.QnaDto"%>
<%@page import="ITzy.admin.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<!DOCTYPE html>

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
textarea {
	text-align: left;
}

.container {
	width: 100%;
	height: 600px;
	overflow-y: auto;
}

#ListTable {
	width: 100%;
	font-size: small;
	border-collapse: collaps
}

#ListTable th {
	height: 40px;
	position: sticky;
	top: 0px;
	background-color: #F0F0F0;
}

.popUpdate {
	position: absolute;
	z-index: 1;
	width: 100%;
	height: 100%;
	display: none;
}

.popUpdate>article {
	width: 500px;
	height: 500px;
	position: relative;
	z-index: 2;
	background: white;
	box-shadow: 3px 3px 5px black;
	margin: auto;
	cursor: pointer;
	text-align: center;
}

.black {
	background: rgba(0, 0, 0, 0.001);
	width: 60%;
	height: 100%;
}

select {
	border: 1px solid #c8c8c8;
	padding: 5px 10px;
}

option {
	color: #111;
}

select:required:invalid {
	color: #909090;
}

option[value=""][disabled] {
	display: none
}
</style>
<body>

	<%
List<QnaDto> list = (List<QnaDto>) request.getAttribute("qna");
String go = (String)request.getAttribute("go");
String type = (String)request.getAttribute("type");
	
%>
	<h1><%= type %></h1>


	<div class="container">
		<table id="ListTable" class="table table-hover">
			<col width="10%">
			<col width="10%">
			<col width="35%">
			<col width="20%">
			<col width="12%">
			<col width="13%">
	
			<tr>
				<th>글번호</th>
				<th>아이디</th>
				<th>제목</th>
				<th>작성일</th>
				<th>답변등록</th>
				<th>답변시간</th>
			
			
			</tr>

			<%
			if(list.isEmpty()){ %>
			<tr>
			<td colspan="6"> 게시글이 없습니다</td>
			</tr>
			<%	
			}else{
			 %>
			<%
		for (int i = 0; i < list.size(); i++) {
	
			QnaDto dto = list.get(i);
			String s = Integer.toString(i);
		%>
			<tr>
				<td><b><%=dto.getSeq()%></b></td>
				<td><%=dto.getId()%></td>
				<td><%=dto.getTitle()%></td>
				<td><%=dto.getWdate()%></td>
			
				<td>
					<button class="btn btn-primary btn-sm" id=ansUpdate<%= s %> >답변등록</button>
				</td>
				
				<% if(dto.getAnsdate() != null){ %>
				<td><%= dto.getAnsdate() %></td>
				<%}else{ %>
				<td></td>
				<%} %>			
			
			</tr>

			<div class=popUpdate id=popUpdate<%= s %>>
				<article>
				<br>
				<h3>답변등록</h3>
				<h4>아이디 : <%= dto.getId() %> 님</h4>						
				<br>
			<textarea  id=answer name=answer style="width:90%; height:110px; resize: none;" readonly="readonly">
				<%= dto.getContent() %>
		</textarea>
					<form action="addAns.do" method="post" id=frm<%= s %>>
						<input type="hidden" name=seq value="<%=dto.getSeq()%>">
						<input type="hidden" name=mngid value="<%=login.getId()%>">
						<input type="hidden" name=go value="<%=go%>"> 
						
						<% if(dto.getAnsdate() != null){ %>
						<textarea id=answer<%= s %>  name=answer style="width:90%; height:160px; resize: none;" placeholder="<%= dto.getAnswer() %>"></textarea>
						<%}else{ %>
						<textarea  id=answer<%= s %>  name=answer style="width:90%; height:160px; resize: none;"></textarea>
						<%} %>		
					
						<br>
						<button type="button" id=Btn<%=s%>
							class="btn btn-success btn-sm">답변등록</button>
					</form>

					<br>		
				<br>	
					<button class="btn btn-secondary btn-sm" id=popclose1<%= s %> >창닫기</button>
				</article>
			</div>	
		
				<script type="text/javascript">
				
			
				$(document).ready(function() {
					$("#ansUpdate"+<%= s %>+":first-of-type").click(function() {
						$("#popUpdate"+<%= s %>).fadeIn();
						$("#popUpdate"+<%= s %>).addClass("black");
					});
					$("#popclose1"+<%= s %>).click(function() {
						$("#popUpdate"+<%= s %>).parent().fadeOut();
						location.reload();
					});
				});

				
				$(document).ready(function() {
					$("#Btn"+<%=s%>).click(function() {

						if ($("#answer"+<%= s %>).val().trim() == "") {
							alert("답변을 기입해 주십시오");					
						} else {
							$("#frm"+<%= s %>).submit();
						}
					});
				});
			</script>
								
		

			<%
		}
		} %>

		</table>
	</div>


</body>