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
<title>wish list</title>

<link rel="stylesheet" type="text/css"href="<%=cp%>/css/shopStyle.css" />
<link rel="stylesheet" type="text/css"href="<%=cp%>/orders/css/cartListStyle.css" />

</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content" align="center" style="display: block;">
		<form action="" method="post" name="cartListForm">
			<table id="cartList" style="border-top: 1px solid #DBDBDB; border-bottom: 1px solid #DBDBDB; padding: 20px 0px 20px 0px; margin-bottom: 50px;">
				<tbody>
					<c:set var="sum" value="0"/>
					<c:set var="tot" value="0"/>
					<c:forEach var="dto" items="${list }">
						<tr align="center">
							<td id="saveFileName">
								<a href="<%=cp %>/shop/product/detail.do?productNum=${dto.productNum }">
									<img src="<%=cp %>/product/image/${dto.productCategory }/${dto.saveFileName[0] }" height="100px;">
								</a>
							</td>
							<td id="productName">
								<a href="<%=cp %>/shop/product/detail.do?productNum=${dto.productNum }">
									${dto.productName }
								</a><br/>
								<span class="productOption">[옵션 : ${dto.orderColor }/${dto.orderSize }]</span>
							</td>
							<td id="productPrice">
								<span style="text-decoration: line-through;">${dto.productPrice }KRW</span><br/>
								<span>${dto.productPrice }KRW</span>
							</td>
							<td id="productQuantity">
								${dto.orderQuantity }&nbsp;&nbsp;&nbsp;
								<a href="<%=cp%>/shop/orders/changeOrder_ok.do?orderNum=${dto.orderNum }&orderQuantity=${dto.orderQuantity + 1 }">
									+</a>&nbsp;
								<a href="<%=cp%>/shop/orders/changeOrder_ok.do?orderNum=${dto.orderNum }&orderQuantity=${dto.orderQuantity - 1 }">
									-</a>
							</td>
							<td id="totalProductPrice">
								${dto.productPrice * dto.orderQuantity }KRW
							</td>
							<td id="delete">
							<a href="<%=cp%>/shop/orders/changeOrder_ok.do?orderNum=${dto.orderNum }&progress=cartList">추가</a>&nbsp;&nbsp;&nbsp;
								<a href="<%=cp%>/shop/orders/deleteOrder_ok.do?orderNum=${dto.orderNum }"
									onclick="if(!confirm('찜리스트에서 삭제 하시겠습니까??')){return false;}">X</a>
							</td>
						</tr>
						<c:set var="sum" value="${sum + dto.productPrice * dto.orderQuantity }"/>
						<c:set var="tot" value="${tot + dto.productPrice * dto.orderQuantity }"/>
					</c:forEach>
				</tbody>
				<c:if test="${empty list }">
					<tfoot>
						<tr align="center">
							<td style="font-size: 10pt;color: #555555;">
								찜한 상품이 없습니다.
							</td>
						</tr>
					</tfoot>
				</c:if>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>