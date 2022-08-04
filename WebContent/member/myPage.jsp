<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<br><br>
<h1>${userName }님 반갑습니다</h1>

	<div align="center" >
		<input type="button" value=" ORDER " class="btn2" onclick="location.href='<%=cp%>/shop/orders/orderList.do';"/> <br>
		<input type="reset" value=" BAG " class="btn2" onclick="location.href='<%=cp%>/shop/orders/cartList.do';"/><br> 
		<input type="button" value=" PROFILE " class="btn2" onclick="location.href='<%=cp%>/shop/member/update.do';"/><br>
		<input type="button" value=" Q/A " class="btn2" onclick="location.href='<%=cp%>/shop/member/login.do';"/><br> 
	</div>
</body>
</html>