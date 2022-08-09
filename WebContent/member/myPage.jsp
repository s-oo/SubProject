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
				
				
				<button  style="cursor:pointer; margin-top:10PX; border:1px solid #000; background-color: #FFFFFF; width: 480px; line-height: 48px;"
					type="button" onclick="location.href='<%=cp%>/shop/orders/orderList.do';"
					onmouseover=this.style.backgroundColor='#F0F0F0' onmouseout=this.style.backgroundColor='white'>
						<b style="font-size: 17px; color: black;"> ORDER </b><br><a>고객님꼐서 주문하신 상품의 주문내역을 확인하실 수 있습니다.</a>
				</button>
	<br>
				<button style="cursor:pointer; margin-top:10PX; border:1px solid #000; background-color: #FFFFFF; width: 480px; line-height: 48px;"
						type="button" onclick="location.href='<%=cp%>/shop/orders/cartList.do';" 
						onmouseover=this.style.backgroundColor='#F0F0F0' onmouseout=this.style.backgroundColor='white'>
							<b style="font-size: 17px; color: black;"> BAG </b><br>
							<a>관심상품으로 등록하신 상품의 목록을 보여드립니다.</a>
					</button>	
					
	<br>
				<button style="cursor:pointer; margin-top:10PX; border:1px solid #000; background-color: #FFFFFF; width: 480px; line-height: 48px;"
						type="button" onclick="location.href='<%=cp%>/shop/member/update.do';"
						onmouseover=this.style.backgroundColor='#F0F0F0' onmouseout=this.style.backgroundColor='white'>
							<b style="font-size: 17px; color: black;"> PROFILE </b><br>
							<a>회원이신 고객님의 개인정보를 관리하는 공간입니다.
							개인정보를 최신정보로 유지하시면 보다 간편히 쇼핑을 즐기실수 있습니다.</a>
					</button>
					
	<br>
				<button style="cursor:pointer; margin-top:10PX; border:1px solid #000; background-color: #FFFFFF; width: 480px; line-height: 48px;"
						type="button" onclick="location.href='<%=cp%>/shop/boards/qna.do';"
						onmouseover=this.style.backgroundColor='#F0F0F0' onmouseout=this.style.backgroundColor='white'>
							<b style="font-size: 17px; color: black;"> Q/A </b><br>
							<a>고객님께서 작성하신 질문을 관리하는 공간입니다<br>고객님께서 작성하신 글을 한눈에 관리하실 수 있습니다.</a>
					</button>
	<br>
				<button style="cursor:pointer; margin-top:10PX; border:1px solid #000; background-color: black; width: 480px; line-height: 48px;"
						type="button" onclick="location.href='<%=cp%>/shop/main/main.do';"
						onmouseover=this.style.backgroundColor='#6E6E6E' onmouseout=this.style.backgroundColor='black'>
							<b style="font-size: 17px; color: white;"> MAIN </b>
					</button>			
					
					
				</div>		
	


	

</div>
   
<br><br>
<br><br>
<br><br>

   
<jsp:include page="../main/footer.jsp"/>

	
</body>
</html>