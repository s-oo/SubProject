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
<title>Product detail</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/product/data/style.css"/>

</head>
<body>

<jsp:include page="../main/header.jsp"/>

<div id="content" align="center">
	<div class="detail_wrap">
		<div class="detail">
			<div class="productImage">
				<div>
					<img src="<%=cp %>/product/image/top/${dto.saveFileName1 }" width="600px" style="margin-bottom: 22px;"/>
					<img src="<%=cp %>/product/image/top/${dto.saveFileName2 }" width="600px" style="margin-bottom: 22px;"/>
					<img src="<%=cp %>/product/image/top/${dto.saveFileName3 }" width="600px" style="margin-bottom: 22px;"/>
					<img src="<%=cp %>/product/image/top/${dto.saveFileName4 }" width="600px" style="margin-bottom: 22px;"/>
					<img src="<%=cp %>/product/image/top/${dto.saveFileName5 }" width="600px" style="margin-bottom: 22px;"/>
				</div>
			</div>
			<div class="productMenu" align="center">
				<div class="productInfo">
					<div class="productName"><!-- 이름 -->
						<h2>${dto.productName }</h2>
					</div>
					<div class="productPrice"><!-- 가격 -->
						<h2>${dto.productPrice } KRW</h2>
					</div>
					<table border="0" class="option"><!-- 옵션 -->
						<tbody class="optionColor"><!-- 컬러 -->
							<tr>
								<td>
									<select name="option1" class="options">
										<option value="*" selected="selected">[필수] COLOR 선택</option>
										<option value="**" disabled="disabled">-------------------</option>
										<option value="WHITE">WHITE</option>
									</select>
								</td>
							</tr>
						</tbody>
						<tbody class="optionSize"><!-- 사이즈 -->
							<tr>
								<td>
								<select name="option2" class="options">
									<option value="*" selected="selected">[필수] SIZE 선택</option>
									<option value="**" disabled="disabled">-------------------</option>
									<option value="WHITE">SMALL</option>
									<option value="WHITE">MEDIUM</option>
									<option value="WHITE">LARGE</option>
								</select>
								</td>
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

					<div id="totalProduct" class=""><!-- 선택한 옵션 -->
						<table border="1" summary="">
							<caption>상품 목록</caption>
							<tbody class="displaynone">
								<tr>
									<td>ANDREW COTTON HALF SHIRT [WHITE]</td>
									<td>
										<span class="quantity">
										<input id="quantity" name="quantity_name" style="" value="0" type="text">
											<a href="#none">
											<img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif"
												alt="수량증가" class="QuantityUp up">
											</a>
											<a href="#none">
											<img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif"
												alt="수량감소" class="QuantityDown down">
											</a>
										</span>
									</td>
									<td class="right">
										<span class="quantity_price">158000</span>
										<span class="mileage displaynone">
										(<img src="">&nbsp;
										<span class="mileage_price"></span>)
										</span>
									</td>
								</tr>
							</tbody>
							
							<tbody class="option_products">
								<tr class="option_product " data-option-index="1" target-key="84">
									<td>
										<input type="hidden" class="option_box_id"
										id="option_box1_id" value="P00000DG000B" name="item_code[]" data-item-add-option=""
										data-item-reserved="N" data-option-id="000B" data-option-index="1">
										<p class="product">ANDREW COTTON HALF SHIRT [WHITE]<br> -
											<span>WHITE/LARGE</span>
										</p>
									</td>
									<td>
										<span class="quantity" style="width: 65px;">
										<input type="text" id="option_box1_quantity" name="quantity_opt[]"
											class="quantity_opt eProductQuantityClass" value="1" product-no="84">
											<a href="#none" class="up eProductQuantityUpClass" "=" "data-target="option_box1_up">
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
										<input type="hidden" class="option_box_price" value="158000"product-no="84" item_code="P00000DG000B">
										<span class="ec-front-product-item-price" code="P00000DG000B" product-no="84">110,600 KRW</span>
									</span>
											</td>
								</tr>
							</tbody>
							<tbody class="add_products"></tbody>
						</table>
					</div>
					
					<br/>

					<div id="totalPrice" class="totalPrice"><!-- 합계 금액 -->
						TOTAL :
						<span class="total">
							<strong><em>110,600 KRW</em></strong> (1개)
						</span>
					</div>
					
					<br/>

					<div class="addList"><!-- 장바구니 추가 -->
						<div class="ec-base-button gColumn">
		                    <a href="#none" class="add_button" onclick="product_submit(1, '/exec/front/order/basket/', this)" style="display:none;">
		                        <span id="btnBuy">BUY NOW</span>
		                        <span id="btnReserve" class="displaynone" style="display: none;">BACKORDER</span>
		                    </a>
		                    <a href="#none" class="add_button" onclick="product_submit(2, '/exec/front/order/basket/', this)">ADD TO BAG</a>
	                   		<span class="sold_btn displaynone">SOLD OUT</span>
	              		  </div>
					</div>
					
					
				</div>
				
			</div>
		</div>
		
		<div class="board">
			<div class="board_warp">
				<div class="productReview"">
					<h3><b>Review</b></h3>
					<div class="board_display">
						<p class="nodata">게시물이 없습니다</p><!-- 글 없는 경우 -->
						<div class="board_button">
							<a href="/board/product/write.html?board_no=6&amp;product_no=970&amp;cate_no=128&amp;display_group=1"
							class="btnSubmit pc">Write</a>&nbsp;&nbsp;&nbsp;
							<a href="/board/product/list.html?board_no=6&amp;link_product_no=970"
							class="btnEm pc">Total List</a>
						</div>
					</div>
				</div>
			</div>

			<div class="board_warp">
				<div class="productQnA">
					<h3><b>Q&amp;A</b></h3>
					<div class="board_display">
						<p class="nodata">게시물이 없습니다</p><!-- 글 없는 경우 -->
						<div class="board_button">
							<a href="/board/product/write.html?board_no=6&amp;product_no=970&amp;cate_no=128&amp;display_group=1"
							class="btnSubmit pc">Write</a>&nbsp;&nbsp;&nbsp;
							<a href="/board/product/list.html?board_no=6&amp;link_product_no=970"
							class="btnEm pc">Total List</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../main/footer.jsp"/>

</body>
</html>


