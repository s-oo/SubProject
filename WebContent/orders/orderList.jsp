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
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content" align="center">
		<div>
			<form action="" method="post" name="paymentForm">
			
				<table id="cartList" style="margin-bottom: 50px;">
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
									${dto.orderQuantity }
								</td>
								<td id="totalProductPrice">
									${dto.productPrice * dto.orderQuantity }KRW
								</td>
							</tr>
							<c:set var="sum" value="${sum + dto.productPrice }"/>
							<c:set var="tot" value="${tot + dto.productPrice }"/>
						</c:forEach>
					</tbody>
					<c:if test="${empty list }">
						<tfoot>
							<tr id="listBox" class="item" style="list-style: none;width: 300px;display: inline-block;">
								<td class="box_wrap" style="display: inline-block;font-size: 10pt;color: #555555;">
										등록된 상품이 없음
								</td>
							</tr>
						</tfoot>
					</c:if>
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>