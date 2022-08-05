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
<script type="text/javascript" src="<%=cp%>/member/js/checkBox.js"></script>
</head>
<body>

 <jsp:include page="../main/header.jsp"/>
   
   <div id="content" align="center">



<br><br>
<br><br>
<br><br>
<br><br>
<br><br>

	<div id="cateBtn" align="center" >
		<input  class="cateBtn" style="height: 45px;" type="button" value=" ORDER "  onclick="location.href='<%=cp%>/shop/orders/orderList.do';"/> <br>
		<input style="height: 45px;" type="reset" value=" BAG "  onclick="location.href='<%=cp%>/shop/orders/cartList.do';"/><br> 
		<input style="height: 45px;" type="button" value=" PROFILE "  onclick="location.href='<%=cp%>/shop/member/update.do';"/><br>
		<input style="height: 40px;" type="button" value=" Q/A "  onclick="location.href='<%=cp%>/shop/boards/list.do?community=QnA';"/><br> 
		<input style="height: 45px;" type="button" value=" MAIN " onclick="location.href='<%=cp%>/shop/main/main.do';"/><br> 
		<input style="height: 45px;" type="button" value=" 탈퇴 " onclick="location.href='<%=cp%>/shop/member/delete.do';"/><br> 
	</div>
	

</div>
   
<br><br>
<br><br>
<br><br>
<br><br>
<br><br>
   
   
<jsp:include page="../main/footer.jsp"/>

	
</body>
</html>