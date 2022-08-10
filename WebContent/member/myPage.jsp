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
<style type="text/css">
button.add_button {
	width: 450px;
	display: inline-block;
	margin: 5px;
	height: 120px;;
}
.add_button span {
	font-size: 8px;
	color: #484848;"
}
.add_button b {
	font-size: 17px;
	color: black;
}
</style>
<script type="text/javascript" src="<%=cp%>/member/js/checkBox.js"></script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content" align="center">
		<div style="margin-top: 100px;">
			<button class="add_button" type="button" onclick="sendIt();">
				<b>CART</b>
				<span>
					<br>관심상품으로 등록하신 상품의 목록을 보여드립니다.
				</span>
			</button>	
			<button class="add_button" type="button" onclick="sendIt();">
				<span>
				
				</span>
			</button>	
		</div>
		<div>
			<button class="add_button" type="button" onclick="sendIt();">
				<span>
					<b>ORDER</b><br>고객님꼐서 주문하신 상품의 주문내역을 확인하실 수 있습니다.
				</span>
			</button>	
			<button class="add_button" type="button" onclick="sendIt();">
				<span>

				</span>
			</button>	
		</div>
		<div>
			<button class="add_button" type="button" onclick="sendIt();">
				<span>
					<b>QnA</b><br>고객님께서 작성하신 질문을 관리하는 공간입니다.
						<!-- 고객님께서 작성하신 글을 한눈에 관리하실 수 있습니다. -->
				</span>
			</button>	
			<button class="add_button" type="button" onclick="sendIt();">
				<span>
				
				</span>
			</button>	
		</div>
		<div>
			<button class="add_button" type="button" onclick="sendIt();">
				<span>
					<b>PROFILE</b><br>회원이신 고객님의 개인정보를 관리하는 공간입니다.
						<!-- 개인정보를 최신정보로 유지하시면 보다 간편히 쇼핑을 즐기실수 있습니다. -->
				</span>
			</button>	
			<button class="add_button" type="button" onclick="sendIt();">
				<span>
					<b>MAIN</b>
				</span>
			</button>	
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>