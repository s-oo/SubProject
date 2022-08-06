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


			<div align="center">	
				
				
				<button  style=" margin-top:10PX; border:1px solid #000; background-color: #FFFFFF; width: 480px; line-height: 48px;"
					type="button" onclick="location.href='<%=cp%>/shop/orders/orderList.do';">
						<b style="font-size: 17px; color: black;"> ORDER </b>
				</button>
	<br>
				<button style=" margin-top:10PX; border:1px solid #000; background-color: #FFFFFF; width: 480px; line-height: 48px;"
						type="button" onclick="location.href='<%=cp%>/shop/orders/cartList.do';">
							<b style="font-size: 17px; color: black;"> BAG </b>
					</button>	
					
	<br>
				<button style=" margin-top:10PX; border:1px solid #000; background-color: #FFFFFF; width: 480px; line-height: 48px;"
						type="button" onclick="location.href='<%=cp%>/shop/member/update.do';">
							<b style="font-size: 17px; color: black;"> PROFILE </b>
					</button>
					
	<br>
				<button style=" margin-top:10PX; border:1px solid #000; background-color: #FFFFFF; width: 480px; line-height: 48px;"
						type="button" onclick="location.href='<%=cp%>/shop/boards/list.do?community=QnA';">
							<b style="font-size: 17px; color: black;"> Q/A </b>
					</button>
	<br>
				<button style=" margin-top:10PX; border:1px solid #000; background-color: #FFFFFF; width: 480px; line-height: 48px;"
						type="button" onclick="location.href='<%=cp%>/shop/main/main.do';">
							<b style="font-size: 17px; color: black;"> MAIN </b>
					</button>			
					
					
				</div>		
	


	

</div>
   
<br><br>
<br><br>
<br><br>

   
<jsp:include page="../main/footer.jsp"/>

	
</body>
</html>