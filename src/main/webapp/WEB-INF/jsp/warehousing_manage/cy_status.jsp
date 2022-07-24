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
							<li><a onclick="location.href='goOrderManage.do'">- 재고조회</a></li>
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
				<div class="cont-box">
					<article class="inner">
						<dl class="row col-6">
							<dt>운송일</dt>
							<dd>
								<input type="date" class="wd140p">
								<span>~</span>
								<input type="date" class="wd140p">
							</dd>
							<dt>ETD</dt>
							<dd>
								<input type="date" class="wd140p">
								<span>~</span>
								<input type="date" class="wd140p">
							</dd>
							<dt>DEM</dt>
							<dd>
								<input type="date" class="wd140p">
								<span>~</span>
								<input type="date" class="wd140p">
							</dd>
						</dl>
						<dl class="row col-6">
							<dt>Port</dt>
							<dd>
								<select name="" id="" class="wd210p">
									<option value="">출발항 -&gt; 도착항 선택</option>
									<option value="">QD -&gt; PT</option>
								</select>
							</dd>
							<dt>창고</dt>
							<dd>
								<select name="" id="" class="wd210p">
									<option value="">--선택--</option>
								</select>
							</dd>
							<dt>운송사</dt>
							<dd>
								<select name="" id="" class="wd210p">
									<option value="">--선택--</option>
								</select>
							</dd>
						</dl>
						<dl class="row col-6">
							<dt>BL번호</dt>
							<dd><input type="text" class="wd210p"></dd>
							<dt>컨테이너 번호</dt>
							<dd><input type="text" class="wd210p"></dd>
							<dt>제품코드</dt>
							<dd>
								<select name="" id="" class="wd190p">
									<option value="">--선택--</option>
								</select>
							</dd>
						</dl>
					</article>

					<div class="dl-buttons mt30">
						<button class="btn bg_color3 small wd120p">초기화</button>
						<button class="btn bg_color1 small wd120p">검색</button>
					</div>
				</div>

				<!-- search result box -->
				<div class="cont-box mt30">
					<!-- table -->
					<div class="bbs">
						<div class="d-flex right mb16">
							<button class="btn bg_color1 small ico list wd120p"
								onclick="location.href='234_cy_status_view.html'">상세 / 운송</button>
						</div>
						<table class="b-list">
							<caption></caption>
							<colgroup>
								<col class="wd3">
								<col class="wd7">
								<col class="wd7">
								<col class="wd7">
								<col class="wd6">
								<col class="wd9">
								<col>
								<col>
								<col class="wd9">
								<col class="wd8">
								<col class="wd8">
								<col class="wd8">
								<col class="wd8">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">&nbsp;</th>
									<th scope="col">운송일</th>
									<th scope="col">ETD</th>
									<th scope="col">ETA</th>
									<th scope="col">Port</th>
									<th scope="col">창고</th>
									<th scope="col">BL 번호</th>
									<th scope="col">컨테이너 번호</th>
									<th scope="col">제품코드</th>
									<th scope="col">수량(장)</th>
									<th scope="col">CTN</th>
									<th scope="col">DEM</th>
									<th scope="col">운송사</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td rowspan="2"><input type="radio" name="" id=""></td>
									<td rowspan="2"><b>2022-04-30</b></td>
									<td rowspan="2">2022-04-30</td>
									<td rowspan="2">2022-04-30 </td>
									<td rowspan="2">QD – PT</td>
									<td rowspan="2">평택창고</td>
									<td rowspan="2">HTFRZHPTK71614</td>
									<td rowspan="2" class="line">TCKU7298900</td>
									<td>30S-1</td>
									<td>100</td>
									<td>1</td>
									<td>2022-05-03</td>
									<td rowspan="2">운송사 1</td>
								</tr>
								<tr>
									<td>30S-1</td>
									<td>100</td>
									<td>0.3</td>
									<td>2022-05-03</td>
								</tr>
								<tr>
									<td><input type="radio" name="" id=""></td>
									<td rowspan="2"><b>2022-04-30</b></td>
									<td>2022-04-30 </td>
									<td>2022-04-30</td>
									<td>QD – PT</td>
									<td>평택창고</td>
									<td>HTFRZHPTK71614 </td>
									<td>TCKU7298900 </td>
									<td>30S-1</td>
									<td>100</td>
									<td>0.7</td>
									<td>2022-05-03</td>
									<td>운송사 1</td>
								</tr>
							</tbody>
						</table>

						<!-- pager -->
						<div class="pager txt-right">
							<select name="" id="">
								<option value="">10개보기</option>
							</select>
							<a class="arr prev" href="#">이전</a>
							<strong class="active">1</strong>
							<a href="#">2</a>
							<a href="#">3</a>
							<a href="#">4</a>
							<a href="#">5</a>
							<a class="arr next" href="#">다음</a>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!-- s:container -->
	</div>
</body>
</html>