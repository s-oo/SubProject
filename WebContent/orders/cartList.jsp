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

<link rel="stylesheet" type="text/css"href="<%=cp%>/css/shopStyle.css" />

</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	${dto.userId }
	<div id="content" align="center">
		<div id="contentList">
			<table class="listView">
				<tbody>
					<colgroup>
						<col>
						<col>
					</colgroup>
					<c:forEach var="dto" items="${list }">
						<tr>
							<td id="saveFileName">
								<img src="<%=cp %>/product/img/${dto.saveFileName }">
							</td>
							<td id="productName">
								${dto.productName }
							</td>
							<td id="productPrice">
								${dto.productPrice }
							</td>
							<td id="productQuantity">
								${dto.productQuantity }&nbsp;&nbsp;&nbsp;
								<a href="<%=cp%>/shop/orders/delete.do?orderNum=${dto.orderNum }&productQuantity=${dto.productQuantity + 1 }&progress=${dto.progress }">
									+</a>&nbsp;
								<a href="<%=cp%>/shop/orders/delete.do?orderNum=${dto.orderNum }&productQuantity=${dto.productQuantity + 1 }&progress=${dto.progress }">
									-</a>
							</td>
							<td id="totalProductPrice">
								${dto.productPrice * dto.productQuantity }
							</td>
							<td id="delete">
								<a href="<%=cp%>/shop/orders/delete.do?orderNum=${dto.orderNum }">X</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr id="listBox" class="item" style="list-style: none;width: 300px;display: inline-block;">
						<td class="box_wrap" style="display: inline-block;font-size: 10pt;color: #555555;">
							<c:if test="${empty list }">
										등록된 상품이 없음
							</c:if>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
	
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>