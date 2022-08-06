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
			<form action="<%=cp%>/shop/orders/orderPayment_ok.do" method="post" name="paymentForm">
				<div>
					
				
				
				</div>

				<!-- 배송정보 -->
				<div id="left_area" style="display: inline-block;" >
					<div id="info_area" style="width: 500px;" align="left">
						<div class="box row">
							<h3 style="margin: 0px;">배송정보</h3>
						</div>
						<div class="box row">
							<div class="box label">
								<label for="deliveryName"><span>NAME</span></label>
							</div>
							<div class="box input" align="left">
								<input type="text" name="deliveryName" value="${memberDTO.userName }"/>
							</div>
						</div>
						<div class="box row" style="height: 120px;">
							<div class="box label" style="height: 80px;">
								<label for="deliveryAddr"><span>ADDRESS</span></label>
							</div>
							<div class="box input" style="padding: 0px;" align="left">
								<div class="box input" style="padding: 5px 10px 5px 10px;">
									<input type="text" name="deliveryAddr" class="input-2" value="${memberDTO.userAddr[0] }"/>
									<input type="button" onclick="sample6_execDaumPostcode()" class="input-2 button" value="우편번호">
								</div>
								<div class="box input" style="padding: 5px 10px 5px 10px;">
									<input type="text" name="deliveryAddr" value="${memberDTO.userAddr[1] }"/>
								</div>
								<div class="box input" style="padding: 5px 10px 5px 10px;">
									<input type="text" name="deliveryAddr" value="${memberDTO.userAddr[2] }"/>
								</div>
								<div class="box input" style="padding: 5px 10px 5px 10px;">
									<input type="text" name="deliveryAddr" value="${memberDTO.userAddr[3] }"/>
								</div>
							</div>
						</div>
						<div class="box row">
							<div class="box label">
								<label for="deliveryTel"><span>TEL</span></label>
							</div>
							<div class="box input">
								<input type="text" name="deliveryTel" value="${memberDTO.userTel }"/>
							</div>
						</div>
						<div class="box row">
							<div class="box label">
								<label for="deliveryEmail"><span>E-MAIL</span></label>
							</div>
							<div class="box input">
								<input type="text" name="deliveryEmail" value="${memberDTO.userEmail }"/>
							</div>
						</div>
					</div>
				</div>

				<!-- 결제정보 -->
				<div  id="right_area" style="display: inline-block; padding-right: 30px; float:  right;">
					<div class="box row" style="width: 250px;" align="left">
						<h3 style="margin: 0px;">결재정보</h3>
					</div>
					<div style="margin-top: 20px;">
						<div id="paymentBox" align="right">
							<div>PRICE</div><div>${sum }KRW</div><br/>
							<div>SHIPPNG</div><div>0KRW</div><br/>
							<div>TOTAL</div><div>${tot }KRW</div><br/>
							<input type="hidden" name="totalPrice" value="${tot }"/>
						</div>
						<div style="float: right;">
							<div style="border: 1px solid; width: 90px; height: 50px; padding-top: 35px;" align="center">
								<a href="javascript:sendItPayment_ok();">ORDER</a>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>