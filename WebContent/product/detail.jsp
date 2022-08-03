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
			<div class="productMenu">
				<div class="productInfo">
					<div class="productName">
						<h2>ANDREW COTTON HALF SHIRT [WHITE]</h2>
					</div>
					<div class="productPrice">
						<h2>110,6000 KRW</h2>
					</div>
					<div class="productColor">
					</div>
					<div id="totalProduct">
					</div>
					<div id="totalPrice">
					</div>
					<div class="addList">
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


