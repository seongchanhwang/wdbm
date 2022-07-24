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
	<script src="../../../js/dashboard/dashboard.js"></script>
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
					<li class=""><a onclick="location.href='goDashboard.do'">대시보드</a></li>
					<li class="uk-parent uk-open">
						<a href="220_order_manage.html">주문관리 </a>
						<ul class="uk-nav-sub" hidden="">
							<li><a onclick="location.href='goOrderManage.do'">- 재고조회</a></li>
							<li class="uk-open"><a href="#">- 주문현황</a></li>
							<li><a href="#">- 직송현황</a></li>
							<li><a href="#">- 예약내역</a></li>
						</ul>
					</li>
					<li class="uk-parent">
						<a href="230_warehouse_manage.html">입고관리 </a>
						<ul class="uk-nav-sub" hidden="">
							<li><a onclick="location.href='manageOrder.do'">- 오더하기</a></li>
							<li><a onclick="location.href='orderlist.do'">- 오더내역</a></li>
							<li><a onclick="location.href=goShipmentStatus.do'">- 선적현황</a></li>
							<li><a href="#">- 통관현황</a></li>
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
			<h2 class="normal">주문현황</h2>
			<div id="content">
				<!-- search box -->
				<div class="cont-box pt19">
					<div class="h3-title blue">
						<h3 class="normal"><i class="s-order"></i>발주내역 상세 / 수정</h3>
					</div>

					<!-- 발주 정보 -->
					<div class="rows dl-box">
						<h4 class="dl-box-h4">발주 정보</h4>
						<article class="inner-p wd90">
							<dl class="row col-2">
								<dt>거래처명</dt>
								<dd>㈜ 에코포라인</dd>
							</dl>
							<dl class="row col-2">
								<dt>담당자</dt>
								<dd>
									<select title="" class="wd210p">
										<option value="">--담당자 선택--</option>
										<option value="">담당자1</option>
									</select>
								</dd>
							</dl>
							<dl class="row col-2">
								<dt>납기일</dt>
								<dd>
									<input type="date" class="wd140p">
									<span class="state-circle green">배차완료</span>
								</dd>
							</dl>
							<dl class="row col-2">
								<dt>시간</dt>
								<dd>
									<select title="" class="wd200p">
										<option value="">당착 최대한 빨리</option>
										<option value="">오전 06:00</option>
										<option value="">오전 06:30</option>
										<option value="">오전 07:00</option>
										<option value="">오전 07:30</option>
										<option value="">오전 08:00</option>
										<option value="">오전 08:30</option>
										<option value="">오전 09:00(대기료 발생)</option>
										<option value="">오전 09:30(대기료 발생)</option>
										<option value="">오전 11:00</option>
										<option value="">오전 11:30</option>
										<option value="">오전 12:00</option>
										<option value="">오전 12:30</option>
										<option value="">오후 01:00</option>
										<option value="">오후 01:30</option>
										<option value="">오후 02:00</option>
										<option value="">오후 02:30</option>
										<option value="">오후 03:00</option>
										<option value="">오후 03:30</option>
										<option value="">오후 04:00</option>
										<option value="">오후 04:30</option>
										<option value="">직접입력(협의후 입력)</option>
									</select>
									<select title="" class="wd100p disable">
										<option value="">오전 </option>
									</select>
									<input type="text" class="wd50p disable">
									<span>시</span>
									<input type="text" class="wd50p disable">
									<span>분</span>
								</dd>
							</dl>
							<dl class="row col-2">
								<dt>창고</dt>
								<dd>
									<input type="text" class="wd200p disable" value="평택창고">
								</dd>
							</dl>
							<dl class="row col-2">
								<dt class="al-start">제품</dt>
								<dd>
									<div class="bbs pd0 wd800p">
										<table class="tb-inner">
											<colgroup>
												<col class="wd40">
												<col>
												<col>
												<col>
												<col class="wd5">
											</colgroup>
											<thead>
												<tr>
													<th>제품정보</th>
													<th>수량(장)</th>
													<th>㎡ </th>
													<th>제품금액(원)</th>
													<th class="blank">&nbsp;</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>
														<div class="tb-prd-info center">
															<span class="wd12">비KS</span>
															<span class="color-violet wd15">300T</span>
															<span class="color-green">M(1,000 * 1,200)</span>
														</div>
													</td>
													<td><input type="text" class="wd100"></td>
													<td>100.00</td>
													<td>1,000,000</td>
													<td class="blank">
														<a href="#" class="btn-del">삭제</a>
													</td>
												</tr>
												<tr>
													<td>
														<div class="tb-prd-info center">
															<span class="wd12">비KS</span>
															<span class="color-violet wd15">300T</span>
															<span class="color-green">M(1,000 * 1,200)</span>
														</div>
													</td>
													<td><input type="text" class="wd100"></td>
													<td>100.00</td>
													<td>1,000,000</td>
													<td class="blank">
														<a href="#" class="btn-del">삭제</a>
													</td>
												</tr>
											</tbody>
										</table>
								</dd>
							</dl>
							<dl class="row col-2">
								<dt>공급가액</dt>
								<dd>
									<input type="text" class="wd200p txt-right disable" value="100,000,000">
									<span>원</span>
								</dd>
							</dl>
							<dl class="row col-4">
								<dt>예상운반비</dt>
								<dd>
									<input type="text" class="wd200p txt-right disable" value="100,000,000">
									<span>원</span>
								</dd>
								<dt>확정운반비</dt>
								<dd>
									<input type="text" class="wd200p txt-right disable color-blue" value="100,000,000">
									<span>원</span>
								</dd>
							</dl>
							<dl class="row col-2">
								<dt class="al-start">주소</dt>
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
							<dl class="row col-4">
								<dt>현장 전화번호 <i class="essen">*</i></dt>
								<dd><input type="text" class="wd210p" placeholder="-제외 숫자만 입력"></dd>
								<dt>자차 여부</dt>
								<dd>
									<p class="d-flex wd100 gap10">
										<input type="radio" checked>
										<label for="">사용</label>
										<input type="radio">
										<label for="">사용하지 않음</label>
									</p>
								</dd>
							</dl>
							<dl class="row col-4">
								<dt class="al-start">특이사항</dt>
								<dd>
									<textarea name="" id="" placeholder="예) 5톤축차 진입불가" class="wd380p"></textarea>
								</dd>
								<dt class="al-start">자차정보 </dt>
								<dd>
									<textarea name="" id="" placeholder="예) 5톤 - 경기 89아 2539 이소룡 기사님
									 010-1234-1234 " class="wd380p disable"></textarea>
								</dd>
							</dl>
						</article>
					</div>

					<!-- 배차 정보 -->
					<div class="rows dl-box line-t">
						<h4 class="dl-box-h4">배차 정보</h4>
						<article class="inner-p wd90">
							<dl class="row col-4">
								<dt>차량톤수</dt>
								<dd>
									<p>
										<span>5톤</span>
										<input type="text" class="wd50p disable ml5 mr5">
										<span>대</span>
									</p>
									<p class="ml25">
										<span>1톤</span>
										<input type="text" class="wd50p disable ml5 mr5">
										<span>대</span>
									</p>
								</dd>
								<dt>회차비 </dt>
								<dd>
									<input type="text" class="wd200p txt-right disable" value="100,000,000">
									<span>원</span>
								</dd>
							</dl>
							<dl class="row col-4">
								<dt class="al-start">차량정보</dt>
								<dd>
									<textarea name="" id="" placeholder="" class="wd380p disable"></textarea>
								</dd>
								<dt class="al-start">운송사</dt>
								<dd>
									<select title="" class="wd200p">
									</select>
								</dd>
							</dl>
							<dl class="row col-2">
								<dt>송장</dt>
								<dd>
									<input type="text" class="wd270p disable">
									<button class="btn bg_color2 small ico down">다운로드</button>
								</dd>
							</dl>
						</article>
					</div>

					<!-- 발주서 정보 -->
					<div class="rows dl-box line-t">
						<h4 class="dl-box-h4">발주서 정보</h4>
						<article class="inner-p">
							<dl class="row col-2">
								<dt class="al-start">발주서</dt>
								<dd>
									<div class="wd100">
										<div class="d-flex gap10">
											<input type="text" class="wd270p disable">
											<button class="btn bg_color2 small ico down">다운로드</button>
											<button class="btn small outline">발주서 발행</button>
										</div>
										<div class="d-flex gap10 mt10">
											<input type="text" class="wd270p disable">
											<button class="btn bg_color2 small ico down">다운로드</button> <br>
										</div>
									</div>
								</dd>
							</dl>
						</article>
					</div>

					<div class="dl-buttons">
						<button class="btn bg_color3 small wd120p">취소</button>
						<button class="btn bg_color1 small wd120p">저장</button>
						<button class="btn bg_color5 small wd120p" uk-toggle="target: #modalCannotChanged">배차요청</button>
					</div>
				</div>

			</div>
		</div>
		<!-- s:container -->
	</div>
</body>
</html>