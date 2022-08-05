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
<link rel="stylesheet" type="text/css"href="<%=cp%>/orders/css/cartListStyle.css" />

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
    function sendItPayment_ok() {
		var f = document.paymentForm;
		
		f.action = "<%=cp%>/shop/orders/orderPayment_ok.do";
		f.submit();
	}
</script>

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
									<input type="hidden" name="orderNum" value="${dto.orderNum }"/>
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
				
				<div id="left_area" style="display: inline-block;" >
					<div id="info_area" style="width: 500px;" align="left">
						<div class="box row">
							<div class="box label">
								<label for="userName"><span>NAME</span></label>
							</div>
							<div class="box text" align="left">
								${memberDTO.userName }
							</div>
							<div style="display: inline-block; border: 1px solid; width: 80px; height: 20px; padding-top: 5px; float: right;" align="center">
								<a href="<%=cp%>/shop/member/update.do">정보수정</a>
							</div>
						</div>
						<div class="box row" style="height: 110px;">
							<div class="box label" style="height: 80px;">
								<label for="userAddress"><span>ADDRESS</span></label>
							</div>
							<div class="box text" style="padding: 0px;" align="left">
								<div class="box text" style="padding: 5px 10px 5px 10px;">
									${memberDTO.address1 }
								</div>
								<div class="box text" style="padding: 5px 10px 5px 10px;">
									${memberDTO.address2 }
								</div>
								<div class="box text" style="padding: 5px 10px 5px 10px;">
									${memberDTO.address3 }
								</div>
								<div class="box text" style="padding: 5px 10px 5px 10px;">
									${memberDTO.address4 }
								</div>
							</div>
						</div>
						<div class="box row">
							<div class="box label">
								<label for="userTel"><span>TEL</span></label>
							</div>
							<div class="box text">
								${memberDTO.userTel }
							</div>
						</div>
						<div class="box row">
							<div class="box label">
								<label for="userEmail"><span>E-MAIL</span></label>
							</div>
							<div class="box text">
								${memberDTO.userEmail }
							</div>
						</div>
					</div>
				</div>
				
				<div  id="right_area" style="display: inline-block; padding-right: 30px; float:  right;">
					<div id="paymentBox" align="right">
						<div>PRICE</div><div>${sum }KRW</div><br/>
						<div>SHIPPNG</div><div>0KRW</div><br/>
						<div>TOTAL</div><div>${tot }KRW</div><br/>
						<input type="hidden" name="tot" value="${tot }"/>
					</div>
					<div style="float: right;">
						<div style="border: 1px solid; width: 90px; height: 50px; padding-top: 35px;" align="center">
							<a href="javascript:sendItPayment_ok();">ORDER</a>
						</div>
					</div>
				</div>
				
			</form>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>