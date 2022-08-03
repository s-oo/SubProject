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
	<c:set var="sum" value="0"/>
	<c:forEach var="dto" items="${list }">
		productNum : ${dto.productNum }<br/>
		productName : ${dto.productName }<br/>
		productQuantity : ${dto.productQuantity }<br/>
		productPrice : ${dto.productPrice }<br/>
		<c:set var="sum" value="${sum } + ${dto.productQuantity } * ${dto.productPrice }"/>
	</c:forEach><br/>
	<c:if test="${sum != 0}">
		sum : ${sum }
	</c:if>
	<c:if test="${list == null }">
		등록된 상품이 없음
	</c:if>
</body>
</html>