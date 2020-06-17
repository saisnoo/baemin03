<%@page import="com.baemin.orderlist.OrderListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--  태그를 이용해서 제어문 처리하도록 하는 설정  --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CDN - jquery 3.4.1 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- CDN - Google Icons -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Insert title here</title>
</head>
<body>

	<%-- request객체에 담기 --%>
	<%
		String no_ = session.getAttribute("no") + "";
		int memberNo = Integer.parseInt(no_.trim());

		OrderListDAO dao = OrderListDAO.getInstance();
		request.setAttribute("list", dao.getListByMember_No(memberNo));
	%>

	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>
	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<form method="post" action="UpdateClientPro.jsp">
		<div class="sw-center" style="margin-top: 1%">
			<!-- 가로복 제한 400~1200 ---------------------------------------------------------------------------------->
			<!-- 400~1200 사이로 조절 가능 ---------------------------------------------------------------------------------->
			<div class="sw-container-500">
				<div class="w3-container">
					<!--  main content start here!!!----------------------------------------------------------- -->

					<!--주문 내역 리스트-->
					<div class="w3-container w3-card">
						<div class="w3-section w3-row w3-center w3-border-bottom">
							<a href="../memberClient/MyPageClient.jsp"
								class="w3-button w3-left" style="vertical-align: middle;"> <i
								class="material-icons" style="font-size: 30px;">arrow_back</i>
							</a>
							<h2 style="display: inline; margin: 0px">주문내역</h2>
						</div>

						<!-- 반복의 시작 -->
						<c:forEach items="${ list }" var="dto">

							<div class="w3-container w3-section w3-border-bottom">
								<div class="w3-row">
									<label style="color: gray; margin-top: 10px;">
										${dto.orderDate }</label>
									<!-- --------------------------------------------------------------------- -->
									<label class="w3-right">${dto.whyCancel }</label><br>
									<!-- --------------------------------------------------------------------- -->
									<label class="w3-right" style="color: red">( 재료소진 )</label>
								</div>
								<h4>${dto.shop_No }</h4>
								<label>${dto.menuString }</label>

								<div class="w3-section w3-center">
									<input type="button" class="w3-button w3-block w3-border"
										onClick="#" value="가게보기">
								</div>
							</div>
						</c:forEach>
						<!-- 반복의 끝 -->

					</div>
					<!-- main content end----------------------------------------------------------------------- -->
				</div>
			</div>
		</div>
	</form>
	<!-- main content end----------------------------------------------------------------------- -->



	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>
	<div class="sw-topnav-margin">&nbsp;</div>
	<%-- 사이트 공통 부분 Include - topnav --%>
	<jsp:include page="../sw_css/memberTopNav.jsp" />
</body>
</html>