<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Product detail</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/product/data/style.css"/>
<script type="text/javascript" src="<%=cp%>/product/script.js"></script>

</head>
<body onload="initial()">

<jsp:include page="../main/header.jsp"/>

	<div id="content" align="center">
		<div class="detail_wrap">
			<div class="detail">
				<div class="productImage">
					<div>
						<c:forEach var="i" begin="0" end="${saveLength-1}" step="1">
							<img src="<%=cp %>/product/image/top/${dto.saveFileName[i] }"
							width="600px" style="margin-bottom: 22px;" />
						</c:forEach>
					</div>
				</div>
				<div class="productMenu" align="center">
					<div class="productInfo">
						<div class="productName">
							<h2>${dto.productName }</h2>
						</div>
						<div class="productPrice">
							<h2>${dto.productPrice }KRW</h2>
						</div>
						<table border="0" class="option" id="option">
							<tbody class="optionColor" id="optionColor">
								<tr>
									<td>
										<select name="option1" id="option1" class="options" onchange="select('case1')">
												<option value="*" id="initial1" selected="selected">[필수] COLOR 선택</option>
												<option value="**" disabled="disabled">-------------------</option>
												<c:forEach var="i" begin="0" end="${colorLength-1}" step="1">
													<option value="${dto.productColor[i] }">${dto.productColor[i] }</option>
												</c:forEach>
										</select>
									</td>
								</tr>
							</tbody>

							<tbody class="optionSize" id="optionSize">
								<tr>
									<td><select name="option2" id="option2" class="options" onchange="select('case2')">
											<option value="*" id="initial2" selected="selected">[필수] SIZE 선택</option>
											<option value="**" disabled="disabled">-------------------</option>
											<c:forEach var="i" begin="0" end="${sizeLength-1}" step="1">
												<option value="${dto.productSize[i] }">${dto.productSize[i] }</option>
											</c:forEach>
									</select></td>
								</tr>
							</tbody>
						</table>

						<div>
							<form name="form">
								<table class="totalProduct" border="1" summary="">
									<colgroup>
										<col style="width: 20%;">
										<col style="width: 20%;">
										<col style="width: 10%;">
									</colgroup>
									<thead>
									
									<tbody class="selectedOptions" id="selectedOptions">
										<tr id="selectedOption">
											<td><!-- option(color,size) -->
												<p class="product">
													${dto.productName }
												<span>
													<input type="text" id="selected1" name="selected1" class="selected1" readonly="readonly">
													<input type="text" id="selected2" name="selected2" class="selected1" readonly="readonly">
												</span>
												</p>
											</td>
											<td><!-- quantity -->
												<span>
													<input type=hidden name="price" value="${dto.productPrice }">
													<input type="text" name="amount" class="amount" value="1" size="3" >
													<a>
														<img src="//img.echosting.cafe24.com/design/skin/default/product/btn_count_up.gif"
														onclick='count("plus")'>
													</a>
													<a>
														<img src="//img.echosting.cafe24.com/design/skin/default/product/btn_count_down.gif"
														onclick='count("minus")'>
													</a>
													<a>
														<img src="//img.echosting.cafe24.com/design/skin/default/product/btn_price_delete.gif"
														onclick='count("delete")'>
													</a>
												</span>
											</td>
											<td>
												<span>
													<input type="text" name="sum" class="sum" size="10" readonly="readonly">
												</span>
											</td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>

						<!-- 합계 금액 -->
						<div id="totalPrice" class="totalPrice">
							TOTAL :
							<span class="total">
								<input type="text" id="totalSum" class="totalSum" value="0" size="10" readonly="readonly">
								<input type="text" id="totalAmount" class="totalAmount" value="1" size="3" readonly="readonly">
								
							</span>
						</div>

						<!-- 장바구니 추가 -->
						<div class="addList">
							<div class="ec-base-button gColumn">
								<a href="#none" class="add_button"
									onclick="product_submit(1, '/exec/front/order/basket/', this)"
									style="display: none;"> <span id="btnBuy">BUY NOW</span> <span
									id="btnReserve" class="displaynone" style="display: none;">BACKORDER</span>
								</a> <a href="#none" class="add_button"
									onclick="product_submit(2, '/exec/front/order/basket/', this)">ADD
									TO BAG</a> <span class="sold_btn displaynone">SOLD OUT</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			


			<!-- board -->
			<div class="board">
				<div class="board_wrap">
					<!-- Review -->
					<div class="boardTitle">
						<div class="titleName" style="float: left; font-size: 10pt;">Review</div>
						<div class="titleButton" style="float: right; text-align: right;">
							<a href="">Write</a> <a href="" style="margin-left: 15px">View
								all</a>
						</div>
					</div>

					<table class="boardContent">
						<colgroup>
							<col style="width: 5%;">
							<col style="width: 5%;">
							<col style="width: 10%;">
							<col style="width: 5%;">
							<col style="width: 5%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">NO</th>
								<th scope="col">PRODUCT</th>
								<th scope="col">SUBJECT</th>
								<th scope="col">NAME</th>
								<th scope="col">DATE</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="">
								<tr>
									<td colspan="5" class="empty">등록된 상품 후기가 없습니다.</td>
								</tr>
							</c:if>
							<tr style="margin: 10pt 0pt 10pt">
								<td>1</td>
								<!-- number -->
								<td>ANDREW COTTON SHIRT [SKY BLUE]</td>
								<!-- product -->
								<td>[기타]<!-- subject --> <a
									href="javascript:prdBoardView('review','311');"> <font
										onclick="rvQnaHit('review', '311');">보라돌이뚜비</font>
								</a> <img
									src="https://www.lememe.co.kr/_skin/lememe_220520/img/shop/i_new.gif"
									border="0" alt="최신">
								</td>
								<td>뚜비</td>
								<td>2022/08/04</td>
							</tr>
							<tr>
								<td colspan="5" class="qnarev_cnt">
									<div id="revContent311" style="display: block;">
										<div style="text-align: left; margin: 10pt 30pt 10pt;">
											<b>좋아요</b><br /> <b>ㅎㅎㅎ</b><br /> <b>!!!</b><br />
										</div>
										<div></div>
										<div></div>
										<div class="btn" align="right">
											<span class="box_btn w100 white"> <a
												href="javascript:editRev(311)">수정</a>
											</span> <span class="box_btn w100 white"> <a
												href="javascript:delRev(311)">삭제</a>
											</span>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					
					<!-- QnA -->
					<div class="boardTitle">
						<div class="titleName" style="float: left; font-size: 10pt;">Q&A</div>
						<div class="titleButton" style="float: right; text-align: right;">
							<a href="">Write</a> <a href="" style="margin-left: 15px">View
								all</a>
						</div>
					</div>

					<table class="boardContent">
						<colgroup>
							<col style="width: 5%;">
							<col style="width: 5%;">
							<col style="width: 10%;">
							<col style="width: 5%;">
							<col style="width: 5%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">NO</th>
								<th scope="col">PRODUCT</th>
								<th scope="col">SUBJECT</th>
								<th scope="col">NAME</th>
								<th scope="col">DATE</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="">
								<tr>
									<td colspan="5" class="empty">등록된 상품 후기가 없습니다.</td>
								</tr>
							</c:if>
							<tr style="margin: 10pt 0pt 10pt">
								<td>1</td>
								<!-- number -->
								<td>ANDREW COTTON SHIRT [SKY BLUE]</td>
								<!-- product -->
								<td>[기타]<!-- subject --> <a
									href="javascript:prdBoardView('review','311');"> <font
										onclick="rvQnaHit('review', '311');">질문있어요</font>
								</a> <img
									src="https://www.lememe.co.kr/_skin/lememe_220520/img/shop/i_new.gif"
									border="0" alt="최신">
								</td>
								<td>뚜비</td>
								<td>2022/08/04</td>
							</tr>
							<tr>
								<td colspan="5" class="qnarev_cnt">
									<div id="revContent311" style="display: block;">
										<div style="text-align: left; margin: 10pt 30pt 10pt;">
											<b>언제 배송되나요</b><br /> <b>ㅎㅎㅎ</b><br /> <b>???</b><br />
										</div>
										<div></div>
										<div></div>
										<div class="btn" align="right">
											<span class="box_btn w100 white"> <a
												href="javascript:editRev(311)">수정</a>
											</span> <span class="box_btn w100 white"> <a
												href="javascript:delRev(311)">삭제</a>
											</span>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
			</div>
	</div>
	
		
	</div>
</div>

	<jsp:include page="../main/footer.jsp"/>

</body>
</html>


