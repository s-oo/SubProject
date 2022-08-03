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
<c:choose>
	<c:when test="${empty sessionScope.customInfo.userId }">
		<b>로그인이 필요한 서비스입니다.</b><br><br>
	</c:when>
	<c:otherwise>
		<b>${sessionScope.customInfo.userName }</b>님 반갑습니다.<br><br>
	</c:otherwise>
</c:choose>

	<div>
		<input type="button" value=" 장바구니 " class="btn2" onclick="location.href='<%=cp%>/shop/orders/cartList.do';"/> 
		<input type="reset" value=" 회원정보수정 " class="btn2" onclick="location.href='<%=cp%>/shop/member/update.do';"/> 
		<input type="button" value=" 로그아웃 " class="btn2" onclick="location.href='<%=cp%>/shop/main/main.do';"/>
		<input type="button" value=" 로그인하기 " class="btn2" onclick="location.href='<%=cp%>/shop/member/login.do';"/> 
	</div>
</body>
</html>