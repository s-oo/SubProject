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

<div id="header" class="txt">
   <div id="header_bg"></div>
   <div class="cboth">
      <div class="left_area">
         <a href="#none" id="cate_btn" class="on"><b>PRODUCT</b></a>
         <div id="cate_wrap" class="on">
            <div id="cate_inner" class="xans-element- xans-layout xans-layout-category">
               <a href="/product/list.html?cate_no=44" class="xans-record-">ALL</a><br/>
               <a href="/product/list.html?cate_no=47" class="xans-record-">OUTER</a><br/>
               <a href="/product/list.html?cate_no=49" class="xans-record-">TOP</a><br/>
               <a href="/product/list.html?cate_no=50" class="xans-record-">PANTS</a><br/>
            </div>
         </div>
         <br/><br/>
         
         <a href="/shopinfo/company.html"><b>IDENTITY</b></a>
         <div id="cate_wrap" class="on">
            <div id="cate_inner" class="xans-element- xans-layout xans-layout-category">
            <a href="/contact.html?no=72&amp;board_no=2">NOTICE</a><br/>
            <a href="/contact.html?no=72&amp;board_no=2">CONTACT</a><br/>
            <a href="/board/consult/list.html?board_no=9">Q/A</a><br/>
            </div>
         </div>
         <br/><br/>
         
         <a href="#none" id="search_btn">SEARCH</a>
         <form id="searchBarForm" name="" action="/product/search.html"
            method="get" target="_self" enctype="multipart/form-data">
            <input id="banner_action" name="banner_action" value="" type="hidden">
            <div id="search_inner" class="xans-element- xans-layout xans-layout-searchheader ">
               <!-- $product_page=/product/detail.html $category_page=/product/list.html -->
               <!-- <fieldset>////보류////
                  <legend>검색</legend>
                  <label class="ePlaceholder" title="">
                     <input id="keyword" name="keyword" fw-filter="" fw-label="검색어" fw-msg=""
                     class="inputTypeText" placeholder=""
                     onmousedown="SEARCH_BANNER.clickSearchForm(this)" value="" type="text">
                  </label>
               </fieldset> -->
            </div>
         </form>
      </div>
      <div class="top_logo">
         <a href="/">
            <img src="<%=cp %>/main/data/kri.JPG" height="30x">
         </a>
      </div>
      
      <div class="right_area">
         <a href="/member/login.html" class="xans-element- xans-layout xans-layout-statelogoff ">LOGIN</a>&nbsp;&nbsp;
         <a href="/member/join.html" class="xans-element- xans-layout xans-layout-statelogoff ">JOIN</a>&nbsp;&nbsp;
         <a href="/order/basket.html" class="xans-element- xans-layout xans-layout-statelogoff ">BAG
            <span class="count displaynone">
               <span></span>
            </span>
         </a>
      </div>
      <!-- //right_area -->
   </div>
   <!-- //lrmargin5 -->
</div>



<div id="content" align="center">
	<div class="detail_wrap">
		<div class="detail">
			<div class="productImage">
				<img src="<%=cp %>/product/image/173bce5481474f6b91e2a2601ca8d394.jpg" width="600px"/><br/><br/>
				<img src="<%=cp %>/product/image/80a486b82e7f26dfd48632d43f9ea8e7.jpg" width="600px"/><br/><br/>
			</div>
			<div class="productMenu" align="center">
				<div class="productInfo">
					<div class="productName"><!-- 이름 -->
						<h2>ANDREW COTTON HALF SHIRT [WHITE]</h2>
					</div>
					<div class="productPrice"><!-- 가격 -->
						<h2>110,6000 KRW</h2>
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
							class="btnSubmit pc">Total Write</a>&nbsp;&nbsp;&nbsp;
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
							class="btnSubmit pc">Total Write</a>&nbsp;&nbsp;&nbsp;
							<a href="/board/product/list.html?board_no=6&amp;link_product_no=970"
							class="btnEm pc">Total List</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div id="footer">
   <div class="xans-element- xans-layout xans-layout-footer cboth bt_backbg ">
      <div class="bt_shopinfo2">
         <span>EMAIL: GOOAOFFICIAL@NAVER.COM</span><br>
         <span>CUSTOMER SERVICES: 070-7954-3714</span><br>
         <span>ADDRESS: 21 DASANJUNGANG-RO 19 GIL NAMYANGJU-SI<br>
         GYEONGGI-DO REPUBLIC OF KOREA
         </span>
      </div>
      <div class="bt_shopinfo">
         <span>COMPANY: GOOA</span><br>
         <span>OWNER: HEE SU LEE</span>
         <span> REGISTRATION: 898-38-00550</span><br>
         <span>MAIL ORDER LICENSE: 2021-DASAN-0629</span><br>
         <span>BANK ACCOUNT: SHINHAN 110-526-775262 GOOA</span>
      </div>
      <div class="bt_cs">
         <a href="/shopinfo/company.html"> </a><br>
         <a href="/member/agreement.html"> </a><br>
         <a href="/member/privacy.html"> </a>
      </div>
      <!-- div class="bt_cs">OPENING HOURS<br/>
         MON - FRI 13:00 ~ 17:00<br/>
         WEEKEND/HOLIDAY OFF</div -->
   </div>
   <!-- //bt_backbg -->
</div>

</body>
</html>


