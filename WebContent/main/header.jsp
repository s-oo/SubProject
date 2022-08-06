<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<div id="header" class="txt">
	<div align="center">
		<a href="<%=cp %>/shop/main/main.do">
			<img src="<%=cp%>/main/img/mainlogo.png" width="150px;">
		</a>
	</div>
	<div id="header_bg"></div>
	<div class="cboth">
		<div class="left_area">
			<b>PRODUCT</b>
			<div id="cate_wrap" class="on">
				<div id="cate_inner"
					class="xans-element- xans-layout xans-layout-category">
					<a href="/sub/shop/product/list.do" class="xans-record-">ALL</a><br />
					<a href="/sub/shop/product/list.do?productCategory=outer" class="xans-record-">OUTER</a><br />
					<a href="/sub/shop/product/list.do?productCategory=top" class="xans-record-">TOP</a><br />
					<a href="/sub/shop/product/list.do?productCategory=pants" class="xans-record-">PANTS</a><br />
				</div>
			</div>
			<br /> <br />
			<b>BORAD</b>
			<div id="cate_wrap" class="on">
				<div id="cate_inner" class="xans-element- xans-layout xans-layout-category">
					<a href="/sub/shop/boards/list.do?community=QnA">Q/A</a><br />
					<a href="/sub/shop/boards/list.do?community=notice">NOTICE</a><br />
					<a href="/sub/shop/boards/list.do?community=review">REVIEW</a><br />
				</div>
			</div>
			<br /><br />
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
					<a href="/sub/shop/member/login.do" class="xans-element- xans-layout xans-layout-statelogoff ">LOGIN</a>&nbsp;&nbsp;
					<a href="/sub/shop/member/terms.do" class="xans-element- xans-layout xans-layout-statelogoff ">JOIN</a>&nbsp;&nbsp;
				</c:when>
				<c:when test="${!empty userId }">
					<a href="/sub/shop/member/myPage.do" class="xans-element- xans-layout xans-layout-statelogoff ">MYPAGE</a>&nbsp;&nbsp;
					<a href="/sub/shop/member/logout_ok.do" class="xans-element- xans-layout xans-layout-statelogoff ">LOGOUT</a>&nbsp;&nbsp;
					<a href="/sub/shop/orders/cartList.do" class="xans-element- xans-layout xans-layout-statelogoff ">BAG</a>
				</c:when>
			</c:choose>
		</div>
		<!-- //right_area -->
	</div>
	<!-- //lrmargin5 -->
</div>