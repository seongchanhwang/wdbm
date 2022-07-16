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
							<li><a onclick="location.href='productRegists.do'">- 제품 등록 관리</a></li>
							<li class="uk-open"><a onclick="location.href='creditList.do'">- 여신 관리</a></li>
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
			<h2 class="normal">오더하기</h2>
			<div id="content">
				<!-- search box -->
				<div class="cont-box">
					<article class="inner">
						<dl class="row col-6">
							<dt>출항일</dt>
							<dd><input type="date" class="wd140p"></dd>
							<dt>Port</dt>
							<dd>
								<select name="" id="" class="wd200p">
									<option value="">출발항 -> 도착항 선택</option>
									<option value="">QD -> PT</option>
								</select>
							</dd>
							<dt></dt>
							<dd></dd>
						</dl>
						<dl class="row col-6">
							<dt>제조사</dt>
							<dd>
								<select name="" id="" class="wd190p">
									<option value="">--선택--</option>
								</select>
							</dd>
							<dt>창고</dt>
							<dd>
								<select name="" id="" class="wd190p">
									<option value="">100</option>
								</select>
							</dd>
							<dt></dt>
							<dd></dd>
						</dl>
						<dl class="row col-6">
							<dt>제품명</dt>
							<dd>
								<select name="" id="" class="wd190p">
									<option value="">--선택--</option>
								</select>
							</dd>
							<dt>제품 두께</dt>
							<dd>
								<select name="" id="" class="wd190p">
									<option value="">35</option>
								</select>
								<span>T</span>
							</dd>
							<dt>제품 사이즈</dt>
							<dd>
								<select name="" id="" class="wd190p">
									<option value="">M (1,000 x 1,200)</option>
								</select>
							</dd>
						</dl>
						<dl class="row col-2">
							<dt>수량</dt>
							<dd>
								<input type="text" class="wd120p">
								<span>장</span>
							</dd>
						</dl>
					</article>

					<div class="dl-buttons mt30">
						<button class="btn bg_color2 small wd120p">추가</button>
						<button class="btn bg_color1 small wd120p">등록</button>
					</div>
				</div>

				<!-- search result box -->
				<div class="cont-box mt30">
					<!-- table -->
					<div class="bbs">
						<h3 class="normal">주문리스트</h3>
						<div class="d-flex right gap10 mb16">
							<button class="btn bg_color4 small">선택삭제</button>
						</div>
						<table class="b-list">
							<caption></caption>
							<colgroup>
								<col class="wd3">
								<col class="wd11">
								<col class="wd11">
								<col class="wd11">
								<col class="wd11">
								<col>
								<col class="wd13">
								<col class="wd11">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">&nbsp;</th>
									<th scope="col">출항일 </th>
									<th scope="col">Port</th>
									<th scope="col">제조사</th>
									<th scope="col">창고</th>
									<th scope="col">제품정보</th>
									<th scope="col">수량(장)</th>
									<th scope="col">CTN</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="radio" name="" id=""></td>
									<td>2022-03-21</td>
									<td>QD - PT</td>
									<td>HH</td>
									<td>인천창고</td>
									<td>
										<div class="tb-prd-info center wd190p">
											<span class="wd12">KS</span>
											<span class="color-violet wd15">30T</span>
											<span class="color-green">M(1,000 * 1,200)</span>
										</div>
									</td>
									<td>2파렛 5장</td>
									<td>1CTN</td>
								</tr>
								<tr>
									<td><input type="radio" name="" id=""></td>
									<td>2022-03-21</td>
									<td>QD - PT</td>
									<td>HH</td>
									<td>인천창고</td>
									<td>
										<div class="tb-prd-info center wd190p">
											<span class="wd12">KS</span>
											<span class="color-violet wd15">30T</span>
											<span class="color-green">M(1,000 * 1,200)</span>
										</div>
									</td>
									<td>2파렛 5장</td>
									<td>1CTN</td>
								</tr>
								<tr>
									<td><input type="radio" name="" id=""></td>
									<td rowspan="2">2022-03-21</td>
									<td rowspan="2">QD - PT</td>
									<td rowspan="2">HH</td>
									<td rowspan="2" class="line">직송</td>
									<td>
										<div class="tb-prd-info center wd190p">
											<span class="wd12">KS</span>
											<span class="color-violet wd15">30T</span>
											<span class="color-green">M(1,000 * 1,200)</span>
										</div>
									</td>
									<td>2파렛 5장</td>
									<td>1CTN</td>
								</tr>
								<tr>
									<td><input type="radio" name="" id=""></td>
									<td>
										<div class="tb-prd-info center wd190p">
											<span class="wd12">KS</span>
											<span class="color-violet wd15">30T</span>
											<span class="color-green">M(1,000 * 1,200)</span>
										</div>
									</td>
									<td>2파렛 5장</td>
									<td>1CTN</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="dl-buttons mt50">
						<button class="btn bg_color1 small wd120p">주문</button>
					</div>
				</div>

			</div>
		</div>
		<!-- s:container -->
	</div>
</body>
</html>