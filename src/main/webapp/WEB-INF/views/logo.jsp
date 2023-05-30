<%@page import="ITzy.admin.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
img {
	margin-left: 50px !important;
}
</style>


<img alt="img" src="./images/logo.png?v=1" width="75px" height="75px">