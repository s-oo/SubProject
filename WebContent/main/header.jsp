<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/shopStyle.css"/>
<script type="text/javascript" src="<%=cp%>/main/header.js"></script>

<div id="header" class="txt">
	<div align="center">
		<a href="<%=cp %>/shop/main/main.do">
			<img src="<%=cp%>/main/img/mainlogo.png" width="150px;">
		</a>
	</div>
	<div id="header_bg"></div>
	<div class="cboth">
		<div class="left_area">
			<div style="width: 60px;">
				<a style="cursor: pointer;" onclick="display1();" onmouseover="display1(); this.style.fontWeight='bold'" onmouseout="this.style.fontWeight=''">PRODUCT</a>
				<!-- <b>PRODUCT</b> -->
				<div id="display1" class="display">
					<div class="display_elements">
						<a href="/sub/shop/product/list.do">ALL</a><br/>
						<a href="/sub/shop/product/list.do?productCategory=outer">OUTER</a><br/>
						<a href="/sub/shop/product/list.do?productCategory=top">TOP</a><br/>
						<a href="/sub/shop/product/list.do?productCategory=bottom">BOTTOM</a><br/>
						<a href="/sub/shop/product/list.do?productCategory=dress">DRESS</a><br/>
						<a href="/sub/shop/product/list.do?productCategory=acc">ACC</a><br/>
					</div>
				</div>
			</div>
			<br/>
			<div style="width: 65px;">
				<a style="cursor: pointer;"onclick="display2();" onmouseover="display2(); this.style.fontWeight='bold'" onmouseout="this.style.fontWeight=''">BORAD</a><br/>
				<div id="display2" class="display">
					<div class="display_elements">
						<a href="/sub/shop/boards/notice.do" style="display: block;">NOTICE</a><br/>
						<a href="/sub/shop/boards/qna.do" style="display: block;">Q/A</a><br/>
						<a href="/sub/shop/boards/review.do" style="display: block;">REVIEW</a><br/>
					</div>
				</div>
			</div>
			<!-- <a href="#none" id="search_btn">SEARCH</a>
			<form id="searchBarForm" name="" action="/product/search.html"
				method="get" target="_self" enctype="multipart/form-data">
				<input id="banner_action" name="banner_action" value=""
					type="hidden">
				<div id="search_inner"
					class="xans-element- xans-layout xans-layout-searchheader ">
					$product_page=/product/detail.html
					$category_page=/product/list.html
					<fieldset>
						////보류////
						<legend>검색</legend>
						<label class="ePlaceholder" title=""> <input id="keyword"
							name="keyword" fw-filter="" fw-label="검색어" fw-msg=""
							class="inputTypeText" placeholder=""
							onmousedown="SEARCH_BANNER.clickSearchForm(this)" value=""
							type="text">
						</label>
					</fieldset>
				</div>
			</form> -->
		</div>
		<div class="right_area">
			<c:choose>
				<c:when test="${empty userId }">
					<a href="/sub/shop/member/login.do">LOGIN</a>&nbsp;&nbsp;
					<a href="/sub/shop/member/terms.do">JOIN</a>&nbsp;&nbsp;
				</c:when>
				<c:when test="${!empty userId }">
					<a href="/sub/shop/member/myPage.do">MYPAGE</a>&nbsp;&nbsp;
					<a href="/sub/shop/member/logout_ok.do">LOGOUT</a>&nbsp;&nbsp;
					<a href="/sub/shop/orders/cartList.do">BAG</a>
				</c:when>
			</c:choose>
		</div>
		<!-- //right_area -->
	</div>
	<!-- //lrmargin5 -->
</div>