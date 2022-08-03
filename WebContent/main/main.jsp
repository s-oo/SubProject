<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main Page</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/main/css/stylemain.css"/>

</head>
<body background="">
						<div>
<img src="<%=cp%>/main/img/사진.jpg" width="700px;" height="700px;">
</div>
<div id="header" class="txt">
	<div id="header_bg"></div>
	<div class="cboth">
		<div class="left_area">
			<b>PRODUCT</b>
			<div id="cate_wrap" class="on">
				<div id="cate_inner" class="xans-element- xans-layout xans-layout-category">
					<a href="/sup/shop/product/list.do" class="xans-record-">ALL</a><br/>
					<a href="/sup/shop/product/list.do?productCategory=outer" class="xans-record-">OUTER</a><br/>
					<a href="/sup/shop/product/list.do?productCategory=top" class="xans-record-">TOP</a><br/>
					<a href="/sup/shop/product/list.do?productCategory=pants" class="xans-record-">PANTS</a><br/>
				</div>
			</div>
			<br/><br/>
			
			<b>borad</b>
			<div id="cate_wrap" class="on">
				<div id="cate_inner" class="xans-element- xans-layout xans-layout-category">
				
				<a href="/sub/shop/boards/list.do?community=QnA">Q/A</a><br/>
				<a href="/sub/shop/boards/list.do?community=notice">NOTICE</a><br/>
				<a href="//sub/shop/boards/list.do?community=review">REVIEW</a><br/>
				
				</div>
			</div>
			<br/><br/>
			
			<!-- <a href="#none" id="search_btn">SEARCH</a>
			<form id="searchBarForm" name="" action="/product/search.html"
				method="get" target="_self" enctype="multipart/form-data">
				<input id="banner_action" name="banner_action" value="" type="hidden">
				<div id="search_inner" class="xans-element- xans-layout xans-layout-searchheader ">
					$product_page=/product/detail.html $category_page=/product/list.html
					<fieldset>////보류////
						<legend>검색</legend>
						<label class="ePlaceholder" title="">
							<input id="keyword" name="keyword" fw-filter="" fw-label="검색어" fw-msg=""
							class="inputTypeText" placeholder=""
							onmousedown="SEARCH_BANNER.clickSearchForm(this)" value="" type="text">
						</label>
					</fieldset>
				</div>
			</form> -->
			
			
		</div>
		

	
		
		<div class="right_area">
			<c:choose>
				<c:when test="${empty userId }">
					<a href="/sub/shop/member/login.do" class="xans-element- xans-layout xans-layout-statelogoff ">LOGIN</a>&nbsp;&nbsp;
					<a href="/sub/shop/member/join.do" class="xans-element- xans-layout xans-layout-statelogoff ">JOIN</a>&nbsp;&nbsp;
				</c:when>
				<c:when test="${!empty userId }">
					<a href="/sub/shop/member/mypage.do" class="xans-element- xans-layout xans-layout-statelogoff ">MYPAGE</a>&nbsp;&nbsp;
					<a href="/sub/shop/member/logout_ok.do" class="xans-element- xans-layout xans-layout-statelogoff ">LOGOUT</a>&nbsp;&nbsp;
					<a href="/sub/shop/orders/cartList.do" class="xans-element- xans-layout xans-layout-statelogoff ">BAG</a>
				</c:when>
			</c:choose>
			
				<!-- <span class="count displaynone">
					<span></span>
				</span> -->
		
		</div>
		<!-- //right_area -->
	</div>
	<!-- //lrmargin5 -->
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