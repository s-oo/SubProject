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
	<div id="content" align="center">
		<div align="right">
			<form action="" method="post" name="cartListForm">
				<table id="cartList">
					<colgroup>
						<col width="10%"><col width="15%"><col width="15%"><col width="15%"><col width="15%"><col width="15%">
					</colgroup>
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
									<a href="<%=cp%>/shop/orders/modifyList_ok.do?orderNum=${dto.orderNum }&orderQuantity=${dto.orderQuantity + 1 }">
										+</a>&nbsp;
									<a href="<%=cp%>/shop/orders/modifyList_ok.do?orderNum=${dto.orderNum }&orderQuantity=${dto.orderQuantity - 1 }">
										-</a>
								</td>
								<td id="addOrder&delete">
									<a href="<%=cp%>/shop/orders/addOrder_ok.do?orderNum=${dto.orderNum }">추가</a>&nbsp;&nbsp;&nbsp;
									<a href="<%=cp%>/shop/orders/delete_ok.do?orderNum=${dto.orderNum }">X</a>
								</td>
							</tr>
							<c:set var="sum" value="${sum + dto.productPrice }"/>
							<c:set var="tot" value="${tot + dto.productPrice }"/>
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
				<div style="display: inline-block;">
					<div id="paymentBox" align="right">
						<div>PRICE</div><div>${sum }KRW</div><br/>
						<div>SHIPPNG</div><div>0KRW</div><br/>
						<div>TOTAL</div><div>${tot }KRW</div><br/>
					</div>
					<div style="float: right;">
						<div style="border: 1px solid; width: 80px; height: 50px; padding: 35px 5px 0px 5px;" align="center">
							<a href="<%=cp%>/shop/orders/orderList.do">ORDER</a>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>