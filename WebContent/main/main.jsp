<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main Page</title>

<link rel="stylesheet" type="text/css"href="<%=cp%>/css/shopStyle.css" />

</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	
	<div id="content" align="center" style="width: 1100px;">
	
		<img src="<%=cp%>/main/img/mainImage.jpeg" height="620px;">
		
	</div>
	
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>