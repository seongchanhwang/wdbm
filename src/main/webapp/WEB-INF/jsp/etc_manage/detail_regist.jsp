<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- spring:message="메시지 키값" -->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>WORLD 물류관리 시스템</title>
	<link rel="stylesheet" href="../../css/base.css">
	<script src="../../js/jquery-1.9.1.min.js"></script>
	<script src="../../js/uikit.min.js"></script>
	<script src="../../js/layout.js"></script>
	<script src="../../../js/etc/product.js"></script>
	<script defer src="../../js/script.js"></script>
</head>

<body>
	<div id="wrap">
		<!-- header -->
		<header id="header">
			<h1>
				<a href="#">
					<img src="../../images/logo.png" alt="월드비엠 물류관리 시스템">
					<span>WORLD 물류관리 시스템</span>
				</a>
			</h1>
			<div class="profile-wrap">
				<div class="info">
					<a href="#">홍길동</a>
					<p>회사명</p>
				</div>
				<a href="#" class="logout">로그아웃</a>
				<div class="d-flex">
					<button class="mem-edit" onclick="location.href='003_privacy_info.html'">개인정보</button>
					<button class="alarm-list">알림 목록</button>
				</div>
			</div>
			<!-- s:aside -->
			<nav id="aside">
				<ul class="uk-nav-default uk-nav-parent-icon uk-nav member" uk-nav="">
					<li><a href="210_dashboard.html">대시보드</a></li>
					<li class="uk-parent">
						<a href="220_order_manage.html">주문관리 </a>
						<ul class="uk-nav-sub" hidden="">
							<li><a href="#">- 주문현황</a></li>
							<li><a href="#">- 직송현황</a></li>
							<li><a href="#">- 예약내역</a></li>
						</ul>
					</li>
					<li class="uk-parent">
						<a href="230_warehouse_manage.html">입고관리 </a>
						<ul class="uk-nav-sub" hidden="">
							<li><a href="#">- 오더하기</a></li>
							<li><a href="#">- 오더내역</a></li>
							<li><a href="#">- 선적현황</a></li>
							<li><a href="#">- 통관현황</a></li>
							<li><a href="#">- CY현황</a></li>
							<li><a href="#">- 입고현황</a></li>
							<li><a href="#">- 컨테이너 반납현황</a></li>
						</ul>
					</li>
					<li class="uk-parent uk-open">
						<a href="240_etc_manage.html">기타관리</a>
						<ul class="uk-nav-sub" hidden="">
							<li><a href="240_etc_manage.html">- 준공서류 관리</a></li>
							<li><a href="241_all_warehouse.html">- 전체 출/입고 현황</a></li>
							<li><a onclick="location.href='warehouseManage.do'">- 창고관리</a></li>		
							<li><a onclick="location.href='goInvetoryManage.do'">- 창고별 재고관리</a></li>
							<li><a onclick="location.href='goInventoryStatus.do'">- 창고별 재고현황</a></li>
							<li><a onclick="location.href='safetyManage.do'">- 안전 재고 관리</a></li>
							<li class="uk-open"><a onclick="location.href='productRegists.do'">- 제품 등록 관리</a></li>
							<li><a onclick="location.href='creditList.do'">- 여신 관리</a></li>
							<li><a onclick="location.href='inquiryList.do'">- 신규가입문의</a></li>
						</ul>
					</li>
					<li ><a onclick="location.href='memberList.do'">회원관리 </a></li>
				</ul>
			</nav>
			<!-- e:aside -->
		</header>

		<!-- s:container -->
		<div id="container">
			<h2 class="normal">제품 등록 관리</h2>
            <ul class="tmenu">
                <li><a onclick="location.href='productRegists.do'">제품명 등록관리</a></li>
                <li><a onclick="location.href='productThickness.do'">제품 두께 등록관리</a></li>
                <li><a onclick="location.href='productSize.do'">제품 사이즈 등록관리</a></li>
                <li class="on"><a onclick="location.href='productDetail.do'">제품별 상세설정</a></li>
            </ul>
            <form method="post" action="addProductDetail.do" id="detailForm" enctype="multipart/form-data">             
			<div id="content">
				<!-- view -->
				<div class="cont-box pt19">
					<div class="h3-title blue">
						<h3 class="normal"><i class="s-add"></i>제품 상세 설정</h3>
					</div>

                    <c:if test="${empty info}">                
					<article class="inner-1">
                        <dl class="row col-2">
                            <dt>제품명 <i class="essen"> *</i></dt>
                            <dd>
								<select name="productNm" id="productNm" class="wd210p" onchange=detailNmChange()>
									<option value="">--선택--</option>
									<c:forEach items="${productList}" var="list" varStatus="status">
									<option value="${list.productNm}">${list.productNm}</option>
									</c:forEach>
								</select>
							</dd>
                        </dl>
                        <dl class="row col-2">
                            <dt>제품 두께 <i class="essen"> *</i></dt>
                            <dd>
                                <select name="thickness" id="thickness" class="wd210p" >
									<option value="">--선택--</option>
								</select> T
                            </dd>
                        </dl>
                        <dl class="row col-2">
                            <dt>제품 사이즈 <i class="essen"> *</i></dt>
                            <dd>
                                <select name="size" id="size" class="wd210p">
									<option value="">--선택--</option>
								</select>
                            </dd>
                        </dl>
                        <dl class="row col-2">
                            <dt>길이 x 폭 <i class="essen"> *</i></dt>
                            <dd>
                                <input type="text" class="wd80p" name="height">
                                <span>×</span>
                                <input type="text" class="wd80p" name="width">
                            </dd>
                        </dl>
                        <dl class="row col-2">
                            <dt>안전재고 수량</dt>
                            <dd><input type="text" class="wd210p" name="safety"></dd>
                        </dl>
                        <dl class="row col-2">
                            <dt>파렛당 장수 </dt>
                            <dd><input type="text" class="wd210p" name="pallet"></dd>
                        </dl>
                        <dl class="row col-2">
                            <dt>컨테이너당 장수</dt>
                            <dd><input type="text" class="wd210p" name="slice"></dd>
                        </dl>
                    </article>
                    </c:if>

                    <c:if test="${!empty info}">
                    <c:forEach items="${info}" var="info" varStatus="status">                   
					<article class="inner-1">
						<input type="hidden" id="update" value="update">
						<input type="hidden" id="pagename" value="detail">
						<input type="hidden" class="wd210p" name="productIdx" value="${info.productIdx}">
						<input type="hidden" id="origThickness" value="${info.thickness}">
						<input type="hidden" id="origSize" value="${info.size}">
						
						<input type="hidden" class="wd210p" name="productIdx" value="${info.productIdx}">
																	
                        <dl class="row col-2">
                            <dt>제품명 <i class="essen"> *</i></dt>
                            <dd>
								<select name="productNm" id="productNm" class="wd210p" onchange=detailNmChange()>
									<option value="">--선택--</option>
									<c:forEach items="${productList}" var="list" varStatus="status">
									<option value="${list.productNm}" <c:if test="${info.productNm == list.productNm}"> selected
									</c:if>>${list.productNm}</option>
									</c:forEach>
								</select>
							</dd>
                        </dl>
                        <dl class="row col-2">
                            <dt>제품 두께 <i class="essen"> *</i></dt>
                            <dd>
                                <select name="thickness" id="thickness" class="wd210p" >
									<option value="">--선택--</option>
								</select> T
                            </dd>
                        </dl>
                        <dl class="row col-2">
                            <dt>제품 사이즈 <i class="essen"> *</i></dt>
                            <dd>
                                <select name="size" id="size" class="wd210p">
									<option value="">--선택--</option>
								</select>
                            </dd>
                        </dl>
                        <dl class="row col-2">
                            <dt>길이 x 폭 <i class="essen"> *</i></dt>
                            <dd>
                                <input type="text" class="wd80p" name="height" value="${info.height}">
                                <span>×</span>
                                <input type="text" class="wd80p" name="width" value="${info.width}">
                            </dd>
                        </dl>
                        <dl class="row col-2">
                            <dt>안전재고 수량</dt>
                            <dd><input type="text" class="wd210p" name="safety" value="${info.safety}"></dd>
                        </dl>
                        <dl class="row col-2">
                            <dt>파렛당 장수 </dt>
                            <dd><input type="text" class="wd210p" name="pallet" value="${info.pallet}"></dd>
                        </dl>
                        <dl class="row col-2">
                            <dt>컨테이너당 장수</dt>
                            <dd><input type="text" class="wd210p" name="slice" value="${info.slice}"></dd>
                        </dl>
                    </article>
                    </c:forEach>
                    </c:if>

					<div class="dl-buttons">
						<button class="btn bg_color3 small wd120p" type="button">취소</button>
						<button class="btn bg_color1 small wd120p" type="submit">등록</button>
					</div>
				</div>
			</div>
			</form>
		</div>
		<!-- s:container -->
	</div>
</body>
</html>