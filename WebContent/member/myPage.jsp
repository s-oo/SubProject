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
<link rel="stylesheet" type="text/css"href="<%=cp%>/css/shopStyle.css" />
<link rel="stylesheet" type="text/css"href="<%=cp%>/member/css/memberListStyle.css" />

</head>
<body>

 <jsp:include page="../main/header.jsp"/>
   
   <div id="content" align="center">



<br><br>


	<div align="center" >
		<input type="button" value=" ORDER " class="btn2" onclick="location.href='<%=cp%>/shop/orders/orderList.do';"/> <br>
		<input type="reset" value=" BAG " class="btn2" onclick="location.href='<%=cp%>/shop/orders/cartList.do';"/><br> 
		<input type="button" value=" PROFILE " class="btn2" onclick="location.href='<%=cp%>/shop/member/update.do';"/><br>
		<input type="button" value=" Q/A " class="btn2" onclick="location.href='<%=cp%>/shop/boards/list.do?community=QnA';"/><br> 
		<input type="button" value=" MAIN " class="btn2" onclick="location.href='<%=cp%>/shop/main/main.do';"/><br> 
		<input type="button" value=" 탈퇴 " class="btn2" onclick="location.href='<%=cp%>/shop/member/delete.do';"/><br> 
	</div>
	

</div>
   
<jsp:include page="../main/footer.jsp"/>

	
</body>
</html>