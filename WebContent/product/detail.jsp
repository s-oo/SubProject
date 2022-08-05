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
<body>

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
							<!-- 이름 -->
							<h2>${dto.productName }</h2>
						</div>
						<div class="productPrice">
							<!-- 가격 -->
							<h2>${dto.productPrice }KRW</h2>
						</div>
						<table border="0" class="option">
							<!-- 옵션 -->
							<tbody class="optionColor">
								<!-- 컬러 -->
								<tr>
									<td><select name="option1" class="options" onchange="select('case1')">
											<option value="*" selected="selected">[필수] COLOR 선택</option>
											<option value="**" disabled="disabled">-------------------</option>
											<c:forEach var="i" begin="0" end="${colorLength-1}" step="1">
												<option value="case1">${dto.productColor[i] }</option>
											</c:forEach>
									</select></td>
								</tr>
							</tbody>

							<tbody class="optionSize" id="optionSize">
								<!-- 사이즈 -->
								<tr>
									<td><select name="option2" class="options" onchange="select('case2')">
											<option value="*" selected="selected">[필수] SIZE 선택</option>
											<option value="**" disabled="disabled">-------------------</option>
											<c:forEach var="i" begin="0" end="${sizeLength-1}" step="1">
												<option value="case2">${dto.productSize[i] }</option>
											</c:forEach>
									</select></td>
								</tr>
							</tbody>
							<tbody>
								<tr class="displaynone" id="">
									<td colspan="2" class="selectButton">
										<a href="#none" class="btnSubmit sizeS" onclick="">옵션선택</a>
									</td>
								</tr>
							</tbody>
						</table>


						<div id="totalProduct" class="">
							<!-- 선택한 옵션 -->
							<table class="totalProduct" border="1" summary="">
								<colgroup>
									<col style="width: 284px;">
									<col style="width: 80px;">
									<col style="width: 110px;">
								</colgroup>
								<tbody class="displaynone">
									<tr>
										<td>${dto.productName }</td>
										<td>
											<span class="quantity">
												<input id="quantity" name="quantity_name" style="" value="0" type="text">
												<a href="#none">
													<img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif"
													alt="수량증가" class="QuantityUp">
												</a>
												<a href="#none">
													<img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif"
													alt="수량감소" class="QuantityDown">
												</a>
											</span>
										</td>
										<td class="right">
											<span class="quantity_price">${dto.productPrice }</span>
												<span class="mileage displaynone">
												(<img src="">&nbsp;<span class="mileage_price"></span>)
											</span>
										</td>
									</tr>
								</tbody>
								
								<tbody class="selectedOptions" id="selectedOptions">
									<tr class="selectedOption " data-option-index="1" target-key="84">
										<td>
											<input type="hidden" class="option_box_id" id="option_box1_id"
											value="P00000DG000B" name="item_code[]" data-item-add-option=""
											data-item-reserved="N" data-option-id="000B" data-option-index="1">
											<p class="product">
												${dto.productName }<br> - <span>color/size</span>
											</p>
										</td>
										<td>
											<span class="quantity" style="width: 65px;">
												<input type="text" id="option_box1_quantity" name="quantity_opt[]"
												class="quantity_opt eProductQuantityClass" value="1" product-no="84">
													<a href="#none" class="up eProductQuantityUpClass" "="" data-target="option_box1_up">
														<img src="//img.echosting.cafe24.com/design/skin/default/product/btn_count_up.gif"
														id="option_box1_up" class="option_box_up" alt="수량증가">
													</a>
													<a href="#none" class="down eProductQuantityDownClass" data-target="option_box1_down">
														<img src="//img.echosting.cafe24.com/design/skin/default/product/btn_count_down.gif"
														id="option_box1_down" class="option_box_down" alt="수량감소">
													</a>
											</span>
											<a href="#none" class="delete">
												<img src="//img.echosting.cafe24.com/design/skin/default/product/btn_price_delete.gif"
												alt="삭제" id="option_box1_del" class="option_box_del">
											</a>
										</td>
										<td class="right">
											<span id="option_box1_price">
												<input type="hidden" class="option_box_price" value="158000"
												product-no="84" item_code="P00000DG000B">
												<span class="ec-front-product-item-price" code="P00000DG000B"
												product-no="84">${dto.productPrice } KRW
												</span>
											</span>
										</td>
									</tr>
								</tbody>
								<tbody class="add_products"></tbody>
							</table>
						</div>

						<!-- 합계 금액 -->
						<div id="totalPrice" class="totalPrice">
							TOTAL :
							<span class="total">
								<strong>
									<!-- if 선택되지 않으면 -->
									<em>0</em>
									<!-- if 선택되면, 개수*금액 -->
									<em>110,600 KRW</em>
								</strong>
								<!-- if 선택되면, 개수 -->
								(1개)
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


