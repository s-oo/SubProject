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
<link rel="stylesheet" type="text/css"href="<%=cp%>/orders/css/cartListStyle.css" />

</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content" align="center">
	<select>
	</select>
		<table id="cartList">
			<colgroup>
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
			</colgroup>
			<tbody>
				<c:forEach var="dto" items="${list }">
					<tr align="center">
						<td id="saveFileName">
							<a href="<%=cp %>/shop/product/detail.do?productNum=${dto.productNum }">
								<img src="<%=cp %>/product/image/${dto.productCategory }/${dto.saveFileName1 }" height="100px;">
							</a>
						</td>
						<td id="productName">
							<a href="<%=cp %>/shop/product/detail.do?productNum=${dto.productNum }">
								${dto.productName }
							</a><br/>
							<%-- <span class="productOption">[옵션 : ${dto.productColor }/${dto.productSize }]</span> --%>
						</td>
						<td id="productPrice">
							${dto.productPrice }KRW
						</td>
						<td id="productQuantity">
							${dto.productQuantity }&nbsp;&nbsp;&nbsp;
							<a href="<%=cp%>/shop/orders/modifyList_ok.do?orderNum=${dto.orderNum }&productQuantity=${dto.productQuantity + 1 }&progress=${dto.progress }">
								+</a>&nbsp;
							<a href="<%=cp%>/shop/orders/modifyList_ok.do?orderNum=${dto.orderNum }&productQuantity=${dto.productQuantity - 1 }&progress=${dto.progress }">
								-</a>
						</td>
						<td id="totalProductPrice">
							${dto.productPrice * dto.productQuantity }KRW
						</td>
						<td id="delete">
							<a href="<%=cp%>/shop/orders/delete_ok.do?orderNum=${dto.orderNum }">X</a>
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
	
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>