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
.container {
	width: 100%;
	height: 600px;
	overflow-y:auto; 
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
	height: 400px;
	position: relative;
	z-index: 2;
	background: white;
	box-shadow: 3px 3px 5px black;
	margin: auto;
	cursor: pointer;
	text-align: center;
}
.popState {
	position: absolute;
	z-index: 1;

	width: 100%;
	height: 100%;
	display: none;
}

.popState>article {
	width: 500px;
	height: 300px;
	position: relative;
	z-index: 2;
	background: white;
	box-shadow: 3px 3px 5px black;
	margin: auto;
	cursor: pointer;
	text-align: center;
}
.black { 
background:rgba(0,0,0,0.001);
width: 60%;
height:100%;
 }

select{
  border:1px solid #c8c8c8;
  padding: 5px 10px;
}
option {
  color:#111;
}
select:required:invalid {
   color: #909090;
}
option[value=""][disabled] {
  display:none
}
</style>
<body>

	<%
List<MemberDto> list = (List<MemberDto>) request.getAttribute("allmem");
String go = (String)request.getAttribute("go");
String title = (String)request.getAttribute("title");
	
%>
	<h1><%= title %></h1>


	<div class="container">
		<table id="ListTable" class="table table-hover">
			<col width="80">
			<col width="80">
			<col width="150">
			<col width="150">
			<col width="150">
			<col width="100">
			<col width="80">
			<col width="80">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>소속회사</th>
				<th>연락처</th>
				<th>권한</th>
				<th>수정</th>
				<th>상태변경</th>
			</tr>



			<%
			if(list.isEmpty()){ %>
			<tr>
			<td colspan="8"> 게시글이 없습니다</td>
			</tr>
			<%	
			}else{
			 %>
			<%
		for (int i = 0; i < list.size(); i++) {
	
			MemberDto dto = list.get(i);
			String s = Integer.toString(i);
		%>
			<tr>
				<td><b><%=dto.getId()%></b></td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getEmail()%></td>
				<td><%=dto.getCompany()%></td>
				<td><%=dto.getContact()%></td>
				<td>
					<%
				if (dto.getAuth() == 1) {
				%> 기업회원 <%
				} else if (dto.getAuth() == 2) {
				%> 일반회원 <%
				} else if (dto.getAuth() == 0) {
				%> 관리자 <%
				}else if (dto.getAuth() == 3) {
				%><span style="color: red">활동정지</span> <%
				}
				%>


				</td>
				<td>
					<button class="btn btn-primary btn-sm" id=infoUpdate<%= s %> >수정</button>

				</td>
				<td>
					<button  class="btn btn-danger btn-sm" id=stateUpdate<%= s %>>변경</button>
				</td>

			


		
			</tr>

			<div class=popUpdate id=popUpdate<%= s %>>
				<article>
				<br>
				<h1>회원정보 수정</h1>
				<h2>아이디 : <%= dto.getId() %> 님</h2>
							
				<br>
				
				<form action= "modifyName.do" method="post">
				<input type="hidden" name=id value="<%= dto.getId() %>">				
				<input type="hidden" name=go value="<%= go %>">				
				이름 변경 : <input type="text" id=name<%= s %> name=name placeholder="변경할 이름"> 
				<button type="submit" id=nameBtn<%= s %> class="btn btn-success btn-sm">변경</button>
				</form>		
			
				<form action= "modifyEmail.do" method="post">
				<input type="hidden" name=id value="<%= dto.getId() %>">
				<input type="hidden" name=go value="<%= go %>">			
				<br> email 변경 : <input type="email" id=email<%= s %> name=email placeholder="변경할 email">
				<button type="submit" id=emailBtn<%= s %>  class="btn btn-success btn-sm">변경</button>
				</form>	
			
			
				<form action= "modifyContact.do" method="post">
				<input type="hidden" name=id value="<%= dto.getId() %>">
				<input type="hidden" name=go value="<%= go %>">			
				<br> 연락처 변경 : <input type="text" id=contact<%= s %> name=contact  maxlength=13 placeholder="숫자만 입력" onkeyup="chk_tel(this.value,'contact<%= s %>')">					
				<button type="submit" id=conBtn<%= s %> class="btn btn-success btn-sm">변경</button>
				</form>	
				
				<br>		
				<br>	
					<button class="btn btn-secondary btn-sm" id=popclose1<%= s %>>창닫기</button>
				</article>
			</div>	
			<div class=popState id=popState<%=s%>>
				<article>
					<br>
					<h1>회원 상태 변경</h1>
					<h3>아이디 :<%=dto.getId()%> 님</h3>
					<h2>현재 상태 :<%
						if (dto.getAuth() == 1) {
						%> 기업회원 <%
						} else if (dto.getAuth() == 2) {
						%> 일반회원 <%
						} else if (dto.getAuth() == 0) {
						%> 관리자 <%
						}else if (dto.getAuth() == 3) {
						%> 활동중지 <%
						}
						%></h2>
					<br>
					
				<form action= "modifyAuth.do" method="post">
				<input type="hidden" name=go value="<%= go %>">		
				<input type="hidden" name=id value="<%= dto.getId() %>">
					<select name=auth>
					    <option value=0>관리자</option>
					    <option value=1>기업회원</option>
					    <option value=2>일반회원</option>
					    <option value=3>활동정지</option>
					</select>	
					<button type="submit" id=authBtn<%= s %> class="btn btn-success btn-sm">변경</button>
					<br>
					<br>			
				</form>
					<button class="btn btn-secondary btn-sm" id=popclose2<%=s%>>창닫기</button>
				</article>
			</div>
			
				
				
				<script type="text/javascript">
				
			
				$(document).ready(function() {
					$("#infoUpdate"+<%= s %>+":first-of-type").click(function() {
						$("#popUpdate"+<%= s %>).fadeIn();
						$("#popUpdate"+<%= s %>).addClass("black");
					});
					$("#popclose1"+<%= s %>).click(function() {
						$("#popUpdate"+<%= s %>).parent().fadeOut();
						location.reload();
					});
				});

			
			
				$(document).ready(function() {
					$("#stateUpdate"+<%= s %>+":first-of-type").click(function() {
						$("#popState"+<%= s %>).fadeIn();
						$("#popState"+<%= s %>).addClass("black");
					});
					$("#popclose2"+<%= s %>).click(function() {
						$("#popState"+<%= s %>).parent().fadeOut();
						location.reload();
					});
				});

				
				</script>
								
		

			<%
		}
		} %>

		</table>
	</div>




	<script type="text/javascript">


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