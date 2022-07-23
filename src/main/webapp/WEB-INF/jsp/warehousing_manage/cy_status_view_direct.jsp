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
	<script src="../../../js/warehousing/order.js"></script>
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
					<li><a onclick="location.href='goDashboard.do'">대시보드</a></li>
					<li class="uk-parent">
						<a href="220_order_manage.html">주문관리 </a>
						<ul class="uk-nav-sub" hidden="">
							<li><a href="#">- 주문현황</a></li>
							<li><a href="#">- 직송현황</a></li>
							<li><a href="#">- 예약내역</a></li>
						</ul>
					</li>

					<li class="uk-parent uk-open">
						<a href="230_warehouse_manage.html">입고관리 </a>
						<ul class="uk-nav-sub" hidden="">
							<li  class="uk-open"><a onclick="location.href='manageOrder.do'">- 오더하기</a></li>
							<li><a onclick="location.href='orderlist.do'">- 오더내역</a></li>
							<li><a onclick="location.href=goShipmentStatus.do'">- 선적현황</a></li>
							<li><a onclick="location.href=goCustomsStatus.do'">- 통관현황</a></li>
							<li><a href="#">- CY현황</a></li>
							<li><a href="#">- 입고현황</a></li>
							<li><a href="#">- 컨테이너 반납현황</a></li>
						</ul>
					</li>

					<li class="uk-parent">
						<a href="240_etc_manage.html">기타관리</a>
						<ul class="uk-nav-sub" hidden="">
							<li><a href="240_etc_manage.html">- 준공서류 관리</a></li>
							<li><a href="241_all_warehouse.html">- 전체 출/입고 현황</a></li>
							<li><a onclick="location.href='warehouseManage.do'">- 창고관리</a></li>		
							<li><a onclick="location.href='goInvetoryManage.do'">- 창고별 재고관리</a></li>
							<li><a onclick="location.href='goInventoryStatus.do'">- 창고별 재고현황</a></li>
							<li><a onclick="location.href='safetyManage.do'">- 안전 재고 관리</a></li>
							<li><a onclick="location.href='productRegists.do'">- 제품 등록 관리</a></li>
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
			<h2 class="normal">CY현황</h2>
			<div id="content">
				<!-- search box -->
				<div class="cont-box pt19">
					<div class="h3-title blue">
						<h3 class="normal"><i class="s-order"></i> 상세/운송</h3>
					</div>

					<!-- 컨테이너 정보 -->
					<div class="rows dl-box">
						<h4 class="dl-box-h4">컨테이너 정보</h4>
						<article class="inner-p wd70">
							<dl class="row col-2">
								<dt>법인</dt>
								<dd> <input type="text" class="wd210p disable"> </dd>
							</dl>
							<dl class="row col-4">
								<dt>출항일(ETD)</dt>
								<dd> <input type="date" class="wd140p disable"> </dd>
								<dt>도착일(ETA)</dt>
								<dd> <input type="date" class="wd140p disable"> </dd>
							</dl>
							<dl class="row col-2">
								<dt>Port</dt>
								<dd> <input type="text" class="wd210p disable"> </dd>
							</dl>
							<dl class="row col-4">
								<dt>DEM</dt>
								<dd> <input type="date" class="wd140p disable"> </dd>
								<dt>DET</dt>
								<dd> <input type="date" class="wd140p disable"> </dd>
							</dl>
							<dl class="row col-2">
								<dt>창고 <i class="essen">*</i></dt>
								<dd>
									<select title="" class="wd210p">
										<option value="">--선택--</option>
									</select>
								</dd>
							</dl>
							<dl class="row col-2">
								<dt>BL 번호</dt>
								<dd> <input type="text" class="wd210p disable"> </dd>
							</dl>
							<dl class="row col-2">
								<dt class="al-start">제품</dt>
								<dd>
									<div class="bbs pd0 wd800p">
										<table class="tb-inner">
											<colgroup>
												<col>
												<col>
												<col class="wd30">
												<col>
												<col>
											</colgroup>
											<thead>
												<tr>
													<th>컨테이너번호</th>
													<th>제품코드</th>
													<th>제품정보</th>
													<th>수량(장)</th>
													<th>㎡</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>TCKU7298900 </td>
													<td>30S-1</td>
													<td>
														<div class="tb-prd-info center">
															<span class="color-violet wd15">300T</span>
															<span class="color-green">M(1,000 * 1,200)</span>
														</div>
													</td>
													<td>356</td>
													<td>527.04</td>
												</tr>
											</tbody>
										</table>
									</div>
								</dd>
							</dl>
						</article>
					</div>


					<!-- 거래처 정보 -->
					<div class="rows dl-box line-t">
						<h4 class="dl-box-h4">거래처 정보</h4>
						<article class="inner-p wd70">
							<dl class="row col-2">
								<dt>거래처 </dt>
								<dd> <input type="text" class="wd210p disable"> </dd>
							</dl>
							<dl class="row col-2">
								<dt>담당자<i class="essen">*</i></dt>
								<dd>
									<select title="" class="wd210p">
										<option value="">--담당자 선택--</option>
										<option value="">담당자1</option>
									</select>
								</dd>
							</dl>
							<dl class="row col-2">
								<dt>납기일<i class="essen">*</i></dt>
								<dd><input type="date" class="wd140p"></dd>
							</dl>
							<dl class="row col-2">
								<dt>시간<i class="essen">*</i></dt>
								<dd>
									<select title="" class="wd140p">
										<option value="">오전 </option>
									</select>
									<select title="" class="wd70p">
										<option value="">00 </option>
									</select>
									<span>시</span>
									<select title="" class="wd70p">
										<option value="">00 </option>
									</select>
									<span>분</span>
								</dd>
							</dl>
							<dl class="row col-2">
								<dt>현장 전화번호 <i class="essen">*</i></dt>
								<dd><input type="text" class="wd210p" placeholder="-제외 숫자만 입력"></dd>
							</dl>
							<dl class="row col-2">
								<dt>컨테이너 운송사 <i class="essen">*</i></dt>
								<dd>
									<select title="" class="wd210p">
										<option value="">-- 선택--</option>
									</select>
								</dd>
							</dl>
							<dl class="row col-2">
								<dt class="al-start">주소<i class="essen">*</i></dt>
								<dd>
									<div class="d-flex wd100 gap10">
										<select name="" id="" class="wd180p">
											<option value="">시도 선택</option>
										</select>
										<select name="" id="" class="wd180p">
											<option value="">시군구 선택</option>
										</select>
										<select name="" id="" class="wd180p">
											<option value="">읍면동 선택</option>
										</select>
									</div>
									<input type="text" class="wd560p" placeholder="상세주소">
								</dd>
							</dl>
						</article>
					</div>



					<div class="dl-buttons">
						<button class="btn bg_color3 small wd120p">취소</button>
						<button class="btn bg_color1 small wd120p">저장</button>
						<button class="btn bg_color5 small wd120p">운송요청</button>
					</div>
				</div>
			</div>
		</div>
		<!-- s:container -->
	</div>
</body>
</html>