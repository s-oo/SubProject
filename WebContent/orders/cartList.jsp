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

<script type="text/javascript">
	function sendItPayment() {
		var f = document.cartListForm;
		
		f.action = "<%=cp%>/shop/orders/orderPayment.do";
		f.submit();
	}
	
	
	
	function checkAll(){
		
		
		
		   if(document.getElementById("all").checked==true){  //id 를 사용하여 하나의 객체만을 호출
		         for(var i=0;i<orderNum.length;i++) document.getElementsByName("orderNum")[i].checked=true;   //name 을 사용하여 배열 형태로 담아 호출
		      }
		      if(document.getElementById("all").checked==false){
		         for(var i=0;i<orderNum.length;i++) document.getElementsByName("orderNum")[i].checked=false;  
		      }
		}
		
	
	/* function chkDel() {
		var chkObj = document.getElementsByName("orderNum");
		var chkDelStr = "";
		for (var i = 0; i < chkObj.length; i++) {
			var chkObjElement = chkObj[i];

			if (chkObjElement.checked) {
				chkDelStr = chkDelStr + chkObjElement.value + "/";
			}
		}

		if (chkDelStr == "") {

			alert("선택된 항목이 없습니다.");
			return false;
		}
	} */
</script>

</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content" align="center" style="display: block;">
		<form action="" method="post" name="cartListForm">
			<c:if test="${!empty list } ">
				<div style="padding-left: 80px;" align="left">
					<input type="checkbox" id="all" name="all" onclick="checkAll()" checked="checked">
					<a>전체선택/해제</a>
				</div>
			</c:if>
			<table id="cartList" style="border-top: 1px solid #DBDBDB; border-bottom: 1px solid #DBDBDB; padding: 20px 0px 20px 0px; margin-bottom: 50px;">
				<tbody>
					<c:set var="sum" value="0"/>
					<c:set var="tot" value="0"/>
					<c:forEach var="dto" items="${list }">
						<tr align="center">
							<td id="orderNum">
								<input type="checkbox" name="orderNum" value="${dto.orderNum }" checked="checked">
							</td>
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
								<a href="<%=cp%>/shop/orders/deleteOrder_ok.do?orderNum=${dto.orderNum }"
									onclick="if(!confirm('장바구니에서 삭제 하시겠습니까??')){return false;}">X</a>
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
								등록된 상품이 없음
							</td>
						</tr>
					</tfoot>
				</c:if>
			</table>
			<!-- 결제정보 -->
			<div id="right_area" style="display: inline-block; width: 300px; float: right; padding-right: 60px;">
				<div class="box row" style="width: 300px;" align="left" >
					<h3 style="margin: 0px;">결제정보</h3>
				</div>
				<div class="box row payment" align="right">
					<div style="width: 180px;">
						<div>PRICE</div><div>${sum }KRW</div><br/>
						<div>SHIPPNG</div><div>0KRW</div><br/>
						<div>TOTAL</div><div>${tot }KRW</div><br/>
					</div>
					<div style="float: right;">
						<div style="border: 1px solid; width: 90px; height: 50px; padding-top: 35px;" align="center">
							<a href="javascript:sendItPayment();">ORDER</a>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>