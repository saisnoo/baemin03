<%@page import="com.baemin.orderlist.Order_MenuDTO"%>
<%@page import="com.baemin.util.Ht2List"%>
<%@page import="com.baemin.orderlist.cart.CartMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ Cart.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>Cart.jsp</title>

<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
<!-- CDN - Google Icons -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- CDN - jquery 3.4.1 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
* {
	margin: 0px;
	padding: 0px;
}

#buttonbar {
	position: fixed;
	bottom: 90px;
}
</style>
<script>
	// 스크립트
</script>
</head>
<body>
	<%
		Object cart_shop_no_ob = session.getAttribute("cart_shop_no");
		System.out.println("cart_shop_no_ob=" + cart_shop_no_ob);
		String cart_shop_no_ = cart_shop_no_ob + "";
		cart_shop_no_ = cart_shop_no_.trim();
		System.out.println("cart_shop_no_=" + cart_shop_no_);
		int cart_shop_no = -1;

		if (cart_shop_no_ob == null) {
			CartMgr cart = new CartMgr();
			session.setAttribute("cart", cart);
			session.setAttribute("cart_shop_no", -1);
		} else {
			cart_shop_no = Integer.parseInt(cart_shop_no_);
		}
	%>
	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>

	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<div class="sw-center">

		<!-- 가로복 제한 400~1200 ---------------------------------------------------------------------------------->
		<div class="sw-container-500">
			<!-- 3 main content start here!!!----------------------------------------------------------- -->
			<div id="whereCartContentLoad"
				class="w3-card-4 w3-center w3-margin w3-round-large">

				<!-- --------------------------------------------------------------- -->
				<!-- -------------    이곳에 장바구니가 load 됩니다.    ---------------------- -->
				<!-- --------------------------------------------------------------- -->


			</div>
		</div>
	</div>

	<!--  buttonbar position fix-->
	<div id="buttonbar" class="w3-row w3-center" style="width: 100%;">
		<div class="w3-row-padding sw-container-500">
			<c:if test="${cart.getCartList().size()>0}">
				<div class="w3-col s6">
					<button class="w3-button w3-baemint w3-block w3-card" type="button"
						onclick="comfirmOrder()">
						<span id="totalPrice">---</span> <span>원 결제</span>
					</button>
				</div>
				<div class="w3-col s6">
					<button class="w3-button w3-baemint w3-block w3-card" type="button"
						onclick="back2shop()">+ 더 주문하기</button>
					<input type="hidden" id="shop_no" value="" />
				</div>
			</c:if>
		</div>
	</div>
	<!--  buttonbar position fix-->


	<script>
		window.onload = function() {
			loadCartContent();
			setTimeout(loadCartContent, 300);
		}

		function comfirmOrder() {
			console.log("주문 완료");
			//location.href = "OrderPro.jsp";
			document.getElementById("commentInputModal").style.display = 'block';
		}

		function back2shop() {
			var shop_No = document.getElementById("shop_no").value;

			if (shop_No.trim().length < 1) {
				location.href = "Main.jsp";
			} else {
				location.href = "ShopPage.jsp?shopNo=" + shop_No;
			}

		}

		function loadCartContent() {
			$("#whereCartContentLoad").load("CartContent.jsp");
			setTimeout(function() {
				var a1 = document.getElementById("cart_total").innerText;
				document.getElementById("totalPrice").innerText = a1;
				var a2 = document.getElementById("cart_shop_no").innerText;
				document.getElementById("shop_no").value = a2;
			}, 200)
		}
	</script>

	<div id="commentInputModal" class="w3-modal w3-border">
		<div class="w3-modal-content">
			<div class="w3-container">
				<form action="OrderPro.jsp" method="post">
					<input type="text" name="comment" id="comment" class="w3-input" />
					<input type="submit" id="go2OrderPro" class="w3-input"
						value="진짜주문하자" />

				</form>
			</div>
		</div>
	</div>



	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>
	<div class="sw-topnav-margin">&nbsp;</div>
	<%-- 사이트 공통 부분 Include - topnav --%>
	<jsp:include page="../sw_css/memberTopNav.jsp" />
</body>
</html>
