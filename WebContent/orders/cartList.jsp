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
<title>cart list</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/product/data/style.css"/>

</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	
	<div id="content" align="center" style="margin-top: 100px;">
		<div id="contentList">
			<ul class="listView">
				<li>
					
				</li>
				<c:forEach var="dto" items="${list }">
					<li id="listBox" class="item" style="list-style: none; width: 300px; pading: 10em;">
						<span class="box_wrap" style="display: inline-block; font-size: 10pt; color: #555555;">
							${dto.orderNum }
						</span>
						<span class="box_wrap" style="display: inline-block; font-size: 10pt; color: #555555;">
							${dto.userId }
						</span>
						<span class="box_wrap" style="display: inline-block; font-size: 10pt; color: #555555;">
							${dto.productNum }
						</span>
						<span class="box_wrap" style="display: inline-block; font-size: 10pt; color: #555555;">
							${dto.productName }
						</span>
						<span class="box_wrap" style="display: inline-block; font-size: 10pt; color: #555555;">
							${dto.productQuantity }
						</span>
						<span class="box_wrap" style="display: inline-block; font-size: 10pt; color: #555555;">
							${dto.productPrice }
						</span>
					</li>
				</c:forEach>
				
				<c:if test="${empty list }">
					<li id="listBox" class="item" style="list-style: none;width: 300px;display: inline-block;">
						<div class="box_wrap" style="display: inline-block;font-size: 10pt;color: #555555;">
							등록된 상품이 없음
						</div>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
	
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>