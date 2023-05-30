<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OTT admin page</title>
<style type="text/css">
* {
	font-family: "Nanum Gothic", cursive;
}



h1, h2, h3 {
	margin: 0;
}

a {
	text-decoration: none !important;
}

a:hover {
	color: red !important;
}

.logo {
	position: fixed;
	background: #2E304D;
	width: 150px;
	float: left;
	height: 75px;
}

.header {
	color: white;
	position: fixed;
	height: 100px;
	margin-left: 150px;
	background: #2E304D;
	height: 75px;
	width: calc(100% - 150px);
}

.menu {
	float : left;
	height: 100%;
	width: 20%;
	float: left;
	/* background-color: gray; */
}

.content {
	float: left;
	height: 100%;
	width: 80%;
	
}


.float {
	position: fixed;
	margin-top: 100px;
	width: 100vw;
	height: 100vh;
}
</style>
</head>
<body>

	<!-- header -->

	<div class="logo">
		<tiles:insertAttribute name="logo" />
	</div>
	<div class="header">
		<tiles:insertAttribute name="header" />
	</div>


	<!-- main -->

	<div class=float>
		<div class="menu">
			<tiles:insertAttribute name="menu" />
		</div>
		<div class="content">
			<tiles:insertAttribute name="content" />
		</div>
	</div>


</body>
</html>






